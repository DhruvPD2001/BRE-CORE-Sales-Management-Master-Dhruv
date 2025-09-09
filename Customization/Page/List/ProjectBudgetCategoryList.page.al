page 53112 "Project Budget Category List"
{
    PageType = List;
    SourceTable = "Project Budget Category";
    ApplicationArea = All;
    Caption = 'Project Budget Category List';
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
                    ToolTip = 'Unique identifier for the Project Budget Category.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    Caption = 'Name';
                    ToolTip = 'Name of the Project Budget Category.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    Caption = 'Description';
                    ToolTip = 'Description of the Project Budget Category.';
                }
            }
        }
    }
}