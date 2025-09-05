page 52005 "Lead Score Range"
{
    Caption = 'Lead Score Range List';
    PageType = List;
    ApplicationArea = All;
    SourceTable = "Lead Score Range";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Rating ID"; Rec."Range ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Unique system-generated ID for each rating.';
                }
                field("Lead Rating"; Rec."Lead Rating")
                {
                    ApplicationArea = All;
                    ToolTip = 'Name of the lead rating category (e.g., Cold, Warm, Hot). Must be unique per company.';
                }
                field("Min Score Percent"; Rec."Min Score Percent")
                {
                    ApplicationArea = All;
                    ToolTip = 'Minimum percentage score threshold for this rating category.';
                }
                field("Max Score Percent"; Rec."Max Score Percent")
                {
                    ApplicationArea = All;
                    ToolTip = 'Maximum percentage score threshold for this rating category.';
                }
            }
        }
    }
}
