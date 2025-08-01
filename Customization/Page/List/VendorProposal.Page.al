page 53107 "VendorProposal"
{
    PageType = List;
    SourceTable = "Vendor Proposal";
    ApplicationArea = All;
    Caption = 'Vendor Proposal List';
    UsageCategory = Lists;
    CardPageId = 53106;
    ModifyAllowed = false;
    InsertAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(ID; Rec."Proposal ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Unique identifier for the Vendor Proposal.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Unique identifier for the Project associated with the Vendor Proposal.';
                }
                field("Vendor ID"; Rec."Vendor ID")
                {
                    ApplicationArea = All;
                    Caption = 'Vendor ID';
                    ToolTip = 'Unique identifier for the Vendor associated with the Proposal.';
                }
                field(ProposalDate; Rec."Proposal Date")
                {
                    ApplicationArea = All;
                    Caption = 'Proposal Date';
                    ToolTip = 'Date when the Vendor Proposal was created.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                    Caption = 'Start Date';
                    ToolTip = 'Start date for the project associated with the Vendor Proposal.';
                }
            }
        }
    }
}