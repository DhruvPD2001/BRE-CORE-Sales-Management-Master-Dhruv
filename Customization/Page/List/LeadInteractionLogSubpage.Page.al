page 53111 "Lead Interaction Log Subpage"
{
    PageType = ListPart;
    ApplicationArea = All;
    SourceTable = "Lead Interaction Log";
    CardPageId = "Lead Card";
    UsageCategory = None;
    ModifyAllowed = true;
    InsertAllowed = true;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Interaction Date"; Rec."Interaction Date")
                {
                    ToolTip = 'Date of the interaction with the lead.';
                    // Editable = CanEditCoreFields;
                }
                field("Interaction Method"; Rec."Interaction Method")
                {
                    ToolTip = 'Method of interaction with the lead.';
                    // Editable = CanEditCoreFields;
                }
                field("Notes"; Rec."Notes")
                {
                    ToolTip = 'Notes for the interaction with the lead.';
                    Editable = true;
                }
                field("Sales Rep ID"; Rec."Sales Rep ID")
                {
                    ToolTip = 'Sales Rep ID for the interaction with the lead.';
                    // Editable = CanEditCoreFields;
                }
                field("Next Follow-Up Date"; Rec."Next Follow-Up Date")
                {
                    ToolTip = 'Date for the next follow-up with the lead.';
                    Editable = true;
                }
            }
        }
    }

    var
        OrderByDateLbl: Label 'sorting ("Interaction Date") Order(Descending)';

    trigger OnAfterGetCurrRecord()
    begin
        Rec.SetView(OrderByDateLbl);
    end;

    trigger OnOpenPage()
    begin
        Rec.SetView(OrderByDateLbl);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Interaction Date" := Today;
        Rec."Sales Rep ID" := CopyStr(UserId, 1, StrLen(UserId));

        if xRec."Lead ID" <> '' then
            Rec."Lead ID" := xRec."Lead ID";
    end;

    // trigger OnQueryClosePage(CloseAction: Action): Boolean
    // begin
    //     if Rec."Interaction Method" = Rec."Interaction Method"::" " then
    //         Error('Please select an Interaction Method before saving.');
    // end;

    trigger OnAfterGetRecord()
    begin
        CanEditCoreFields := Rec.IsTemporary or (Rec."Interaction Date" = 0D);
    end;

    var
        CanEditCoreFields: Boolean;
}
