page 53253 "Vendor Proposal Approval List"
{
    PageType = List;
    SourceTable = "Vendor Proposal Approval";
    ApplicationArea = All;
    Caption = 'Vendor Proposal Approval List';
    UsageCategory = Lists;
    InsertAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("ID"; Rec."ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the unique identifier for the vendor proposal approval.';
                }
                field("Status"; Rec."Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the current approval status of the vendor proposal.';
                }
                field("Vendor Proposal ID"; Rec."Vendor Proposal ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unique identifier for the vendor proposal.';

                    trigger OnDrillDown()
                    var
                        TenancyContractRec: Record "Vendor Proposal";
                    begin
                        TenancyContractRec.SetRange("Proposal ID", Rec."Vendor Proposal ID");
                        if TenancyContractRec.FindFirst() then
                            PAGE.Run(PAGE::"Vendor Proposal", TenancyContractRec)
                        else
                            Message('The selected Contract ID (%1) does not exist in the Tenancy Contract table.', Rec."Vendor Proposal ID");
                    end;
                }

                field("Vendor ID"; Rec."Vendor ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unique identifier for the vendor.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the user who created the vendor proposal approval.';
                }
                field("Remark"; Rec."Remark")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies any remarks related to the vendor proposal approval.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Approve)
            {
                Caption = 'Approve';
                ApplicationArea = All;
                Image = Approve;
                Visible = IsPropertyManager;
                ToolTip = 'Approve the selected vendor proposal approval request.';

                trigger OnAction()
                var
                    SelectedRec: Record "Vendor Proposal Approval";
                    VendorProposalRec: Record "Vendor Proposal";
                    NotificationCodeunit: Codeunit "Vendor Proposal Notification";
                    VendorProposalApprovalVendor: Codeunit VendorProposalApprovalVendor;
                    RemarkDialog: Page "DialogBoxForInvoiceRejection";
                    RemarkText: Text;
                    DialogResult: Action;
                    RecipientEmail: Text;
                begin
                    if Rec.Status = 'Pending' then begin
                        DialogResult := RemarkDialog.RunModal();

                        if DialogResult = Action::OK then begin
                            RemarkText := RemarkDialog.GetReason();

                            if RemarkText <> '' then begin
                                // Update approval table
                                SelectedRec := Rec;
                                SelectedRec.Status := 'Approved';
                                SelectedRec.Remark := CopyStr(RemarkText, 1, StrLen(RemarkText));
                                SelectedRec.Modify();

                                VendorProposalRec.SetRange("Proposal ID", SelectedRec."Vendor Proposal ID");
                                if VendorProposalRec.FindSet() then
                                    repeat
                                        VendorProposalRec."Internal Remarks" := CopyStr(RemarkText, 1, StrLen(RemarkText));
                                        VendorProposalRec."Internal Approval Status" := VendorProposalRec."Internal Approval Status"::Approved;
                                        VendorProposalRec.Modify();
                                    until VendorProposalRec.Next() = 0;

                                RecipientEmail := NotificationCodeunit.SendApprovalEmail(
                                    SelectedRec."Vendor Proposal ID",
                                    SelectedRec."Created By",
                                    RemarkText
                                );

                                Commit();
                                CurrPage.Update();
                                Message('Request Approved Successfully with Remarks and Email Sent to: %1', RecipientEmail);
                                VendorProposalApprovalVendor.VendorProposalApproval(VendorProposalRec);
                                VendorProposalRec."Vendor Approval Status" := VendorProposalRec."Vendor Approval Status"::Pending;
                                VendorProposalRec.Modify(true);
                            end;
                        end;
                    end else
                        Message('Selected record is not in "Pending" status.');
                end;
            }


            action(Reject)
            {
                Caption = 'Reject';
                ApplicationArea = All;
                Image = Reject;
                Visible = IsPropertyManager;
                ToolTip = 'Reject the selected vendor proposal approval request.';

                trigger OnAction()
                var
                    SelectedRec: Record "Vendor Proposal Approval";
                    VendorProposalRec: Record "Vendor Proposal";
                    RemarkDialog: Page "DialogBoxForInvoiceRejection";
                    RemarkText: Text;
                    DialogResult: Action;
                begin
                    if Rec.Status = 'Pending' then begin
                        DialogResult := RemarkDialog.RunModal();

                        if DialogResult = Action::OK then begin
                            RemarkText := RemarkDialog.GetReason();

                            if RemarkText <> '' then begin
                                SelectedRec := Rec;
                                SelectedRec.Status := 'Declined';
                                SelectedRec.Remark := CopyStr(RemarkText, 1, StrLen(RemarkText));
                                SelectedRec.Modify();

                                VendorProposalRec.SetRange("Proposal ID", SelectedRec."Vendor Proposal ID");
                                if VendorProposalRec.FindSet() then
                                    repeat
                                        VendorProposalRec."Internal Remarks" := CopyStr(RemarkText, 1, StrLen(RemarkText));
                                        VendorProposalRec."Internal Approval Status" := VendorProposalRec."Internal Approval Status"::Rejected;
                                        VendorProposalRec.Modify();
                                    until VendorProposalRec.Next() = 0;

                                Commit();
                                CurrPage.Update();
                                Message('Request Rejected with Remark.');
                            end;
                        end;
                    end else
                        Message('Selected record is not in "Pending" status.');
                end;
            }
        }
        area(navigation)
        {
            action("Open Vendor Proposal")
            {
                Caption = 'Open Vendor Proposal';
                ApplicationArea = All;
                Image = Open;
                ToolTip = 'Open the selected vendor proposal for review or editing.';

                trigger OnAction()
                var
                    TenancyContractRec: Record "Vendor Proposal";
                begin
                    TenancyContractRec.SetRange("Proposal ID", Rec."Vendor Proposal ID");
                    if TenancyContractRec.FindFirst() then
                        PAGE.Run(PAGE::"Vendor Proposal", TenancyContractRec)
                    else
                        Message('The selected Proposal ID (%1) does not exist in the Vendor Proposal table.', Rec."Vendor Proposal ID");
                end;
            }


        }
    }


    trigger OnOpenPage()
    begin
        IsPropertyManager := CheckUserRole();
    end;

    procedure CheckUserRole(): Boolean
    var
        UserPersonalization: Record "User Personalization";
    begin
        if UserPersonalization.Get(UserSecurityId()) then
            case UserPersonalization."Profile ID" of
                'PROJECT MANAGER':
                    exit(true);
                else
                    exit(false);
            end;

        exit(false);
    end;

    var
        IsPropertyManager: Boolean;
}

