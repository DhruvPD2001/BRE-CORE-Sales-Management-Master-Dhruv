page 51501 "Lead Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Lead Management";
    Caption = 'Lead Card';
    layout
    {
        area(Content)
        {
            group("General Information")
            {
                Editable = not IsQualified;
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
                    Editable = FieldEditable;
                    trigger OnValidate()
                    begin
                        ValidateLeadStatus();
                    end;
                }
                field("Disqualification Reason"; Rec."Disqualification Reason")
                {
                    ToolTip = 'Reason why the lead was disqualified.';
                    Editable = FieldEditable;
                }
                field("Disqualification Date"; Rec."Disqualification Date")
                {
                    ToolTip = 'Date when the lead was disqualified.';
                    Editable = false;
                }
            }
            group("Contact Details")
            {
                Editable = not IsQualified;
                field(Email; Rec.Email)
                {
                    ToolTip = 'Email address of the lead.';
                    trigger OnValidate()
                    var
                        LeadRec: Record "Lead Management";
                    begin
                        if Rec.Email <> '' then
                            if not Rec.Email.Contains('@') then
                                Error('Invalid email address format.');
                        if Rec.Email <> '' then begin
                            LeadRec.Reset();
                            LeadRec.SetRange(Email, Rec.Email);
                            if LeadRec.FindFirst() then
                                if LeadRec."Lead ID" <> Rec."Lead ID" then
                                    Error('Duplicate email found: %1 already assigned to Lead: %2.', Rec.Email, LeadRec."Lead Name");
                        end;
                    end;
                }
                field("Mobile No."; Rec."Mobile No.")
                {
                    ToolTip = 'Mobile number of the lead.';
                    trigger OnValidate()
                    var
                        LeadRec: Record "Lead Management";
                    begin
                        if Rec."Mobile No." <> '' then begin
                            LeadRec.Reset();
                            LeadRec.SetRange("Mobile No.", Rec."Mobile No.");
                            if LeadRec.FindFirst() then
                                if LeadRec."Lead ID" <> Rec."Lead ID" then
                                    Error('Duplicate phone number found: %1 already assigned to Lead: %2.', Rec."Mobile No.", LeadRec."Lead Name");
                        end;
                    end;
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
            part("lead interaction log"; "Lead Interaction Log Subpage")
            {
                SubPageLink = "Lead ID" = field("Lead ID");
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(DisqualifyLead)
            {
                ApplicationArea = All;
                Image = CloseDocument;
                Enabled = EditableAction;
                Caption = 'Disqualify Lead';
                ToolTip = 'Mark this lead as disqualified and record the reason.';
                trigger OnAction()
                var
                    DialogboxConstProjectRejectionCodeunit: Codeunit DialogboxConstProjectRejection;
                begin
                    DialogboxConstProjectRejectionCodeunit.DialogboxForDisqualifiedLead(Rec);
                end;
            }
        }
    }
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
    begin
        Rec.TestField("Lead Name");
        Rec.TestField(Email);
        Rec.TestField("Mobile No.");
    end;

    trigger OnAfterGetRecord()
    begin
        IsQualified := (Rec."Lead Status" = Rec."Lead Status"::Qualified);
        if Rec."Lead Status" = Rec."Lead Status"::Disqualified then
            EditableAction := false;
        if Rec."Disqualification Reason" <> '' then
            FieldEditable := false;
    end;

    trigger OnOpenPage()
    begin
        EditableAction := true;
        FieldEditable := true;
    end;

    var
        IsQualified: Boolean;
        FieldEditable: Boolean;
        EditableAction: Boolean;

    procedure ValidateLeadStatus()
    var
        ConfirmMgt: Codeunit "Confirm Management";
    begin
        case xRec."Lead Status" of
            "Lead Status"::New:
                if Rec."Lead Status" = "Lead Status"::Qualified then
                    Error('Lead must be Contacted before it can be marked as Qualified.');
            "Lead Status"::Contacted:
                if Rec."Lead Status" = "Lead Status"::New then
                    Error('Cannot move back to New from Contacted.');
            "Lead Status"::Qualified:
                if Rec."Lead Status" <> "Lead Status"::Qualified then
                    Error('Cannot change status after Qualified.');
            "Lead Status"::Disqualified:
                if Rec."Lead Status" <> "Lead Status"::Disqualified then
                    Error('Cannot change status after Disqualified.');
        end;
        if Rec."Lead Status" = "Lead Status"::Qualified then
            if Rec."Assigned Sales Person" = '' then
                Error('Assigned Sales Person must be populated before marking as Qualified.');
        if Rec."Lead Status" = "Lead Status"::Disqualified then
            if not ConfirmMgt.GetResponseOrDefault('Are you sure you want to Disqualify this lead?', false) then
                Rec."Lead Status" := xRec."Lead Status";
    end;
}