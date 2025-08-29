pageextension 53116 "Contact Card" extends "Contact Card"
{
    layout
    {
        addafter(General)
        {
            group("Lead Information")
            {
                field("Lead Source"; Rec."Lead Source")
                {
                    ApplicationArea = All;
                    ToolTip = 'Lead Source';
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

            group("Contact & Company Details")
            {

                field("Position/Role"; Rec."Position/Role")
                {
                    ApplicationArea = All;
                    ToolTip = 'Position/Role';
                }
            }

            group("Property Requirements")
            {
                field("Property Type"; Rec."Property Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Property Type';
                }
                field("Usage Type"; Rec."Usage Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Usage Type';
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
        }
    }
}
