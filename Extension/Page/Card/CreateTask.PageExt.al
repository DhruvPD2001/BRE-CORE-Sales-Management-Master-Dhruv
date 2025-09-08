pageextension 51255 "Create Task" extends "Create Task"
{
    layout
    {
        modify("TypeSaaS")
        {
            Visible = false;
        }

        modify("Start Time")
        {
            Enabled = StartTimeEnable; // Use Enable instead of Editable
        }

        modify("Duration")
        {
            Enabled = DurationEnable; // Use Enable instead of Editable
        }

        modify("Ending Time")
        {
            Enabled = EndingTimeEnable; // Use Enable instead of Editable
        }

        addfirst(General)
        {
            field("Custome Type"; Rec."Custome Type")
            {
                ApplicationArea = All;
                Caption = 'Task Type';
                ToolTip = 'Select the type of task to automatically set duration and make time fields editable.';

                trigger OnValidate()
                begin
                    ValidateCustomTaskType();
                    EnableFields(); // Call enable fields function
                    CurrPage.Update(false);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        EnableFields(); // Enable fields based on current record
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        EnableFields(); // Enable fields for new record
    end;

    trigger OnOpenPage()
    begin
        EnableFields(); // Initialize field states when page opens
    end;

    var
        StartTimeEnable: Boolean;
        EndingTimeEnable: Boolean;
        DurationEnable: Boolean;
        AllDayEventEnable: Boolean;
        LocationEnable: Boolean;

    local procedure ValidateCustomTaskType()
    begin
        // Set appropriate start time and duration based on task type
        case Rec."Custome Type" of
            Rec."Custome Type"::Meeting:
                begin
                    Rec."Start Time" := 090000T; // 9:00 AM
                    Rec.Duration := 30 * 60 * 1000; // 30 minutes
                    Rec."All Day Event" := false;
                end;
            Rec."Custome Type"::"Phone Call":
                begin
                    Rec."Start Time" := 100000T; // 10:00 AM
                    Rec.Duration := 30 * 60 * 1000; // 30 minutes
                    Rec."All Day Event" := false;
                end;
            Rec."Custome Type"::"Site Visit":
                begin
                    Rec."Start Time" := 140000T; // 2:00 PM
                    Rec.Duration := 30 * 60 * 1000; // 30 minutes
                    Rec."All Day Event" := false;
                end;
            else begin
                Rec."Start Time" := 090000T; // Default 9:00 AM
                Rec.Duration := 30 * 60 * 1000; // 30 minutes
                Rec."All Day Event" := false;
            end;
        end;

        // Calculate and set ending date/time
        CalculateEndingDateTime();
    end;

    local procedure EnableFields()
    begin
        // OOB logic અનુસાર fields enable કરવા માટે

        // Custom Task Type આધારે fields enable કરો
        case Rec."Custome Type" of
            Rec."Custome Type"::Meeting:
                begin
                    StartTimeEnable := not Rec."All Day Event";
                    EndingTimeEnable := not Rec."All Day Event";
                    DurationEnable := not Rec."All Day Event";
                    LocationEnable := true;
                    AllDayEventEnable := true;
                end;
            Rec."Custome Type"::"Phone Call":
                begin
                    StartTimeEnable := true;
                    EndingTimeEnable := true;
                    DurationEnable := true;
                    LocationEnable := false;
                    AllDayEventEnable := false;
                end;
            Rec."Custome Type"::"Site Visit":
                begin
                    StartTimeEnable := not Rec."All Day Event";
                    EndingTimeEnable := not Rec."All Day Event";
                    DurationEnable := not Rec."All Day Event";
                    LocationEnable := true;
                    AllDayEventEnable := true;
                end;
            else begin
                // Default case - no custom type selected
                StartTimeEnable := false;
                EndingTimeEnable := false;
                DurationEnable := false;
                LocationEnable := false;
                AllDayEventEnable := false;
            end;
        end;
    end;

    local procedure CalculateEndingDateTime()
    var
        StartDateTime: DateTime;
        EndDateTime: DateTime;
    begin
        if (Rec.Date <> 0D) and (Rec."Start Time" <> 0T) and (Rec.Duration <> 0) then begin
            StartDateTime := CreateDateTime(Rec.Date, Rec."Start Time");
            EndDateTime := StartDateTime + Rec.Duration;

            Rec."Ending Date" := DT2Date(EndDateTime);
            Rec."Ending Time" := DT2Time(EndDateTime);
        end;
    end;
}