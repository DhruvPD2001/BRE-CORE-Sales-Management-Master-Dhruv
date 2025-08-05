page 51502 "Lead List"
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = "Lead Management";
    CardPageId = "Lead Card";
    UsageCategory = Lists;
    ModifyAllowed = false;
    InsertAllowed = false;
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Lead ID"; Rec."Lead ID")
                {
                    ToolTip = 'Unique identifier for the lead.';
                }
                field("Lead Name"; Rec."Lead Name")
                {
                    ToolTip = 'Name of the lead.';
                }
                field("Lead Source"; Rec."Lead Source")
                {
                    ToolTip = 'Source from which the lead was generated.';
                }
                field("Lead Status"; Rec."Lead Status")
                {
                    ToolTip = 'Current status of the lead.';
                }
                field("Assigned Sales Person"; Rec."Assigned Sales Person")
                {
                    ToolTip = 'Salesperson assigned to the lead.';
                }
                field("Interst Area"; Rec."Interst Area")
                {
                    ToolTip = 'Area of interest for the lead.';
                }
                field("Follow-up Date"; Rec."Follow-up Date")
                {
                    ToolTip = 'Date for the next follow-up with the lead.';
                    ApplicationArea = All;
                    StyleExpr = FollowUpStyle;
                }
                field("Created Date"; Rec."Created Date")
                {
                    ToolTip = 'Date when the lead was created.';
                }
            }
        }
    }

    var
        FollowUpStyle: Text;

    trigger OnAfterGetRecord()
    begin
        FollowUpStyle := '';

        if Rec."Follow-up Date" <> 0D then begin
            if Rec."Follow-up Date" < Today() then
                FollowUpStyle := 'Attention';
            if (Rec."Follow-up Date" = Today()) then
                FollowUpStyle := 'Favorable';
            if Rec."Follow-up Date" > Today() then
                FollowUpStyle := 'Favorable';
        end;
    end;
}