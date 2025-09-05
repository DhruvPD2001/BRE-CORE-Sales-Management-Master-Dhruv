page 52006 "Lead Stage SubPage"
{
    Caption = 'Lead Stages Sub Page';
    PageType = ListPart;
    ApplicationArea = All;
    SourceTable = "Lead Stage SubPage";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Stage ID"; Rec."Stage ID")
                {
                    ApplicationArea = All;
                    Editable = false; // AutoIncrement
                    ToolTip = 'Unique system-generated ID for each stage.';
                }
                field("Stage Name"; Rec."Stage Name")
                {
                    ApplicationArea = All;
                    Editable = false; // AutoIncrement
                    ToolTip = 'The name of the stage. Must be unique within each company.';
                }
                field("Description"; Rec.Description)
                {
                    ApplicationArea = All;
                    Editable = false; // AutoIncrement
                    ToolTip = 'Optional description providing more details about this stage.';
                }
                field("Lead Score"; Rec."Lead Score")
                {
                    ApplicationArea = All;
                    Editable = false; // AutoIncrement
                    ToolTip = 'Numeric value (0–100) representing the score of leads in this stage.';
                }
                field("Lead Status"; Rec."Lead Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'The status of the lead at this stage (New, Active, Closed-Won, or Closed-Lost).';

                    trigger OnValidate()
                    begin
                        UpdateQualifyStageStatus();
                    end;
                }
                field("ID"; Rec."ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'ID';
                    Editable = false; // AutoIncrement
                    Visible = false;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'No.';
                    Editable = false; // AutoIncrement
                    TableRelation = "Contact"."No."; // Replace with your parent table name
                }
            }
        }
    }


    // procedure UpdateQualifyStageStatus()
    // var
    //     SubStage: Record "Lead Stage SubPage";
    //     ScoreSetup: Record "Lead Score Range";
    //     ContactRec: Record Contact;
    //     leadstatus: Enum "Lead Status";
    //     leadrating: Enum "Lead Rating";
    // begin
    //     // Guard: must have parent No.
    //     if Rec."No." = '' then
    //         exit;

    //     // Work with the latest line that has Lead Status = Qualify OR Disqualify
    //     SubStage.Reset();
    //     SubStage.SetRange("No.", Rec."No.");
    //     SubStage.SetFilter("Lead Status", '%1|%2', leadstatus::Qualified, leadstatus::Disqualified);

    //     // Optional: make sure ordering uses ID so FindLast returns highest ID
    //     SubStage.SetCurrentKey("ID");

    //     if not SubStage.FindLast() then
    //         exit; // no line found

    //     // Check if disqualified
    //     if SubStage."Lead Status" = leadstatus::Disqualified then begin
    //         // Blank the Lead Rating
    //         leadrating := leadrating::" "; // assuming "Lead Rating" is an enum
    //         SubStage.Modify(true);

    //         if ContactRec.Get(Rec."No.") then begin
    //             ContactRec.Validate("Lead Rating", leadrating::" ");
    //             ContactRec.Modify(true);
    //         end;

    //         exit; // stop further processing
    //     end;

    //     // Otherwise, if Qualified → evaluate Score
    //     ScoreSetup.Reset();
    //     ScoreSetup.SetFilter("Min Score Percent", '<=%1', Rec."Lead Score");
    //     ScoreSetup.SetFilter("Max Score Percent", '>=%1', Rec."Lead Score");

    //     if ScoreSetup.FindFirst() then begin
    //         // Update SubStage High Level Lead Rating
    //         leadrating := ScoreSetup."Lead Rating";
    //         SubStage.Modify(true);

    //         // Update related Contact record
    //         if ContactRec.Get(Rec."No.") then begin
    //             ContactRec.Validate("Lead Rating", leadrating);
    //             ContactRec.Modify(true);
    //         end;
    //     end;
    // end;

    procedure UpdateQualifyStageStatus()
    var
        SubStage: Record "Lead Stage SubPage";
        ScoreSetup: Record "Lead Score Range";
        ContactRec: Record Contact;
        leadstatus: Enum "Lead Status";
        leadrating: Enum "Lead Rating";
    begin
        // Guard: must have parent No.
        if Rec."No." = '' then
            exit;

        // Work with the latest line that has any lead status we care about
        SubStage.Reset();
        SubStage.SetRange("No.", Rec."No.");
        SubStage.SetFilter("Lead Status", '%1|%2|%3|%4',
            leadstatus::Qualified,
            leadstatus::Disqualified,
            leadstatus::New,
            leadstatus::Contacted);

        // Optional: make sure ordering uses ID so FindLast returns highest ID
        SubStage.SetCurrentKey("ID");

        if not SubStage.FindLast() then
            exit; // no line found

        // --- Case 1: New or Contacted → Always Blank ---
        if (SubStage."Lead Status" = leadstatus::New) or
           (SubStage."Lead Status" = leadstatus::Contacted) then begin
            leadrating := ScoreSetup."Lead Rating"::" ";
            SubStage.Modify(true);

            if ContactRec.Get(Rec."No.") then begin
                ContactRec.Validate("Lead Rating", leadrating);
                ContactRec.Modify(true);
            end;
            exit;
        end;

        // --- Case 2: Disqualified → Always Blank ---
        if SubStage."Lead Status" = leadstatus::Disqualified then begin
            leadrating := ScoreSetup."Lead Rating"::" ";
            SubStage.Modify(true);

            if ContactRec.Get(Rec."No.") then begin
                ContactRec.Validate("Lead Rating", leadrating);
                ContactRec.Modify(true);
            end;
            exit;
        end;

        // --- Case 3: Qualified → Evaluate Score ---
        if SubStage."Lead Status" = leadstatus::Qualified then begin

            ScoreSetup.Reset();
            ScoreSetup.SetFilter("Min Score Percent", '<=%1', Rec."Lead Score");
            ScoreSetup.SetFilter("Max Score Percent", '>=%1', Rec."Lead Score");

            if ScoreSetup.FindFirst() then begin
                leadrating := ScoreSetup."Lead Rating";
                SubStage.Modify(true);

                if ContactRec.Get(Rec."No.") then begin
                    ContactRec.Validate("Lead Rating", leadrating);
                    ContactRec.Modify(true);
                end;
            end;
        end;
    end;


}
