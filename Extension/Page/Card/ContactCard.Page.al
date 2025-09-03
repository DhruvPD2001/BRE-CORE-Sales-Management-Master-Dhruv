pageextension 53116 "Contact Card" extends "Contact Card"
{
    layout
    {
        modify("E-Mail")
        {
            trigger OnAfterValidate()
            var
                LeadRec: Record Contact;
            begin
                if Rec."E-Mail" <> '' then
                    if not Rec."E-Mail".Contains('@') then
                        Error('Invalid email address format.');
                if Rec."E-Mail" <> '' then begin
                    LeadRec.Reset();
                    LeadRec.SetRange("E-Mail", Rec."E-Mail");
                    if LeadRec.FindFirst() then
                        if LeadRec."No." <> Rec."No." then
                            Error('Duplicate email found: %1 already assigned to Lead: %2.', Rec."E-Mail", LeadRec.Name);
                end;
            end;
        }
        modify("Phone No.")
        {
            trigger OnAfterValidate()
            var
                LeadRec: Record Contact;
            begin
                if Rec."Phone No." <> '' then begin
                    LeadRec.Reset();
                    LeadRec.SetRange("Phone No.", Rec."Phone No.");
                    if LeadRec.FindFirst() then
                        if LeadRec."No." <> Rec."No." then
                            Error('Duplicate phone number found: %1 already assigned to Lead: %2.', Rec."Phone No.", LeadRec.Name);
                end;
            end;
        }
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

                    trigger OnValidate()
                    var
                        OldStatus: Enum "Lead Status";
                    begin
                        OldStatus := xRec."Lead Status";
                        if (OldStatus = OldStatus::New) and (Rec."Lead Status" = Rec."Lead Status"::Qualified) then
                            Error('Status cannot be changed directly from New to Qualified. Please change status from New to Contacted first.');
                        if (OldStatus = OldStatus::New) and (Rec."Lead Status" = Rec."Lead Status"::Disqualified) then
                            Error('Status cannot be changed directly from New to Disqualified. Please change status from New to Contacted first.');
                        if (OldStatus = OldStatus::Disqualified) and (Rec."Lead Status" = Rec."Lead Status"::Contacted) and (not Rec."Allow Reopen") then
                            Error('Reopening from Disqualified to Contacted is not allowed unless Allow Reopen is true.');
                        if (OldStatus = OldStatus::Disqualified) and (Rec."Lead Status" = Rec."Lead Status"::New) then
                            Error('Status cannot be changed directly from Disqualified to New. Please change status from New to Contacted first.');
                        if Rec."Lead Status" = Rec."Lead Status"::Disqualified then
                            Message('Please provide a Disqualification Reason.');
                        if OldStatus <> Rec."Lead Status" then begin
                            Rec."Previous Status" := OldStatus;
                            Rec."Status Changed By" := UserId();
                            Rec."Status Changed On" := CurrentDateTime;
                        end;
                    end;
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
                field("Allow Reopen"; Rec."Allow Reopen")
                {
                    ApplicationArea = All;
                    ToolTip = 'Allow Reopen of Lead';
                }
                field("Disqualification Reason"; Rec."Disqualification Reason")
                {
                    ApplicationArea = All;
                    ToolTip = 'Reason for Disqualification';
                    Editable = IsDisqualified;
                }
                field("Disqualification Date"; Rec."Disqualification Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Disqualification Date';
                    Editable = false;
                }
                field("Previous Status"; Rec."Previous Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Previous Status';
                }
                field("Status Changed By"; Rec."Status Changed By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Status Changed By';
                }
                field("Status Changed On"; Rec."Status Changed On")
                {
                    ApplicationArea = All;
                    ToolTip = 'Status Changed On';
                }
            }

            group("Property Requirements")
            {
                field("Property Type"; Rec."Property Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Property Type';
                }

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
    actions
    {
        addafter("C&ontact")
        {
            action(SendItemButtonsEmail)
            {
                ApplicationArea = All;
                Caption = 'Send Items Email';
                Image = Email;

                trigger OnAction()
                var
                    Emailer: Codeunit "Customer Item Emailer";
                    ItemsCsv: Text;
                begin
                    // TODO: replace with a proper picker; for demo:
                    ItemsCsv := '1896-S,1000'; // sample list
                    Emailer.SendItemsEmail(Rec."No.", ItemsCsv);
                    Message('Email sent to %1.', Rec."E-Mail");
                end;
            }
        }
    }
    trigger OnModifyRecord(): Boolean
    begin
        IsDisqualified := EditableDisqualifiedReason();
    end;

    trigger OnAfterGetRecord()
    var
        taskRec: Record "To-do";
        contactRec: Record Contact;
    begin
        IsDisqualified := EditableDisqualifiedReason();

        // Find the first To-do record for this contact with Date > Today
        taskRec.SetRange("Contact No.", Rec."No.");
        taskRec.SetFilter("Date", '>=%1', Today);
        taskRec.SetCurrentKey(Date);
        if taskRec.FindFirst() then begin
            // Find the matching contact record
            if contactRec.Get(taskRec."Contact No.") then begin
                contactRec."Expected Follow-up Date" := taskRec.Date;
                contactRec.Modify();
            end;
        end;
    end;


    procedure EditableDisqualifiedReason(): Boolean
    var
    begin
        exit(Rec."Lead Status" = Rec."Lead Status"::Disqualified);
    end;

    var
        IsDisqualified: Boolean;
}
