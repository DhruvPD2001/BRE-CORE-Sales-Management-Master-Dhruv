pageextension 53116 "Contact Card" extends "Contact Card"
{
    layout
    {
        addafter(General)
        {
            group("Lead Information")
            {
                field("Position/Role"; Rec."Position/Role")
                {
                    ApplicationArea = All;
                    ToolTip = 'Position/Role';
                }
                field("Lead Source"; Rec."Lead Source")
                {
                    ApplicationArea = All;
                    ToolTip = 'Lead Source';
                }
                field("Others"; Rec."Others")
                {
                    ApplicationArea = All;
                    ToolTip = 'Others';
                }
                field("Campaign Name"; Rec."Campaign Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Campaign Name';
                }
                field("Lead Owner"; Rec."Lead Owner")
                {
                    ApplicationArea = All;
                    ToolTip = 'Lead Owner';
                }
                field("Lead Status"; Rec."Lead Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Lead Status';
                }
                field("Lead Rating"; Rec."Lead Rating")
                {
                    ApplicationArea = All;
                    ToolTip = 'Lead Rating';
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = All;
                    ToolTip = 'Date Created';
                }
                field("Expected Follow-up Date"; Rec."Expected Follow-up Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Expected Follow-up Date';
                }
            }

            // group("Contact & Company Details")
            // {

            //     field("Position/Role"; Rec."Position/Role")
            //     {
            //         ApplicationArea = All;
            //         ToolTip = 'Position/Role';
            //     }
            // }

            group("Property Requirements")
            {
                field("Property Type"; Rec."Property Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Property Type';
                }
                // field("Usage Type"; Rec."Usage Type")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Usage Type';
                // }
                field("Bedrooms"; Rec."Bedrooms")
                {
                    ApplicationArea = All;
                    ToolTip = 'Bedrooms';
                }
                field("Bathrooms"; Rec."Bathrooms")
                {
                    ApplicationArea = All;
                    ToolTip = 'Bathrooms';
                }
                field("Preferred Location"; Rec."Preferred Location")
                {
                    ApplicationArea = All;
                    toolTip = 'Preferred Location';
                }
                field("Budget Range (AED)"; Rec."Budget Range (AED)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Budget Range (AED)';
                }
                field("Size (Sq. Ft.)"; Rec."Size (Sq. Ft.)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Size (Sq. Ft.)';
                }
                field("Furnishing Status"; Rec."Furnishing Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Furnishing Status';
                }
                field("Preferred Payment Plan"; Rec."Preferred Payment Plan")
                {
                    ApplicationArea = All;
                    ToolTip = 'Preferred Payment Plan';
                }
                field("Move-in Timeline"; Rec."Move-in Timeline")
                {
                    ApplicationArea = All;
                    ToolTip = 'Move-in Timeline';
                }
            }

            group("Financial & Legal Details")
            {
                field("Emirates ID/Passport No."; Rec."Emirates ID/Passport No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Emirates ID/Passport No.';
                }
                field("Visa Status"; Rec."Visa Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Visa Status';
                }
                field("Source of Funds"; Rec."Source of Funds")
                {
                    ApplicationArea = All;
                    ToolTip = 'Source of Funds';
                }
                field("Mortgage Pre-Approved"; Rec."Mortgage Pre-Approved")
                {
                    ApplicationArea = All;
                    ToolTip = 'Mortgage Pre-Approved';
                }
                field("RERA Broker ID"; Rec."RERA Broker ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'RERA Broker ID';
                }
                field("Preferred Sale Type"; Rec."Preferred Sale Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Preferred Sale Type';
                }
            }
            group("Interaction & Follow-up History")
            {

                field("Lead Sales Stages"; Rec."Lead Sales Stages")
                {
                    ApplicationArea = All;
                    ToolTip = 'Lead Sales Stages';
                }
                field("Competitor Information"; Rec."Competitor Information")
                {
                    ApplicationArea = All;
                    ToolTip = 'Competitor Information';
                }
            }

        }
    }
}
