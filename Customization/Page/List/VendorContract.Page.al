page 53109 "VendorContractList"
{
    PageType = List;
    SourceTable = "Vendor Contract";
    ApplicationArea = All;
    Caption = 'Vendor Contract List';
    UsageCategory = Lists;
    CardPageId = 53108;
    ModifyAllowed = false;
    InsertAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(ID; Rec."Contract ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Unique identifier for the Vendor Contract.';
                }
                field("Proposal ID"; Rec."Proposal ID")
                {
                    ApplicationArea = All;
                    Caption = 'Proposal ID';
                    ToolTip = 'Identifier for the proposal associated with the Vendor Contract.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Identifier for the project associated with the Vendor Contract.';
                }
                field("Vendor ID"; Rec."Vendor ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Identifier for the vendor associated with the Vendor Contract.';
                }
                field("Contract Date"; Rec."Contract Date")
                {
                    ApplicationArea = All;
                    Caption = 'Contract Date';
                    ToolTip = 'Date when the Vendor Contract was created.';
                }
                field("Contract Start Date"; Rec."Contract Start Date")
                {
                    ApplicationArea = All;
                    Caption = 'Contract Start Date';
                    ToolTip = 'Start date for the contract associated with the Vendor Contract.';
                }
            }
        }
    }
}