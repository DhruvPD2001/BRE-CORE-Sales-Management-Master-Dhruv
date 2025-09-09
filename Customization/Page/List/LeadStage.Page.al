page 52003 "Lead Stage"
{
    Caption = 'Lead Stages List';
    PageType = List;
    ApplicationArea = All;
    SourceTable = "Lead Stage";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Stage ID"; Rec."Stage ID")
                {
                    ApplicationArea = All;
                    Editable = false; // AutoIncrement
                    ToolTip = 'Unique system-generated ID for each stage.';
                }
                field("Stage Name"; Rec."Stage Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'The name of the stage. Must be unique within each company.';
                }
                field("Description"; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Optional description providing more details about this stage.';
                }
                field("Lead Score"; Rec."Lead Score")
                {
                    ApplicationArea = All;
                    ToolTip = 'Numeric value (0-100) representing the score of leads in this stage.';
                }
                // field("Lead Status"; Rec."Lead Status")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'The status of the lead at this stage (New, Active, Closed-Won, or Closed-Lost).';
                // }
            }
        }
    }
}
