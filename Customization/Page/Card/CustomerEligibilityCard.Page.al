page 53122 "Customer Eligibility Card"
{
    PageType = Card;
    SourceTable = "Customer Eligibility";
    Caption = 'Customer Eligibility Card';
    ApplicationArea = All;


    layout
    {
        area(content)
        {
            group(Group1)
            {
                Caption = 'General Information';
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
                field("National ID"; Rec."National ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'National ID of the customer.';
                }
                field("DOB/Reg. No"; Rec."DOB/Reg. No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Date of Birth or Registration Number of the customer.';
                }
                field("Phone"; Rec."Phone")
                {
                    ApplicationArea = All;
                    ToolTip = 'Phone number of the customer.';
                }
                field("Email"; Rec."Email")
                {
                    ApplicationArea = All;
                    ToolTip = 'Email address of the customer.';
                }
            }
            group(Group2)
            {
                Caption = 'Property Interest';
                field("Project"; Rec."Project")
                {
                    ApplicationArea = All;
                    ToolTip = 'Project the customer is interested in.';
                }
                field("Unit Type"; Rec."Unit Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Unit Type the customer is interested in.';
                }
                field("Budget"; Rec."Budget")
                {
                    ApplicationArea = All;
                    ToolTip = 'Budget of the customer.';
                }
            }
            group(Group3)
            {
                Caption = 'AML/KYC';
                field("PEP Flag"; Rec."PEP Flag")
                {
                    ApplicationArea = All;
                    ToolTip = 'Politically Exposed Person flag.';
                }
                field("Sanctions Result"; Rec."Sanctions Result")
                {
                    ApplicationArea = All;
                    ToolTip = 'Result of sanctions check.';
                }
                field("Documents"; Rec."Documents")
                {
                    ApplicationArea = All;
                    ToolTip = 'Documents provided by the customer.';
                }
                field("Risk Score"; Rec."Risk Score")
                {
                    ApplicationArea = All;
                    ToolTip = 'Risk score of the customer.';
                }
            }
            group(Group4)
            {
                Caption = 'Financial Information';
                field("Income Bracket"; Rec."Income Bracket")
                {
                    ApplicationArea = All;
                    ToolTip = 'Income bracket of the customer.';
                }
                field("Source of Funds"; Rec."Source of Funds")
                {
                    ApplicationArea = All;
                    ToolTip = 'Source of funds of the customer.';
                }
            }
            group(Group5)
            {
                Caption = 'Workflow';
                field("Status"; Rec."Status")
                {
                    ApplicationArea = All;
                }
                field("Approver"; Rec."Approver")
                {
                    ApplicationArea = All;
                }
                field("Notes"; Rec."Notes")
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
            //     ApplicationArea = All;
            //     Caption = 'Edit';
            //     Image = Edit;
            //     trigger OnAction()
            //     begin
            //         // Code to edit the record
            //     end;
            // }
            // action(Delete)
            // {
            //     ApplicationArea = All;
            //     Caption = 'Delete';
            //     Image = Delete;
            //     trigger OnAction()
            //     begin
            //         // Code to delete the record
            //     end;
            // }
        }
    }
}