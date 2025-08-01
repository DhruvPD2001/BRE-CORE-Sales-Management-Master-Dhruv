page 53503 DialogBoxForRejection
{
    PageType = StandardDialog;
    Caption = 'Enter Reason Rejection';
    layout
    {
        area(content)
        {
            field(ReasonForRejection; reasonvalue)
            {
                Caption = 'Reason for Rejection';
                ApplicationArea = All;
                ToolTip = 'Enter the reason for rejection.';
            }
        }
    }

    trigger OnQueryClosePage(CloseAction: Action): Boolean;
    begin
        if CloseAction = Action::Cancel then
            exit(true);

        if CloseAction = Action::OK then
            if reasonvalue = '' then begin
                Message('Please enter a reason for rejection before proceeding.');
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