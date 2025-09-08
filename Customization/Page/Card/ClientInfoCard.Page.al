page 53120 "Client Info Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Client Info";
    Caption = 'Client Info Card';
    layout
    {
        area(Content)
        {
            group("General Information")
            {
                field("Client Info ID"; Rec."Client Info ID")
                {
                    Editable = false;
                    ToolTip = 'Unique identifier for the Client Info ID.';
                }
                field("Client Name"; Rec."Client Name")
                {
                    ToolTip = 'Name of the Client.';
                    trigger OnValidate()
                    begin
                        if Rec."Client Name" = '' then
                            Error('Client Name cannot be empty.');
                    end;
                }
            }
            group("Communication Details")
            {

                field(Email; Rec.Email)
                {
                    ToolTip = 'Email address of the Client Info.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ToolTip = 'Phone number of the Client Info.';
                    Caption = 'Phone No.';
                }
                field("Mobile No."; Rec."Mobile No.")
                {
                    ToolTip = 'Mobile number of the Client Info.';
                    Caption = 'Mobile Phone No,';
                }

                field("Company Name"; Rec."Company Name")
                {
                    ToolTip = 'Company Name to the Client Info.';
                }
                field("Position/Role"; Rec."Position/Role")
                {
                    ToolTip = 'Position/Role attend to the Client Info.';
                }
                field(Nationality; Rec.Nationality)
                {
                    ToolTip = 'Nationality of the Client Info';
                }
                field("Preferred Language"; Rec."Preferred Language")
                {
                    ToolTip = 'Preferred Language of the Client Info.';
                    TableRelation = Language.Name;
                }
                field("Address"; Rec."Address")
                {
                    ToolTip = 'Address of the Client Info.';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ToolTip = 'Address 2 of the Client Info.';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ToolTip = 'Country/Region of the Client Info.';
                    TableRelation = "Country/Region".Code;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ToolTip = 'postal code of the Client Info.';
                }
                field("City"; Rec."City")
                {
                    ToolTip = 'city of the Client Info.';
                }
            }

            group("Financial & Legal Details (For Compliance)")
            {
                field("Emirates ID/Passport Number"; Rec."Emirates ID/Passport Number")
                {
                    ToolTip = 'Specifies the Emirates ID or Passport Number of the Client Info for identification purposes.';
                }
                field("Visa Status"; Rec."Visa Status")
                {
                    ToolTip = 'Specifies the visa status of the Client Info, such as resident, visitor, or work visa.';
                }
                field("Source of Funds"; Rec."Source of Funds")
                {
                    ToolTip = 'Specifies the declared source of funds that the Client Info will use for the property purchase.';
                }
                field("Mortgage Pre-Approval Status"; Rec."Mortgage Pre-Approval Status")
                {
                    ToolTip = 'Specifies whether the Client Info has obtained mortgage pre-approval from a bank or lender.';
                }
                field("TAX Registration_VAT"; Rec."TAX Registration_VAT")
                {
                    ToolTip = 'Specifies the VAT or Tax Registration Number of the Client Info, if applicable.';
                }
                field("RERA Broker ID"; Rec."RERA Broker ID")
                {
                    ToolTip = 'Specifies the RERA Broker ID associated with the Client Info or transaction.';
                }
                field("Preferred Sale Type"; Rec."Preferred Sale Type")
                {
                    ToolTip = 'Specifies the preferred type of sale for the Client Info, such as off-plan, secondary market, or resale.';
                }
            }
            group("System Information")
            {
                field("Created By"; Rec."Created By")
                {
                    Editable = false;
                    ToolTip = 'User who created the Client Info.';
                }
                field("Created Date"; Rec."Created Date")
                {
                    Editable = false;
                    ToolTip = 'Date when the Client Info was created.';
                }
            }
            group("Lead Information")
            {
                part("Lead Information List"; "Lead Information SubPage")
                {
                    Caption = 'Lead Information List';
                    SubPageLink = "Client Info Id" = FIELD("Client Info ID");
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
    begin
        Rec.TestField("Client Name");
        Rec.TestField(Email);
        Rec.TestField("Phone No.");
    end;
}