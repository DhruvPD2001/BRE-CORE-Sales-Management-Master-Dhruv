page 53753 "Vendor Assignment"
{
    PageType = Card;
    SourceTable = "Vendor Assignment";
    UsageCategory = None;
    ApplicationArea = All;
    Caption = 'Vendor Assignment';

    layout
    {
        area(Content)
        {
            group(ProjectDetails)
            {
                Caption = 'Project Details';
                field("Assignment ID"; Rec."Assignment ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Unique identifier for the vendor assignment.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Identifier for the project associated with this vendor assignment.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Name of the project associated with this vendor assignment.';
                }
                field("Project Location"; Rec."Project Location")
                {
                    ApplicationArea = All;
                    ToolTip = 'Location of the project associated with this vendor assignment.';
                }
                field("Project Scope"; Rec."Project Scope")
                {
                    ApplicationArea = All;
                    ToolTip = 'Scope of work for the project associated with this vendor assignment.';
                }
                field("Project Start Date"; Rec."Project Start Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Start date of the project.';
                }
                field("Project End Date"; Rec."Project End Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'End date of the project.';
                }
            }
            group(ContractDetails)
            {
                Caption = 'Contract Details';
                field("Contract ID"; Rec."Contract ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Unique identifier for the contract.';
                }
                field("Contract Date"; Rec."Contract Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Date when the contract was signed.';
                }
                field("Contract Type"; Rec."Contract Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Type of contract for this assignment.';
                }
                field("Contract Status"; Rec."Contract Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Current status of the contract.';
                }

                field("Remark On Rejection"; Rec."Remark On Rejection")
                {
                    ApplicationArea = All;
                    ToolTip = 'Remarks provided when the contract is rejected.';
                }
                field("Contract Template"; Rec."Contract Template")
                {
                    ApplicationArea = All;
                    ToolTip = 'Template used for the contract.';
                }
                field("Contract File"; Rec."Contract File")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Uploaded contract file. Click to upload or view.';

                    trigger OnDrillDown()
                    var
                        azureBlobUploader: Codeunit "Azure AD Blob Storage";
                        fileName: Text;
                        folderName: Text;
                        uploadResult: Text;
                    begin
                        folderName := 'ConstructionContracts';
                        fileName := azureBlobUploader.ValidateDocument(uploadResult, folderName);
                        if fileName <> '' then begin
                            Rec."Contract File" := copyStr(uploadResult, 1, StrLen(uploadResult));
                            Rec.Modify();
                            Message('File uploaded successfully: %1', fileName);
                        end;
                    end;
                }
                field("Contract Notes"; Rec."Contract Notes")
                {
                    ApplicationArea = All;
                    ToolTip = 'Additional notes related to the contract.';
                }
            }

            group(VendorDetails)
            {
                Caption = 'Vendor/Subcontractor Details';
                field("ID"; Rec."Vendor/Subcontractor ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Unique identifier for the vendor or subcontractor.';
                }
                field("Name"; Rec."Vendor/Subcontractor Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Name of the vendor or subcontractor.';
                }

                field("Email"; Rec."Vendor Email")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Email address of the vendor or subcontractor.';
                }
            }
            part(ProjectMilestoneTask; "Project Milestone Tasks")
            {
                Editable = false;
                SubPageLink = "Contract ID" = field("Contract ID");
            }
            group(FinancialDetails)
            {
                Caption = 'Financial Details';
                field("Total Contract Amount"; Rec."Total Contract Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Total amount for the contract.';
                }
                field("Payment Schedule"; Rec."Payment Schedule")
                {
                    ApplicationArea = All;
                    ToolTip = 'Schedule of payments for the contract.';
                }
                field("Payment Method"; Rec."Payment Method")
                {
                    ApplicationArea = All;
                    ToolTip = 'Method of payment for the contract.';
                }
            }
            group(WorkDetails)
            {
                Caption = 'Work Scope and Timelines';
                field("Work Scope"; Rec."Work Scope")
                {
                    ApplicationArea = All;
                    ToolTip = 'Scope of work for this assignment.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Start date for the work.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'End date for the work.';
                }
            }
            group(ApprovalDetails)
            {
                Caption = 'Approval Details';

                field("Vendor Assignment Status"; Rec."Vendor Assignment Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Current status of the vendor assignment.';
                }

                field("Remark"; Rec."Remark")
                {
                    ApplicationArea = All;
                    ToolTip = 'Remarks or comments about the assignment.';
                }
                field("Reviewed By"; Rec."Reviewed By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Person who reviewed the assignment.';
                }
                field("Approved By"; Rec."Approved By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Person who approved the assignment.';
                }
                field("Approval Date"; Rec."Approval Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Date when the assignment was approved.';
                }

                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    Editable = true;
                    ToolTip = 'User who created the assignment.';
                }
            }
            group(QualityNCompliance)
            {
                Caption = 'Quality & Compliance';
                field("UAE Regulatory Requirements"; Rec."UAE Regulatory Requirements")
                {
                    ApplicationArea = All;
                    ToolTip = 'Regulatory requirements applicable in the UAE.';
                }
                field("Industry Standards"; Rec."Industry Standards")
                {
                    ApplicationArea = All;
                    ToolTip = 'Industry standards to be followed for this assignment.';
                }
            }
            group(Miscellaneous)
            {
                field("Delivery Schedule"; Rec."Delivery Schedule")
                {
                    ApplicationArea = All;
                    ToolTip = 'Schedule for delivery of work or materials.';
                }
                field("Work SPecifications"; Rec."Work SPecifications")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifications for the work to be performed.';
                }
                field("Penalty Clauses"; Rec."Penalty Clauses")
                {
                    ApplicationArea = All;
                    ToolTip = 'Penalty clauses applicable to the contract.';
                }
                field(Incoterms; Rec.Incoterms)
                {
                    ApplicationArea = All;
                    ToolTip = 'Incoterms applicable to the contract.';
                }
                field("Warranty Period"; Rec."Warranty Period")
                {
                    ApplicationArea = All;
                    Caption = 'Warranty Period (Months)';
                    ToolTip = 'Warranty period in months for the contract.';
                }
                field("Governing Law & Dispute Rsln."; Rec."Governing Law & Dispute Rsln.")
                {
                    Caption = 'Governing Law & Dispte Resolution';
                    ApplicationArea = All;
                    ToolTip = 'Governing law and dispute resolution terms for the contract.';
                }
            }

            part("Pricing Breakdown Grid"; "Pricing Breakdown Grid")
            {
                ApplicationArea = All;
                Caption = 'Pricing Breakdown Grid';
                Visible = true;
                Editable = false;
                SubPageLink = "Vendor Contract ID" = field("Contract ID");
                UpdatePropagation = Both;
            }
        }
    }


    actions
    {

        area(Processing)
        {

            action("Submission for Approval")
            {
                ApplicationArea = All;
                Caption = 'Send for Approval';
                Image = Approve;
                Enabled = CanSubmitForApproval;
                ToolTip = 'Submit the vendor assignment for approval by the project manager.';

                trigger OnAction()
                var
                    ApprovalVendorProposal: Codeunit "Vendor Assignment Approval";
                begin
                    ApprovalVendorProposal.SubmitVendorAssignment(Rec);
                    Dialog.Message('✅ Your request has been submitted successfully.');
                end;
            }

            action("Change Vendor Assignment Status")
            {
                ApplicationArea = All;
                Caption = 'Change Vendor Assignment Status';
                Image = Action;
                Visible = IsPropertyManager;
                ToolTip = 'Change the status of the vendor assignment.';

                trigger OnAction()
                var
                    selectedOption: Integer;
                begin

                    if not (Rec."Vendor Assignment Status" in [Rec."Vendor Assignment Status"::Approved, Rec."Vendor Assignment Status"::Suspended, Rec."Vendor Assignment Status"::Active]) then begin
                        Message('You can only change the Vendor Assignment Status if it is Approved , Active  or Suspended.');
                        exit;
                    end;


                    selectedOption := Dialog.StrMenu('Activate  Vendor Assignment Status, Suspend Vendor Assignment Status', 1);
                    case selectedOption of
                        1:
                            begin
                                Rec."Vendor Assignment Status" := Rec."Vendor Assignment Status"::Active;
                                Rec.Modify();
                                Message('Vendor Assignment Status has been updated to Active.');
                            end;
                        2:
                            begin
                                Rec."Vendor Assignment Status" := Rec."Vendor Assignment Status"::Suspended;
                                Rec.Modify();
                                Message('Vendor Assignment Status has been updated to Suspended.');
                            end;
                    end;
                end;
            }

        }
        area(Promoted)
        {
            actionref(submitforapprovaltoprojectmanager; "Submission for Approval")
            {
            }
            actionref(submitforapprovaltoprojectmanager1; "Change Vendor Assignment Status")
            {
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        // CurrPage."Construction Project Document List Part".Page.SetProjectId(Rec."Project ID");

        CanSubmitForApproval := (Rec."Vendor Assignment Status" in [Rec."Vendor Assignment Status"::Draft, Rec."Vendor Assignment Status"::Rejected]);
    end;


    trigger OnOpenPage()
    begin
        IsPropertyManager := CheckUserRole();
    end;

    procedure CheckUserRole(): Boolean
    var
        UserPersonalization: Record "User Personalization";
    begin
        if UserPersonalization.Get(UserSecurityId()) then
            case UserPersonalization."Profile ID" of
                'PROJECT MANAGER':
                    exit(true);
                else
                    exit(false);
            end;
        exit(false);
    end;

    var
        IsPropertyManager: Boolean;
        CanSubmitForApproval: Boolean;
}
