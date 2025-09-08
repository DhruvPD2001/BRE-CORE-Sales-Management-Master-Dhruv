page 51503 "Lead Information List"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Lead Information";

    layout
    {
        area(Content)
        {
            field("Lead ID"; Rec."Lead ID")
            {
                ToolTip = 'Unique identifier for the lead.';
            }
            field("Property Name"; Rec."Property Name")
            {
                ToolTip = 'Name of the property associated with the lead.';
            }
            field("Property Type"; Rec."Property Type")
            {
                ToolTip = 'Type of the property (e.g., Residential, Commercial).';
            }
            field("Unit Type"; Rec."Unit Type")
            {
                ToolTip = 'Type of unit (e.g., Apartment, Villa).';
            }
            field("Sales Person"; Rec."Sales Person")
            {
                ToolTip = 'Salesperson assigned to the lead.';
            }
            field("Lead Rating"; Rec."Lead Rating")
            {
                ToolTip = 'Rating of the lead based on interest level.';
            }
            field("Lead Status"; Rec."Lead Status")
            {
                ToolTip = 'Current status of the lead (e.g., New, Contacted, Qualified).';
            }

        }
    }

    actions
    {
        area(Processing)
        {

        }
    }


}