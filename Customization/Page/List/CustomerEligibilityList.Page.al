page 53123 "Customer Eligibility List"
{
    PageType = List;
    SourceTable = "Customer Eligibility";
    ApplicationArea = All;
    Caption = 'Customer Eligibility List';
    UsageCategory = Lists;
    CardPageId = "Customer Eligibility Card";
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Customer Eligibility ID"; Rec."Customer Eligibility ID")
                {
                    ApplicationArea = All;
                    Editable = false; // ID should not be editable
                    ToolTip = 'Unique identifier for the Customer Eligibility record.';
                }
                field("Name"; Rec."Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Name of the customer.';
                }
                field("Email"; Rec."Email")
                {
                    ApplicationArea = All;
                    ToolTip = 'Email address of the customer.';
                }
                field("Phone"; Rec."Phone")
                {
                    ApplicationArea = All;
                    ToolTip = 'Phone number of the customer.';
                }
                field("National ID"; Rec."National ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'National ID of the customer.';
                }
                // field("Created Date"; Rec."Created Date")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Date when the customer eligibility record was created.';
                // }
                field("Status"; Rec."Status")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            // action(Edit)
            // {
            //     // ApplicationArea = All;
            //     // Caption = 'Edit';
            //     // Image = Edit;
            //     // trigger OnAction()
            //     // var
            //     //     CustomerEligibilityCard: Page "Customer Eligibility Card";
            //     // begin
            //     //     CustomerEligibilityCard.SetRecord(Rec);
            //     //     CustomerEligibilityCard.RunModal;
            //     //     if CustomerEligibilityCard.IsChanged then
            //     //         CurrPage.Update;
            //     // end;
            // }
        }
    }

    trigger OnOpenPage()
    begin
        // Optional: Add any initialization code here
    end;
}