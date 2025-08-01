page 52001 "Opportunity Management List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Opportunity Management";
    CardPageId = 51251;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Opportunity ID"; Rec."Opportunity ID")
                {
                    ToolTip = 'Opportunity ID for the Opportunity.';
                }
                field("Lead ID"; Rec."Lead ID")
                {
                    ToolTip = 'Lead ID for the Opportunity.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ToolTip = 'Project ID for the Opportunity.';
                }
                field("Unit ID"; Rec."Unit ID")
                {
                    ToolTip = 'Unit ID for the Opportunity.';
                }
                field("Opportunity Name"; Rec."Opportunity Name")
                {
                    ToolTip = 'Opportunity Name for the Opportunity.';
                }

                field("Estimated Close Date"; Rec."Estimated Close Date")
                {
                    ToolTip = 'Estimated Close Date for the Opportunity.';
                }
                field("Opportunity Value"; Rec."Opportunity Value")
                {
                    ToolTip = 'Opportunity ValueD for the Opportunity.';
                }
                field("Pipeline Stage"; Rec."Pipeline Stage")
                {
                    ToolTip = 'Pipeline Stage for the Opportunity.';
                }
                field("Status"; Rec."Status")
                {
                    ToolTip = 'Status for the Opportunity.';
                }
                field("Probability %"; Rec."Probability %")
                {
                    ToolTip = 'Probability % for the Opportunity.';
                }
                field("Notes"; Rec."Notes")
                {
                    ToolTip = 'Notes for the Opportunity.';
                }
                field("Created Date"; Rec."Created Date")
                {
                    ToolTip = 'Created Date for the Opportunity.';
                }
            }
        }
    }
}