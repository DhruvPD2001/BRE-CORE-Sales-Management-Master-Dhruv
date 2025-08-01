page 53251 "Pricing Breakdown Grid"
{
    PageType = ListPart;
    ApplicationArea = All;
    SourceTable = "Pricing Breakdown";

    layout
    {
        area(Content)
        {
            repeater(Prices)
            {

                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Unique identifier for the pricing breakdown entry.';
                }
                field("Profile ID"; Rec."Profile ID")
                {
                    ApplicationArea = All;
                    Caption = 'Vendor Profile ID';
                    Visible = false;
                    ToolTip = 'Identifier for the profile associated.';
                }
                field("Vendor Proposal ID"; Rec."Vendor Proposal ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Identifier for the vendor proposal.';
                }
                field("Vendor Contract ID"; Rec."Vendor Contract ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Identifier for the vendor contract.';
                }
                field("Item Description"; Rec."Item Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Description of the item or service.';
                }
                field("Quantity"; Rec."Quantity")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the quantity of the item or service.';
                    trigger OnValidate()
                    begin
                        Rec."Total Cost" := Rec."Quantity" * Rec."Price Per Unit";
                    end;
                }
                field("Unit"; Rec."Unit")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unit of measurement for the item or service.';
                }
                field("Price Per Unit"; Rec."Price Per Unit")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the price for each unit of the item or service.';
                    trigger OnValidate()
                    begin
                        Rec."Total Cost" := Rec."Quantity" * Rec."Price Per Unit";
                    end;
                }
                field("Total Cost"; Rec."Total Cost")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Displays the total cost calculated as Quantity multiplied by Price Per Unit.';
                }
            }
        }
    }
}
