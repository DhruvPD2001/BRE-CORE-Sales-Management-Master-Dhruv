page 53102 "UAE Regulatory Reqs. List"
{
    PageType = List;
    SourceTable = "UAE Regulatory Requirements";
    ApplicationArea = All;
    Caption = 'UAE Regulatory Requirements List';
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
                    ToolTip = 'Unique identifier for the UAE Regulatory Requirement.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    Caption = 'UAE Regulatory Requirement Name';
                    ToolTip = 'Name of the UAE Regulatory Requirement.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    Caption = 'Description';
                    ToolTip = 'Description of the UAE Regulatory Requirement.';
                }
            }
        }
    }

    procedure GetLookUpValues(pUAERegulatoryList: Page "UAE Regulatory Reqs. List"; pUAERegulatoryReq: Record "UAE Regulatory Requirements"): Text
    var
        isFirst: Boolean;
        lookUpValues: Text;
    begin
        pUAERegulatoryList.SetSelectionFilter(pUAERegulatoryReq);
        if pUAERegulatoryReq.FindSet() then begin
            isFirst := true;
            repeat
                if isFirst then begin
                    lookUpValues := pUAERegulatoryReq.Name;
                    isFirst := false;
                end else
                    lookUpValues += ', ' + pUAERegulatoryReq.Name;
            until pUAERegulatoryReq.Next() = 0;
        end;
        exit(lookUpValues);
    end;
}