page 51252 "Project Budget Allocation"
{
    PageType = Card;
    SourceTable = "Project Budget Allocation";
    UsageCategory = None;
    Caption = 'Project Budget Allocation';
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Project Budget ID"; Rec."Project Budget ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Project ID for budget allocation.';
                }

                field("Budget Category"; Rec."Budget Category")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the budget category (e.g., Foundation & Structure).';
                }
            }
            group(Amounts)
            {
                Caption = 'Budget Amounts';
                field("Allocated Amount"; Rec."Allocated Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the total allocated budget amount for this category.';
                    Style = Strong;
                }

                field("Committed Amount"; Rec."Committed Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the sum of committed amounts from open Purchase Orders.';
                }

                field("Consumed Amount"; Rec."Consumed Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the sum of actual consumed amounts from posted invoices and stock issues.';
                }

                field("Remaining Amount"; Rec."Remaining Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the remaining budget amount (Allocated - Committed - Consumed).';
                }
            }
            group(History)
            {
                Caption = 'Audit Information';

                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows when this budget allocation was created.';
                }

                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows who created this budget allocation.';
                }

                field("Modified Date"; Rec."Modified Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows when this budget allocation was last modified.';
                }

                field("Modified By"; Rec."Modified By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows who last modified this budget allocation.';
                }
            }
        }
    }
}