page 53254 DialogBoxForInvoiceRejection
{
    PageType = StandardDialog;
    Caption = 'Enter Remark';
    layout
    {
        area(content)
        {
            field(ReasonForRejection; reasonvalue)
            {
                Caption = 'Enter Remark';
                ApplicationArea = All;
                ToolTip = 'Enter Remark';
            }
        }
    }

    trigger OnQueryClosePage(CloseAction: Action): Boolean;
    begin
        if CloseAction = Action::Cancel then
            exit(true);

        if CloseAction = Action::OK then
            if reasonvalue = '' then begin
                Message('Please enter a reason before proceeding.');
                exit(false);
            end;

        exit(true);
    end;

    procedure GetReason(): Text;
    begin
        exit(reasonvalue);
    end;

    var
        reasonvalue: Text;
}