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

        // Clear any existing lead rating first
        Clear(leadrating);
        if ContactRec.Get(Rec."No.") then begin

            // Process based on Lead Status
            case Rec."Lead Status" of
                leadstatus::Qualified:
                    begin
                        SubStage.SetRange("No.", Rec."No.");
                        SubStage.SetRange("Lead Status", Enum::"Lead Status"::Qualified);
                        SubStage.SetCurrentKey("Stage ID");
                        if SubStage.FindLast() then
                            if SubStage."Stage ID" > Rec."Stage ID" then
                                TotalScore := SubStage."Lead Score"
                            else
                                TotalScore := Rec."Lead Score"
                        else
                            TotalScore := Rec."Lead Score";

                        // For Qualified status, determine rating based on Lead Score (Hot/Warm/Cold)
                        ScoreSetup.Reset();
                        ScoreSetup.SetFilter("Min Score Percent", '<=%1', TotalScore);
                        ScoreSetup.SetFilter("Max Score Percent", '>=%1', TotalScore);

                        if ScoreSetup.FindFirst() then
                            leadrating := ScoreSetup."Lead Rating"
                        else
                            leadrating := leadrating::" "; // Default to blank if no range found
                    end;

                leadstatus::Disqualified:
                    leadrating := leadrating::" ";
                else
                    //     // For any other status, set to blank
                    leadrating := ContactRec."Lead Rating";
            end;

            ContactRec.Validate("Total Score", TotalScore);
            ContactRec.Validate("Lead Rating", leadrating);
            ContactRec.Modify(true);
        end;
    end;

    var
        TotalScore: Integer;
}
