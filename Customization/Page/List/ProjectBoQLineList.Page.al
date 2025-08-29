page 53114 "Project BoQ Line List"
{
    PageType = ListPart;
    SourceTable = "Project BoQ Line";
    Caption = 'Project BoQ Line List';
    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("BoQ Line ID"; Rec."BoQ Line ID")
                {
                    ApplicationArea = All;
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = All;
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = All;
                }
                field("Planned Quantity"; Rec."Planned Quantity")
                {
                    ApplicationArea = All;
                }
                field("Unit Price (LCY)"; Rec."Unit Price (LCY)")
                {
                    ApplicationArea = All;
                }
                field("Total Cost"; Rec."Total Cost")
                {
                    ApplicationArea = All;
                }
                field("Cost Category"; Rec."Cost Category")
                {
                    ApplicationArea = All;
                }
                field("Budget Category"; Rec."Budget Category")
                {
                    ApplicationArea = All;
                }
                field("Procured Quantity"; Rec."Procured Quantity")
                {
                    ApplicationArea = All;
                }
                field("Remaining Quantity"; Rec."Remaining Quantity")
                {
                    ApplicationArea = All;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = All;
                }
                field("Modified By"; Rec."Modified By")
                {
                    ApplicationArea = All;
                }
                field("Modified On"; Rec."Modified On")
                {
                    ApplicationArea = All;
                }
            }
        }
    }


}
