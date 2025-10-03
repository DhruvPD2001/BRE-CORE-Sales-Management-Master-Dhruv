codeunit 53506 "ApprovalSalesProposal"
{
    procedure SubmitVendorProposal(var SalesProposalRec: Record "Sales Proposal")
    var
        CompanyInfo: Record "Company Information";
        UserRec: Record User;
        UserPersonalizationRec: Record "User Personalization";
        ApprovalStatusList: Record "Approval Sales Proposal";
        EmailMessage: Codeunit "Email Message";
        Email: Codeunit "Email";
        EmailList: List of [Text];
        LeaseManagerName: Text;
        EmailBody: Text;
    begin
        // Insert new record in Approval Request list
        ApprovalStatusList.Init();
        ApprovalStatusList."Sales Proposal ID" := SalesProposalRec."Proposal No.";
        ApprovalStatusList."Customer No." := SalesProposalRec."Customer No.";
        ApprovalStatusList."Created By" := SalesProposalRec.SystemCreatedBy;
        ApprovalStatusList.Status := 'Pending';
        ApprovalStatusList.Insert();

        // 🔄 Update status of Vendor Contract to Pending
        SalesProposalRec.Status := SalesProposalRec."Approval Status"::Submitted;

        // Prepare email to Lease Managers
        LeaseManagerName := '';

        UserPersonalizationRec.SetRange("Profile ID", 'SALES MANAGER');
        if UserPersonalizationRec.FindSet() then
            repeat
                if UserRec.Get(UserPersonalizationRec."User SID") then
                    if UserRec."Contact Email" <> '' then begin
                        EmailList.Add(UserRec."Contact Email");
                        if LeaseManagerName = '' then
                            LeaseManagerName := UserRec."User Name"
                        else
                            LeaseManagerName += ', ' + UserRec."User Name";
                    end;
            until UserPersonalizationRec.Next() = 0;

        if EmailList.Count = 0 then
            Error('No valid email addresses found for PROJECT MANAGER.');

        if CompanyInfo.Get() then begin
            EmailBody :=
                '<html><body>' +
                '<p>Dear <b>SALES MANAGER</b>,</p>' +
                '<p>This is an automated notification from the system.</p>' +
                '<p>A new sales proposal has been created in Business Central and requires your review.</p>' +
                '<p>' +
                '<b>Sales Proposal ID:</b> ' + Format(SalesProposalRec."Proposal No.") + '<br/>' +
                '<b>Customer No,:</b> ' + Format(SalesProposalRec."Customer No.") + '<br/>' +
                '<b>Proposal Date:</b> ' + Format(SalesProposalRec."Proposal Date") + '<br/>' +
                '<b>Opportunity No.</b> ' + SalesProposalRec."Opportunity No." + '<br/>' +
                '<b>Net price</b> ' + Format(SalesProposalRec."Net Price") + '<br/>' +
                '</p>' +
                '<p>Please review the <a href="' + GetTaskLink() + '" target="_blank" ' +
                      'style="display:inline-block;padding:4px 12px;' +
                      'background-color:#0078D7;color:#fff;text-decoration:none;border-radius:4px;">Approval Sals Proposal List</a> and take the necessary action.</p>' +
                '<p>This is a system-generated email. Please do not reply.</p>' +
                '<p>Thank you,</p>' +
                '</body></html>';



            EmailMessage.Create(
                    EmailList,
                    'System Notification: Action Required - Review Sales Proposal For Approval - Customer ID ' + Format(SalesProposalRec."Customer No."),
                    EmailBody,
                    true
                );

            if not Email.Send(EmailMessage) then
                Error('Email failed to send. Please check SMTP settings.');


        end;


    end;

    local procedure GetTaskLink(): Text
    var
        ApprovalSalesProposalList: Record "Approval Sales Proposal";
        URL: Text;

    begin
        // Construct a link to the To-Do record in Business Central
        URL := GETURL(ClientType::Current, COMPANYNAME, ObjectType::Page, PAGE::"Approval Sales Proposal List", ApprovalSalesProposalList);
        exit(URL);
    end;

}
