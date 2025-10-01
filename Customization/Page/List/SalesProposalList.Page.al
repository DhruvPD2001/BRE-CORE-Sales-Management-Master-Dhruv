page 51504 "Sales Proposal List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Sales Proposal";
    Caption = 'Sales Proposal List';
    CardPageId = "Sales Proposal Card";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Proposal No."; Rec."Proposal No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Unique identifier for the sales proposal.';
                }
                field("Opportunity No."; Rec."Opportunity No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Associated opportunity number for the sales proposal.';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Customer number associated with the sales proposal.';
                }
                field("Salesperson Code"; Rec."Salesperson Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Code of the salesperson responsible for the sales proposal.';
                }
                field("Proposal Date"; Rec."Proposal Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Date when the sales proposal was created.';
                }
                field("Delivery Date"; Rec."Delivery Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Expected delivery date for the sales proposal.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Current status of the sales proposal.';
                }
                field("Net Price"; Rec."Net Price")
                {
                    ApplicationArea = All;
                    ToolTip = 'Net price of the sales proposal.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Approval status of the sales proposal.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}