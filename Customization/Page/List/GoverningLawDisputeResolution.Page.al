page 53103 "GoverningLawDisputeResolution"
{
    PageType = List;
    SourceTable = "GoverningLawDisputeResolution";
    ApplicationArea = All;
    Caption = 'Governing Law & Dispute Resolution List';
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(ID; Rec.ID)
                {
                    ApplicationArea = All;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Unique identifier for the Governing Law & Dispute Resolution.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    Caption = 'Governing Law & Dispute Resolution Name';
                    ToolTip = 'Name of the Governing Law & Dispute Resolution.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    Caption = 'Description';
                    ToolTip = 'Description of the Governing Law & Dispute Resolution.';
                }
            }
        }
    }
}