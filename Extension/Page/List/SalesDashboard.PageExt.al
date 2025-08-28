pageextension 51251 "Sales Dashboard" extends "Sales & Relationship Mgr. RC"
{
    actions
    {
        addfirst(sections)
        {
            group(Action258)
            {
                Caption = 'Sales Management';
                action(NoSeriesSetup)
                {
                    Caption = 'No. Series Setup';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "No. Series Setup";
                }
                action(ProjectTypes)
                {
                    Caption = 'Project Types';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Project Types";
                }
                action(DocumentTypes)
                {
                    Caption = 'Document Types';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Document Types";
                }
                action(ConstructionProjects)
                {
                    Caption = 'Construction Projects';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Construction Project List";
                }
                action(Incoterms)
                {
                    Caption = 'Incoterms';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Incoterms List";
                }
                action(UAERegulatoryRequirements)
                {
                    Caption = 'UAE Regulatory Requirements';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "UAE Regulatory Reqs. List";
                }
                action(VendorCategoryMaster)
                {
                    Caption = 'Vendor Category Master';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Vendor Category Master List";
                }
                action(VendorProposal)
                {
                    Caption = 'Vendor Proposals';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Vendor Proposal";
                }
                action(VendorProposalApproval)
                {
                    Caption = 'Vendor Proposal Approvals';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Vendor Proposal Approval List";
                }
                action(VendorContract)
                {
                    Caption = 'Vendor Contracts';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Vendor Contract";
                }
                action(VendorContractApproval)
                {
                    Caption = 'Vendor Contract Approvals';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Vendor Contract Approval List";
                }
                action(VendorAssignment)
                {
                    Caption = 'Vendor Assignments';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Vendor Assignment List";
                }
                action(VendorAssignmentApproval)
                {
                    Caption = 'Vendor Assignment Approvals';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Vendor Assignment Approval";
                }
                action(IndustryStandards)
                {
                    Caption = 'Industry Standards';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Industry Standards";
                }
                action(VendorDocuments)
                {
                    Caption = 'Vendor Documents';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Vendor Document List";
                }
            }
        }
    }
}