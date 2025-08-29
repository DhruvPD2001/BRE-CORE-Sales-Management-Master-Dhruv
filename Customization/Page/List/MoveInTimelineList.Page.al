page 53118 "Move-in Timeline List"
{
    PageType = List;
    SourceTable = "Move-in Timeline";
    ApplicationArea = All;
    Caption = 'Move-in Timeline List';
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
                    ToolTip = 'Unique identifier for the Move-in Timeline.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    Caption = 'Move-in Timeline Name';
                    ToolTip = 'Name of the Move-in Timeline.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    Caption = 'Description';
                    ToolTip = 'Description of the Move-in Timeline.';
                }
            }
        }
    }
}