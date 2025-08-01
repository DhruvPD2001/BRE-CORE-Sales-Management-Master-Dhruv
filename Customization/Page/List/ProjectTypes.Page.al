page 53755 "Project Types"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Project Type";
    Caption = 'Project Types';

    layout
    {
        area(Content)
        {
            repeater(ProjectTypes)
            {
                field("Project Type"; Rec."Project Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unique name or code for the project type.';
                }
                field("Description"; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Provides a detailed description of the project type.';
                }
            }
        }
    }
}
