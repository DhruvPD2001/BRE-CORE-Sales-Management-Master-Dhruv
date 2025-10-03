page 51502 "Approval Sales Proposal List"
{
    PageType = List;
    SourceTable = "Approval Sales Proposal";
    ApplicationArea = All;
    Caption = 'Sales Proposal Approval List';
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
                    ToolTip = 'Specifies the unique identifier for the Sales proposal approval.';
                }

                field("Sales Proposal ID"; Rec."Sales Proposal ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unique identifier for the Sales proposal.';

                    trigger OnDrillDown()
                    var
                        SalesProposalRec: Record "Sales Proposal";
                    begin
                        SalesProposalRec.SetRange("Proposal No.", Rec."Sales Proposal ID");
                        if SalesProposalRec.FindFirst() then
                            PAGE.Run(PAGE::"Sales Proposal Card", SalesProposalRec)
                        else
                            Message('The selected Sales Proposal ID (%1) does not exist in the Sales Proposal table.', Rec."Sales Proposal ID");
                    end;
                }
                field("Status"; Rec."Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the current approval status of the Sales proposal.';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unique identifier for the Customer No.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the user who created the Sales proposal approval.';
                }
                field("Remark"; Rec."Remark")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies any remarks related to the Sales proposal approval.';
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
                Visible = IsSalesManager;
                ToolTip = 'Approve the selected Sales proposal approval request.';

                trigger OnAction()
                var
                    SelectedRec: Record "Approval Sales Proposal";
                    SalesProposalRec: Record "Sales Proposal";
                begin
                    if Rec.Status = 'Pending' then begin
                        SelectedRec := Rec;
                        SelectedRec.Status := 'Approved';
                        SelectedRec.Modify();

                        SalesProposalRec.SetRange("Proposal No.", SelectedRec."Sales Proposal ID");
                        if SalesProposalRec.FindSet() then
                            repeat

                                SalesProposalRec."Approval Status" := SalesProposalRec."Approval Status"::Approved;
                                SalesProposalRec.Modify();
                            until SalesProposalRec.Next() = 0;
                        Commit();
                        CurrPage.Update();
                        Message('Request Approved Successfully for Sales Proposal ID: %1', SelectedRec."Sales Proposal ID");
                    end else
                        Message('Selected record is not in "Pending" status.');
                end;
            }


            action(Reject)
            {
                Caption = 'Reject';
                ApplicationArea = All;
                Image = Reject;
                Visible = IsSalesManager;
                ToolTip = 'Reject the selected Sales proposal approval request.';

                trigger OnAction()
                var
                    SelectedRec: Record "Approval Sales Proposal";
                    SalesProposalRec: Record "Sales Proposal";
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
                                SelectedRec.Status := 'Rejected';
                                SelectedRec.Remark := CopyStr(RemarkText, 1, StrLen(RemarkText));
                                SelectedRec.Modify();

                                SalesProposalRec.SetRange("Proposal No.", SelectedRec."Sales Proposal ID");
                                if SalesProposalRec.FindSet() then
                                    repeat
                                        SalesProposalRec."Internal Remark" := CopyStr(RemarkText, 1, StrLen(RemarkText));
                                        SalesProposalRec."Approval Status" := SalesProposalRec."Approval Status"::Rejected;
                                        SalesProposalRec.Modify();
                                    until SalesProposalRec.Next() = 0;

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
        area(Promoted)
        {
            actionref(ApproveRecrord; Approve)
            {

            }
            actionref(RejectRecord; Reject)
            {

            }
        }
    }


    trigger OnOpenPage()
    begin
        IsSalesManager := CheckUserRole();
    end;

    procedure CheckUserRole(): Boolean
    var
        UserPersonalization: Record "User Personalization";
    begin
        if UserPersonalization.Get(UserSecurityId()) then
            case UserPersonalization."Profile ID" of
                'SALES MANAGER':
                    exit(true);  // Only property managers can approve/reject
                else
                    exit(false);
            end;

        exit(false);
    end;

    var
        IsSalesManager: Boolean;
}