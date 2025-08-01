page 53101 "Incoterms List"
{
    PageType = List;
    SourceTable = "Incoterms";
    ApplicationArea = All;
    Caption = 'Incoterms List';
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
                    ToolTip = 'Unique identifier for the Incoterm.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    Caption = 'Incoterm Name';
                    ToolTip = 'Name of the Incoterm.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    Caption = 'Description';
                    ToolTip = 'Description of the Incoterm.';
                }
            }
        }
    }

    procedure GetLookUpValues(pIncotermsList: Page "Incoterms List"; pIncoterms: Record Incoterms): Text
    var
        isFirst: Boolean;
        lookUpValues: Text;
    begin
        pIncotermsList.SetSelectionFilter(pIncoterms);
        if pIncoterms.FindSet() then begin
            isFirst := true;
            repeat
                if isFirst then begin
                    lookUpValues := pIncoterms.Name;
                    isFirst := false;
                end else
                    lookUpValues += ', ' + pIncoterms.Name;
            until pIncoterms.Next() = 0;
        end;
        exit(lookUpValues);
    end;
}