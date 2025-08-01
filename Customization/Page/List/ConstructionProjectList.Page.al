page 53502 "Construction Project List"
{
    PageType = List;
    SourceTable = "Construction Project";
    ApplicationArea = All;
    Caption = 'Construction Project List';
    UsageCategory = Lists;
    CardPageId = 53501;
    ModifyAllowed = false;
    InsertAllowed = false;
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unique identifier for the construction project.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the construction project for easy identification.';
                }
                field("Planned Start Date"; Rec."Planned start date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Indicates the date when the construction project is planned to start.';
                }
                field("Planned End Date"; Rec."Planned End Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Indicates the date when the construction project is planned to finish.';
                }
                field("Project Status"; Rec."Project Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the current status of the construction project, such as Planned, In Progress, or Completed.';
                }
            }
        }
    }
}