pageextension 51256 "Task Card" extends "Task Card"
{
    layout
    {
        modify("TypeSaaS")
        {
            Visible = false;
        }

        modify(StartTime)
        {
            Enabled = StartTimeEnable;
        }

        modify("Duration")
        {
            Enabled = DurationEnable;
        }

        modify(EndingTime)
        {
            Enabled = EndingTimeEnable;
        }

        modify("Location")
        {
            Enabled = LocationEnable;
        }

        modify(AllDayEvent)
        {
            Enabled = AllDayEventEnable;
        }

        // Add Custom Type field in the General group
        addafter("TypeSaaS")
        {
            field("Custome Type"; Rec."Custome Type")
            {
                ApplicationArea = All;
                Caption = 'Task Type';
                ToolTip = 'Select the type of task to automatically set duration and make time fields editable.';

                trigger OnValidate()
                begin
                    ValidateCustomTaskType();
                    EnableFields();
                    CurrPage.Update(false);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        EnableFields();
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        EnableFields();
    end;

    trigger OnOpenPage()
    begin
        EnableFields();
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
        end;

        // Calculate and set ending date/time
        CalculateEndingDateTime();
    end;

    local procedure EnableFields()
    begin
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
                // Default case - no custom type selected, follow OOB logic
                StartTimeEnable := false;
                EndingTimeEnable := false;
                DurationEnable := false;
                LocationEnable := false;
                AllDayEventEnable := false;
            end;
        end;

        // Call OOB logic to maintain standard behavior
        Rec.GetEndDateTime();
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