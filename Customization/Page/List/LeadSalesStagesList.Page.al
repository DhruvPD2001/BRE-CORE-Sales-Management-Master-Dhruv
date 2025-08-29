page 53117 "Lead Sales Stages List"
{
    PageType = List;
    SourceTable = "Lead Sales Stages";
    ApplicationArea = All;
    Caption = 'Lead Sales Stages List';
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(ID; Rec.ID)
                {
                    ApplicationArea = All;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Unique identifier for the Lead Sales Stages.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    Caption = 'Lead Sales Stages Name';
                    ToolTip = 'Name of the Lead Sales Stages.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    Caption = 'Description';
                    ToolTip = 'Description of the Lead Sales Stages.';
                }
            }
        }
    }
}