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
                    ToolTip = 'The name of the stage. Must be unique within each company.';
                }
                field("Description"; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Optional description providing more details about this stage.';
                }
                field("Lead Score"; Rec."Lead Score")
                {
                    ApplicationArea = All;
                    ToolTip = 'Numeric value (0–100) representing the score of leads in this stage.';
                }
                field("Lead Status"; Rec."Lead Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'The status of the lead at this stage (New, Active, Closed-Won, or Closed-Lost).';
                }
                field("ID"; Rec."ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'ID';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'No.';
                    TableRelation = "Contact"."No."; // Replace with your parent table name
                }
            }
        }
    }


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

        // Work with the latest line that has Lead Status = Qualify
        SubStage.Reset();
        SubStage.SetRange("No.", Rec."No.");
        SubStage.SetRange("Lead Status", leadstatus::Qualified);

        // Optional: make sure ordering uses ID so FindLast returns highest ID
        SubStage.SetCurrentKey("ID");

        if not SubStage.FindLast() then
            exit; // no qualifying line found

        ScoreSetup.Reset();
        ScoreSetup.SetFilter("Min Score Percent", '<=%1', Rec."Lead Score");
        ScoreSetup.SetFilter("Max Score Percent", '>=%1', Rec."Lead Score");

        if ScoreSetup.FindFirst() then begin
            // 3. Update SubStage High Level Lead Status
            leadrating := ScoreSetup."Lead Rating"; // assuming "Lead Rating" is an enum
            SubStage.Modify(true);

            // 4. Update related Contact record
            if ContactRec.Get(Rec."No.") then begin
                ContactRec.Validate("Lead Rating", ScoreSetup."Lead Rating");
                ContactRec.Modify(true);
            end;
        end;
    end;



    trigger OnModifyRecord(): Boolean
    begin
        UpdateQualifyStageStatus();
        exit(true);
    end;

}
