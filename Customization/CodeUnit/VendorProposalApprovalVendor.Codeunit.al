codeunit 53504 VendorProposalApprovalVendor
{

    procedure VendorProposalApproval(Rec: Record "Vendor Proposal")
    var
        CompanyInfo: Record "Company Information";
        VendorProposal: Record "Vendor Proposal";
        Email: Codeunit "Email";
        EmailMessage: Codeunit "Email Message";
    begin
        VendorProposal.Get(Rec."Proposal ID");

        if CompanyInfo.get() then begin
            EmailMessage.Create(VendorProposal."Vendor Email", 'Vendor Proposal Approval Request - ' + VendorProposal."Proposal ID" + ' for Project ' + VendorProposal."Project ID",
            '<html>' +
                         '<body>' +
                         '<p>Dear ' + VendorProposal."Vendor Name" + ',</p>' +
                         '<h3>Vendor Proposal Details</h3>' +
                          '<p>We hope this message finds you well.' + '<br/>' +
                           'The Proposal ' + VendorProposal."Proposal ID" + ' related to project ' + VendorProposal."Project ID" + ' is now ready for your review and approval.' + '<br/>' +
                           'Please find the proposal details below:' + '<br/>' +
                          '<b>Proposal ID:</b> ' + VendorProposal."Proposal ID" + '<br/>' +
                         '<b>Proposal Date:</b> ' + Format(VendorProposal."Proposal Date") + '<br/>' +
                          '<b>Vendor ID:</b> ' + VendorProposal."Vendor ID" + '<br/>' +
                        '<b>Project ID:</b> ' + Format(VendorProposal."Project ID") + '<br/>' +
                        '<b>Project Name:</b> ' + VendorProposal."Project Name" + '<br/>' +
                        '<b>Project Location:</b> ' + VendorProposal."Project Location" + '<br/>' +
                        '<b>Proposed Contract Start Date:</b> ' + Format(VendorProposal."Start Date") + '<br/>' +
                        '<b>Proposed Contract End Date:</b> ' + Format(VendorProposal."End Date") + '<br/>' +
                        '<b>Total Contract Value:</b> ' + Format(VendorProposal."Total Contract Value (AED)") + '</p>' +
                      '<p>Please log into the Vendor Portal to review the proposal details and approve or refer it back with comments.' + '<br/>' +
                         'If you have any questions or need assistance accessing the portal, please feel free to contact us.' + '<br/>' +
                         'Thank you for your cooperation.</p>' +
                         '<p>Best regards,<br/>' + CompanyInfo.Name + '</p>' +
                        '</body>' +
                        '</html>',
                        true);

            if Email.Send(EmailMessage) then
                Message('Email sent successfully to the Vendor: %1.', VendorProposal."Vendor Name")
            else
                Error('Failed to send email.');
        end;
    end;

}