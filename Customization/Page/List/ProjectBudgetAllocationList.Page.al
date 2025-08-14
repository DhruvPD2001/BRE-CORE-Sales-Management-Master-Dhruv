page 51254 "Project Budget Allocation List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Project Budget Allocation";
    CardPageId = 51252;
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Project Budget ID"; Rec."Project Budget ID")
                {
                    ToolTip = 'Project Budget ID for the budget allocation.';
                }
                field("Budget Category"; Rec."Budget Category")
                {
                    ToolTip = 'Budget Category for the budget allocation.';
                }
                field("Allocated Amount"; Rec."Allocated Amount")
                {
                    ToolTip = 'Total allocated budget amount for this category.';
                }
                field("Committed Amount"; Rec."Committed Amount")
                {
                    ToolTip = 'Sum of committed amounts from open Purchase Orders.';
                }
                field("Consumed Amount"; Rec."Consumed Amount")
                {
                    ToolTip = 'Sum of actual consumed amounts from posted invoices and stock issues.';
                }
                field("Remaining Amount"; Rec."Remaining Amount")
                {
                    ToolTip = 'Remaining budget amount (Allocated - Committed - Consumed).';
                }
            }
        }
    }
}