page 53113 "Project BoQ Header Card"
{
    PageType = Card;
    SourceTable = "Project BoQ Header";
    Caption = 'Project BoQ Header';
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("BoQID"; Rec."BoQID")
                {
                    ApplicationArea = All;
                    Editable = false; // ID should not be editable
                    ToolTip = 'Displays the BoQ ID.';
                }
                field("Project Id"; Rec."Project Id")
                {
                    ApplicationArea = All;
                    ToolTip = 'Select the approved Project ID for this BoQ.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = All;
                    Editable = false; // Auto-filled from "Project Id"
                    ToolTip = 'Displays the Project Name linked with the selected Project ID.';
                }
            }

            // New Group for Lines
            group("BoQ Lines")
            {
                part(BoQLines; "Project BoQ Line List")
                {
                    ApplicationArea = All;
                    SubPageLink = "Project ID" = FIELD("Project Id");
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Edit)
            {
                ApplicationArea = All;
                Caption = 'Edit';
                Image = EditLines;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = page "Project BoQ Header Card";
                RunPageMode = Edit;
            }
        }
    }
}
