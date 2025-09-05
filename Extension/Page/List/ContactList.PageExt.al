pageextension 53119 "Contact List" extends "Contact List"
{
    layout
    {
        modify("No.")
        {
            Caption = 'Lead ID';
        }
        addafter("E-Mail")
        {
            field("Lead Source"; Rec."Lead Source")
            {
                ApplicationArea = All;
                ToolTip = 'Lead Source';
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
            }
            field("Lead Rating"; Rec."Lead Rating")
            {
                ApplicationArea = All;
                ToolTip = 'Lead Rating';
            }
            field("Next Task Date"; Rec."Next Task Date")
            {
                ApplicationArea = All;
                ToolTip = 'Next Task Date';
            }
            field("Property Type"; Rec."Property Type")
            {
                ApplicationArea = All;
                ToolTip = 'Property Type';
            }
            field("Preferred Location"; Rec."Preferred Location")
            {
                ApplicationArea = All;
                ToolTip = 'Preferred Location';
            }
            field("Budget Range (AED)"; Rec."Budget Range (AED)")
            {
                ApplicationArea = All;
                ToolTip = 'Budget Range (AED)';
            }
            field("Date Created"; Rec."Date Created")
            {
                ApplicationArea = All;
                ToolTip = 'Date Created';
            }
        }
    }
}