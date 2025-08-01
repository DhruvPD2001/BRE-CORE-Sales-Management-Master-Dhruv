page 51502 "Lead List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Lead Management";
    CardPageId = "Lead Card";

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
                }
                field("Created Date"; Rec."Created Date")
                {
                    ToolTip = 'Date when the lead was created.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("New Lead")
            {
                ToolTip = 'Create a new lead.';
                ApplicationArea = All;
                Caption = 'New Lead';
                Image = New;
                trigger OnAction()
                var
                    Lead: Record "Lead Management";
                begin
                    Page.RunModal(Page::"Lead Card", Lead);

                end;
            }
        }
    }


}