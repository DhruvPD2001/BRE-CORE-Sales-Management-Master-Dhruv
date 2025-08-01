page 53513 "Archived Leads"
{
    PageType = List;
    SourceTable = "Lead Management";
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'Archived Leads';
    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = false;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("LeadID"; Rec."Lead ID")
                {
                    ToolTip = 'Unique identifier for the lead.';
                    trigger OnDrillDown()
                    var
                        LeadCardPage: Page "Lead Card";
                    begin
                        LeadCardPage.SetRecord(Rec);
                        LeadCardPage.Editable(false);
                        LeadCardPage.RunModal();
                    end;
                }
                field("LeadName"; Rec."Lead Name") { ToolTip = 'Contact name of the lead.'; }
                field("LeadStatus"; Rec."Lead Status") { ToolTip = 'Status of the lead (always Disqualified here).'; }
                field("Disqualification Reason"; Rec."Disqualification Reason") { ToolTip = 'Reason why the lead was disqualified.'; }
                field("Disqualification Date"; Rec."Disqualification Date") { ToolTip = 'Date when the lead was archived/disqualified.'; }
                field("Lead Source"; Rec."Lead Source") { ToolTip = 'Source from which the lead was generated.'; }
                field("Assigned Sales Person"; Rec."Assigned Sales Person") { ToolTip = 'Sales representative who managed the lead.'; }
                field("Created Date"; Rec."Created Date") { ToolTip = 'Date when the lead was created.'; }
                field("Interst Area"; Rec."Interst Area") { ToolTip = 'Area of interest for the lead.'; }
                field(Notes; Rec.Notes) { ToolTip = 'Last notes before disqualification.'; }
            }
        }
    }
    trigger OnOpenPage()
    begin
        Rec.SetRange("Lead Status", Enum::"Lead Status"::Disqualified);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Error('You cannot create new records from Archived Leads page.');
    end;

    trigger OnModifyRecord(): Boolean
    begin
        Error('You cannot modify records from Archived Leads page.');
    end;
}