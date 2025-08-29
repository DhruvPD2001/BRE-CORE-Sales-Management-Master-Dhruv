page 53115 "Project BoQ Header List"
{
    PageType = List;
    SourceTable = "Project BoQ Header";
    Caption = 'Project BoQ Header List';
    UsageCategory = Lists;
    ApplicationArea = All;
    CardPageId = "Project BoQ Header Card"; // Opens the Card page for details

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("BoQID"; Rec."BoQID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Unique identifier for the BoQ Header.';
                }
                field("Project Id"; Rec."Project Id")
                {
                    ApplicationArea = All;
                    ToolTip = 'Select the approved project for this BoQ.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Displays the project name linked to this BoQ.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(NewBoQHeader)
            {
                Caption = 'New BoQ Header';
                Image = New;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = New;
                trigger OnAction()
                begin
                    PAGE.RunModal(PAGE::"Project BoQ Header Card");
                end;
            }
        }
    }
}
