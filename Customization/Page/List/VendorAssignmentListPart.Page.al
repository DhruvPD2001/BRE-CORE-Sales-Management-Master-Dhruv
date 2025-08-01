page 53754 "Vendor Assignment List Part"
{
    PageType = ListPart;
    SourceTable = "Vendor Assignment";
    ApplicationArea = All;
    Caption = 'Vendor Assignment List';
    CardPageId = "Vendor Assignment";
    ModifyAllowed = false;
    InsertAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Assignment ID"; Rec."Assignment ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unique identifier for this vendor assignment.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the project linked to this vendor assignment.';
                }
                field("Project Location"; Rec."Project Location")
                {
                    ApplicationArea = All;
                    ToolTip = 'Indicates the location where the project is executed.';
                }
                field("Project Scope"; Rec."Project Scope")
                {
                    ApplicationArea = All;
                    ToolTip = 'Provides details about the scope of work for the project.';
                }
                field("Project Start Date"; Rec."Project Start Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the planned start date of the project.';
                }
                field("Project End Date"; Rec."Project End Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the planned end date of the project.';
                }
                field("Vendor/Subcontractor Name"; Rec."Vendor/Subcontractor Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Displays the name of the vendor or subcontractor assigned to this project.';
                }
                field("Contract ID"; Rec."Contract ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the unique identifier of the contract associated with this assignment.';
                }
                field("Contract Type"; Rec."Contract Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the type of contract for this vendor assignment, such as Fixed Price or Time & Material.';
                }
                field("Contract Status"; Rec."Contract Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Indicates the current status of the contract, such as Active, Completed, or Terminated.';
                }
                field("Contract Date"; Rec."Contract Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the contract was signed or created.';
                }
                field("Total Contract Amount"; Rec."Total Contract Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the total monetary value of the contract for this vendor assignment.';
                }
                field("Work Scope"; Rec."Work Scope")
                {
                    ApplicationArea = All;
                    ToolTip = 'Describes the specific work or services to be provided by the vendor under this contract.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Indicates the actual start date of the vendor assignment.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Indicates the actual end date of the vendor assignment.';
                }
                field("Reviewed By"; Rec."Reviewed By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the person who reviewed the vendor assignment before approval.';
                }
                field("Approved By"; Rec."Approved By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the person who approved the vendor assignment.';
                }
                field("Approval Date"; Rec."Approval Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Displays the date when the vendor assignment was approved.';
                }
            }
        }
    }
}