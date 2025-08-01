page 51501 "Lead Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Lead Management";
    Caption = 'Lead Card';

    layout
    {
        area(Content)
        {
            group("General Information")
            {
                field("Lead ID"; Rec."Lead ID")
                {
                    Editable = false;
                    ToolTip = 'Unique identifier for the lead.';
                }
                field("Lead Name"; Rec."Lead Name")
                {
                    ToolTip = 'Name of the lead.';
                    trigger OnValidate()
                    begin
                        if Rec."Lead Name" = '' then
                            Error('Lead Name cannot be empty.');
                    end;
                }
                field("Lead Source"; Rec."Lead Source")
                {
                    ToolTip = 'Source from which the lead was generated.';
                }
                field("Lead Status"; Rec."Lead Status")
                {
                    ToolTip = 'Current status of the lead.';
                }
            }
            group("Contact Details")
            {
                field(Email; Rec.Email)
                {
                    ToolTip = 'Email address of the lead.';
                    trigger OnValidate()
                    begin
                        if Rec.Email <> '' then
                            if not Rec.Email.Contains('@') then
                                Error('Invalid email address format.')
                            else
                                Error('Email cannot be empty.');

                    end;
                }
                field("Mobile No."; Rec."Mobile No.")
                {
                    ToolTip = 'Mobile number of the lead.';
                }
                field("Assigned Sales Person"; Rec."Assigned Sales Person")
                {
                    ToolTip = 'Salesperson assigned to the lead.';
                    TableRelation = "Salesperson/Purchaser";
                }
                field("Interst Area"; Rec."Interst Area")
                {
                    ToolTip = 'Area of interest for the lead.';
                }
                field("Expected Budget"; Rec."Expected Budget")
                {
                    ToolTip = 'Expected budget for the lead.';
                }
            }
            group("Follow-Up")
            {
                field("Follow-up Date"; Rec."Follow-up Date")
                {
                    ToolTip = 'Date for the next follow-up with the lead.';
                }
                field(Notes; Rec.Notes)
                {
                    ToolTip = 'Additional notes regarding the lead.';
                }
            }
            group("System Information")
            {
                field("Created By"; Rec."Created By")
                {
                    Editable = false;
                    ToolTip = 'User who created the lead.';
                }
                field("Created Date"; Rec."Created Date")
                {
                    Editable = false;
                    ToolTip = 'Date when the lead was created.';
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