page 53255 "Vendor Contract Approval List"
{
    PageType = List;
    SourceTable = "Vendor Contract Approval";
    ApplicationArea = All;
    Caption = 'Vendor Contract Approval List';
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
                    Tooltip = 'Specifies the unique identifier for the vendor contract approval.';
                }
                field("Status"; Rec."Status")
                {
                    ApplicationArea = All;
                    Tooltip = 'Specifies the current approval status of the vendor contract.';
                }
                field("Vendor Contract ID"; Rec."Vendor Contract ID")
                {
                    ApplicationArea = All;
                    Tooltip = 'Specifies the unique identifier for the vendor contract.';

                    trigger OnDrillDown()
                    var
                        TenancyContractRec: Record "Vendor Contract";
                    begin
                        TenancyContractRec.SetRange("Contract ID", Rec."Vendor Contract ID");
                        if TenancyContractRec.FindFirst() then
                            PAGE.Run(PAGE::"Vendor Contract", TenancyContractRec)
                        else
                            Message('The selected Vendor Contract ID (%1) does not exist in the Vendor Contract Table.', Rec."Vendor Contract ID");
                    end;
                }

                field("Vendor ID"; Rec."Vendor ID")
                {
                    ApplicationArea = All;
                    Tooltip = 'Specifies the unique identifier for the vendor.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    Tooltip = 'Specifies the user who created the vendor contract approval.';
                }
                field("Remark"; Rec."Remark")
                {
                    ApplicationArea = All;
                    Tooltip = 'Specifies any remarks related to the vendor contract approval.';
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
                Tooltip = 'Approve the selected vendor contract request with remarks and send notification email.';

                trigger OnAction()
                var
                    SelectedRec: Record "Vendor Contract Approval";
                    VendorProposalRec: Record "Vendor Contract";
                    NotificationCodeunit: Codeunit "Vendor Proposal Notification";
                    VendorContractApprovalVendor: Codeunit VendorContractApprovalVendor;
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
                                SelectedRec := Rec;
                                SelectedRec.Status := 'Approved';
                                SelectedRec.Remark := CopyStr(RemarkText, 1, StrLen(RemarkText));
                                SelectedRec.Modify();

                                VendorProposalRec.SetRange("Contract ID", SelectedRec."Vendor Contract ID");
                                if VendorProposalRec.FindSet() then
                                    repeat
                                        VendorProposalRec."Internal Remarks" := CopyStr(RemarkText, 1, StrLen(RemarkText));
                                        VendorProposalRec."Internal Approval Status" := VendorProposalRec."Internal Approval Status"::Approved;
                                        VendorProposalRec.Modify();
                                    until VendorProposalRec.Next() = 0;

                                RecipientEmail := NotificationCodeunit.SendContractApprovalEmail(
                                    SelectedRec."Vendor Contract ID",
                                    SelectedRec."Created By",
                                    RemarkText
                                );

                                Commit();
                                CurrPage.Update();
                                Message('Request Approved Successfully with Remarks and Email Sent to: %1', RecipientEmail);
                                VendorContractApprovalVendor.VendorContractApproval(VendorProposalRec);
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
                Tooltip = 'Reject the selected vendor contract request with remarks.';

                trigger OnAction()
                var
                    SelectedRec: Record "Vendor Contract Approval";
                    VendorProposalRec: Record "Vendor Contract";
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

                                VendorProposalRec.SetRange("Contract ID", SelectedRec."Vendor Contract ID");
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
            action("Open Vendor Contract")
            {
                Caption = 'Open Vendor Contract';
                ApplicationArea = All;
                Image = Open;
                Tooltip = 'Open the selected vendor contract card page.';

                trigger OnAction()
                var
                    TenancyContractRec: Record "Vendor Contract";
                begin
                    TenancyContractRec.SetRange("Contract ID", Rec."Vendor Contract ID");
                    if TenancyContractRec.FindFirst() then
                        PAGE.Run(PAGE::"Vendor Contract", TenancyContractRec)
                    else
                        Message('The selected Vendor Contract(%1) does not exist in the Vendor Contract table.', Rec."Vendor Contract ID");
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

