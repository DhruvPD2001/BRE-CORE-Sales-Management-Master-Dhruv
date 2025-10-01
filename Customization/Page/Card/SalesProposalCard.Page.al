page 51505 "Sales Proposal Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Sales Proposal";
    Caption = 'Sales Proposal Card';

    layout
    {
        area(Content)
        {
            group(General)
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
            }
            group(Financial)
            {
                field(Units; Rec.Units)
                {
                    ApplicationArea = All;
                    ToolTip = 'Number of units included in the sales proposal.';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                    ToolTip = 'Price per unit in the sales proposal.';
                }
                field("Discount %"; Rec."Discount %")
                {
                    ApplicationArea = All;
                    ToolTip = 'Discount percentage applied to the sales proposal.';
                }
                field("Net Price"; Rec."Net Price")
                {
                    ApplicationArea = All;
                    ToolTip = 'Net price of the sales proposal.';
                }
                field(Taxes; Rec.Taxes)
                {
                    ApplicationArea = All;
                    ToolTip = 'Total taxes applied to the sales proposal.';
                }
                field(Fees; Rec.Fees)
                {
                    ApplicationArea = All;
                    ToolTip = 'Additional fees associated with the sales proposal.';
                }
                field("Payment Plan"; Rec."Payment Plan")
                {
                    ApplicationArea = All;
                    ToolTip = 'Payment plan details for the sales proposal.';
                }
                field("Reservation Fee"; Rec."Reservation Fee")
                {
                    ApplicationArea = All;
                    ToolTip = 'Reservation fee for the sales proposal.';
                }

            }
            group(Other)
            {
                field("Penalty/Cancellation Summary"; Rec."Penalty/Cancellation Summary")
                {
                    applicationArea = All;
                    ToolTip = 'Summary of penalties or cancellations associated with the sales proposal.';
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

        }
    }


}