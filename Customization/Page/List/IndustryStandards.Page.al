page 53504 "Industry Standards"
{
    PageType = List;
    SourceTable = "Industry Standards";
    ApplicationArea = All;
    Caption = 'Industry Standards List';
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
                    ToolTip = 'Represents the unique internal identifier for the industry standard. This field is hidden and not editable.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the industry standard.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Provides a detailed description of the industry standard.';
                }
            }
        }
    }

    procedure GetLookUpValues(pIndustryStandardsList: Page "Industry Standards"; pIndustryStandard: Record "Industry Standards"): Text
    var
        isFirst: Boolean;
        lookUpValues: Text;
    begin
        pIndustryStandardsList.SetSelectionFilter(pIndustryStandard);
        if pIndustryStandard.FindSet() then begin
            isFirst := true;
            repeat
                if isFirst then begin
                    lookUpValues := pIndustryStandard.Name;
                    isFirst := false;
                end else
                    lookUpValues += ', ' + pIndustryStandard.Name;
            until pIndustryStandard.Next() = 0;
        end;

        exit(lookUpValues);
    end;
}