codeunit 50507 "SendSalesPerson Tasks Today"
{
    procedure SendSalesPersonTasks()
    var
        ToDo: Record "To-do";
        Salesperson: Record "Salesperson/Purchaser";
        CompanyInfo: Record "Company Information";
        Today: Date;
        LastSalesperson: Code[20];
        SalespersonEmail: Text;
        SalespersonName: Text;
        Tasks: Text;
        EmailBody: Text;
    begin
        Today := Today();
        CompanyInfo.Get();

        // Filter for today's To-Dos and only for Salespersons
        ToDo.SetRange("Date", Today);
        ToDo.SetFilter("Salesperson Code", '<>%1', '');
        ToDo.SetFilter(Status, '<>%1', ToDo.Status::Completed);
        ToDo.SetCurrentKey("Salesperson Code");

        if ToDo.FindSet() then begin
            repeat
                // If salesperson changes, send the email for previous one
                if (LastSalesperson <> ToDo."Salesperson Code") and (Tasks <> '') then begin
                    EmailBody := BuildEmailBody(SalespersonName, Tasks);
                    SendTasksEmail(LastSalesperson, EmailBody, SalespersonEmail);
                    Tasks := '';
                end;

                // Get Salesperson details
                if LastSalesperson <> ToDo."Salesperson Code" then begin
                    LastSalesperson := ToDo."Salesperson Code";
                    if Salesperson.Get(LastSalesperson) then begin
                        SalespersonEmail := Salesperson."E-Mail";
                        SalespersonName := Salesperson.Name;
                    end;
                end;

                // Build task list row
                Tasks +=
                  '<tr>' +
                  '<td>' + Format(ToDo."No.") + '</td>' +
                  '<td>' + Format(ToDo."Date") + '</td>' +
                  '<td>' + ToDo.Description + '</td>' +
                  '<td>' + ToDo."Contact No." + '</td>' +
                  '<td><a href="' + GetTaskLink(ToDo) + '" target="_blank" ' +
                      'style="display:inline-block;padding:4px 12px;' +
                      'background-color:#0078D7;color:#fff;text-decoration:none;border-radius:4px;">Open Task</a></td>' +
                  '</tr>';
            until ToDo.Next() = 0;

            // Send last salesperson's email
            if (Tasks <> '') and (SalespersonEmail <> '') then begin
                EmailBody := BuildEmailBody(SalespersonName, Tasks);
                SendTasksEmail(LastSalesperson, EmailBody, SalespersonEmail);
            end;
        end;

    end;

    local procedure GetTaskLink(ToDo: Record "To-do"): Text
    var
        URL: Text;
    begin
        // Construct a link to the To-Do record in Business Central
        URL := GETURL(ClientType::Current, COMPANYNAME, ObjectType::Page, PAGE::"Task Card", ToDo);
        exit(URL);
    end;

    local procedure BuildEmailBody(SalespersonName: Text; Tasks: Text): Text
    var
        Body: Text;
    begin
        Body :=
          'Dear ' + SalespersonName + ',<br/><br/>' +
          'Here are your tasks for today:<br/><br/>' +
          '<table border="1" cellpadding="6" cellspacing="0" style="border-collapse:collapse;">' +
          '<tr style="background-color:#f2f2f2;">' +
          '<th>No.</th><th>Date</th><th>Description</th><th>Contact No.</th><th>Task Link</th>' +
          '</tr>' +
          Tasks +
          '</table><br/><br/>' +
          'Best regards,<br/>' +
          CompanyName();
        exit(Body);
    end;

    local procedure SendTasksEmail(SalespersonCode: Code[20]; EmailBody: Text; EmailAddress: Text)
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        Subject: Text;
    begin
        if EmailAddress = '' then
            exit;

        Subject := 'Your Tasks for Today - ' + Format(Today());
        EmailMessage.Create(EmailAddress, Subject, EmailBody, true);
        Email.Send(EmailMessage);
    end;


}