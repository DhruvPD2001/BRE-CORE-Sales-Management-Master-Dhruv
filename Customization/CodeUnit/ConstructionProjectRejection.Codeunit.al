codeunit 53503 ConstructionProjectRejection
{

    procedure ConstructionProjectRejection(Rec: Record "Construction Project")
    var
        CompanyInfo: Record "Company Information";
        ConstructionProject: Record "Construction Project";
        UserRec: Record User; // Record for User
        Email: Codeunit "Email";
        EmailMessage: Codeunit "Email Message";
        ConstructionProjectLink: Text;
        useremail: List of [Text];
    begin

        ConstructionProject.Get(Rec."Project ID");
        UserRec.SetRange("User Name", ConstructionProject."Created By");
        if UserRec.FindFirst() then
            if UserRec."Contact Email" <> '' then
                useremail.Add(UserRec."Contact Email")
            else
                Error('User %1 does not have a valid email address.', UserRec."User Name");


        if Rec.Get(Rec."Project ID") then begin
            ConstructionProject.Get(Rec."Project ID");
            ConstructionProjectLink := GETURL(ClientType::Current, COMPANYNAME, ObjectType::Page, PAGE::"Construction Project", Rec);
            if CompanyInfo.get() then begin
                EmailMessage.Create(useremail, 'Construction Project Rejection Notification - ' + ConstructionProject."Project ID",
                '<html>' +
                '<body>' +
                '<p>Dear ' + UserRec."Full Name" + ',</p>' +
                '<h3>Construction Project Details</h3>' +
                '<p><b>Project ID:</b> ' + ConstructionProject."Project ID" + '<br/>' +
                '<b>Project Name:</b> ' + ConstructionProject."Project Name" + '<br/>' +
                 '<b>Reason for Rejection:</b> ' + Rec."Reason for Rejection" + '<br/>' +
                '<p>Please review the details and update the record at your earliest convenience.</p>' +
                '<p><a href="' + ConstructionProjectLink + '" target="_blank">Click here to view the Construction Project</a></p>' +
                '<p>Best regards,<br/>' + CompanyInfo.Name + '</p>' +
                '</body>' +
                '</html>',
                true);
                if Email.Send(EmailMessage) then
                    Message('Email sent successfully to: %1.', UserRec."User Name")
                else
                    Error('Failed to send email.');
            end;
        end else
            Error('Construction Project not found.');
    end;
}