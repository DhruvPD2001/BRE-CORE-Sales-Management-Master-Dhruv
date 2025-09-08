page 51503 "Lead Information SubPage"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Lead Information";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Lead ID"; Rec."Lead ID")
                {
                    Editable = false;
                    ToolTip = 'Unique identifier for the lead.';
                    trigger OnDrillDown()
                    var
                        ContactRec: Record Contact;
                        LeadID: Code[20];
                    begin
                        LeadID := Rec."Lead ID";
                        if ContactRec.Get(LeadID) then
                            PAGE.Run(PAGE::"Contact Card", ContactRec)
                        else
                            Message('No Contact found for Lead ID %1.', LeadID);
                    end;
                }
                field("Property Name"; Rec."Property Name")
                {
                    ToolTip = 'Name of the property associated with the lead.';
                    Editable = false;
                }
                field("Property Type"; Rec."Property Type")
                {
                    ToolTip = 'Type of the property (e.g., Residential, Commercial).';
                    Editable = false;
                }
                field("Unit Type"; Rec."Unit Type")
                {
                    ToolTip = 'Type of unit (e.g., Apartment, Villa).';
                    Editable = false;
                }
                field("Sales Person"; Rec."Sales Person")
                {
                    ToolTip = 'Salesperson assigned to the lead.';
                    Editable = false;
                }
                field("Lead Rating"; Rec."Lead Rating")
                {
                    ToolTip = 'Rating of the lead based on interest level.';
                    Editable = false;
                }
                field("Lead Status"; Rec."Lead Status")
                {
                    ToolTip = 'Current status of the lead (e.g., New, Contacted, Qualified).';
                    Editable = false;
                }

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