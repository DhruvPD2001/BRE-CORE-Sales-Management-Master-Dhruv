page 52002 "Market Update List"
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = "Market Update";
    UsageCategory = Lists;
    Caption = 'Market Updates List';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Update ID"; Rec."Update ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Unique identifier for each market update, generated automatically.';
                }
                field("Title"; Rec.Title)
                {
                    ApplicationArea = All;
                    ToolTip = 'The title or headline of the market update (e.g., New Project Launch, Price Trend Report).';
                }
                field("Description"; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Detailed description of the market update such as project details, regulation changes, or pricing updates.';
                }
                field("Category"; Rec.Category)
                {
                    ApplicationArea = All;
                    ToolTip = 'Category of the update, such as Price Trends, New Projects, or Regulatory Updates.';
                }
                field("Publish Date"; Rec."Publish Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'The date on which the market update is published or shared with leads.';
                }
                field("Active"; Rec.Active)
                {
                    ApplicationArea = All;
                    ToolTip = 'Indicates whether the update is active and should be included in automated emails/SMS.';
                }
            }
        }
    }
}
