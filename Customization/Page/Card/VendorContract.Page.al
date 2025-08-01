page 53108 "Vendor Contract"
{
    PageType = Card;
    SourceTable = "Vendor Contract";
    ApplicationArea = All;
    Caption = 'Vendor Contract Card';
    UsageCategory = None;

    layout
    {
        area(Content)
        {
            group("General Information")
            {
                Caption = 'General Information';

                field("Contract ID"; Rec."Contract ID")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    Editable = false;
                    ToolTip = 'Unique identifier for the vendor contract.';
                }

                field("Proposal ID"; Rec."Proposal ID")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = 'The ID of the vendor proposal associated with this contract.';
                    trigger OnValidate()
                    var
                        VendorRec: Record "Vendor Proposal";
                    begin
                        VendorRec.SetRange("Proposal ID", Rec."Proposal ID");
                        if VendorRec.FindFirst() then begin
                            Rec."Vendor ID" := VendorRec."Vendor ID";
                            Rec."Vendor Name" := VendorRec."Vendor Name";
                            Rec."Vendor Email" := VendorRec."Vendor Email";
                            Rec."Vendor Designation" := VendorRec."Vendor Designation";
                            Rec."Project ID" := VendorRec."Project ID";
                            Rec."Work Scope" := VendorRec."Work Scope";
                            Rec."Contract Start Date" := VendorRec."Start Date";
                            Rec."Contract End Date" := VendorRec."End Date";
                            Rec."Payment Terms" := VendorRec."Payment Terms";
                            Rec."Compliance Required" := VendorRec."Compliance Required";
                            Rec."Created By" := VendorRec."Created By";
                            Rec."Project Name" := VendorRec."Project Name";
                            Rec."Duration" := VendorRec."Duration";
                            Rec."Project Location" := VendorRec."Project Location";
                            Rec."Delivery Location" := VendorRec."Delivery Location";
                            Rec."Delivery Date" := VendorRec."Delivery Date";
                            Rec."Late Delivery Penalty %" := VendorRec."Late Delivery Penalty %";
                            Rec."Total Contract Value (AED)" := VendorRec."Total Contract Value (AED)";
                            Rec."Advance Payment (%)" := VendorRec."Advance Payment (%)";
                            Rec."Interim Payment (%)" := VendorRec."Interim Payment (%)";
                            Rec."Final Payment (%)" := VendorRec."Final Payment (%)";
                            Rec."VAT %" := VendorRec."VAT %";
                            Rec."Payment Method" := VendorRec."Payment Method";
                            Rec."UAE Compliance Requirements" := VendorRec."UAE Compliance Requirements";
                            Rec."Industry Standards" := VendorRec."Industry Standards";
                            Rec."Warranty Period (Months)" := VendorRec."Warranty Period (Months)";
                            Rec."Dispute Resolution" := VendorRec."Dispute Resolution";
                            Rec.Description := VendorRec.Description;
                            Rec.Incoterms := VendorRec.Incoterms;
                            Rec."Work Scope" := VendorRec."Work Scope";
                            Rec."Contract Start Date" := VendorRec."Start Date";
                            Rec."Contract End Date" := VendorRec."End Date";
                            Rec.Description := VendorRec.Description;
                            Rec.Duration := VendorRec.Duration;
                            Rec."Service Type" := VendorRec."Service Type";
                        end;
                    end;

                }

                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = 'The ID of the project associated with this vendor contract.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = All;
                    Caption = 'Project Name';
                    Editable = false;
                    ToolTip = 'The name of the project associated with this vendor contract.';
                }
                field("Project Location"; Rec."Project Location")
                {
                    ApplicationArea = All;
                    Caption = 'Project Location';
                    Editable = false;
                    ToolTip = 'The location of the project associated with this vendor contract.';
                }
                field("Contract Date"; Rec."Contract Date")
                {
                    ApplicationArea = All;
                    Caption = 'Contract Date';
                    ToolTip = 'The date when the vendor contract was created.';
                }
                field(Description; Rec.Description)
                {
                    Caption = 'Description';
                    ApplicationArea = All;
                    ToolTip = 'A description of the vendor contract.';
                    Editable = false;
                    MultiLine = true;
                }
            }

            group("Vendor Information")
            {
                field("Vendor ID"; Rec."Vendor ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'The ID of the vendor associated with this contract.';
                }
                field("Service Type"; Rec."Service Type")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'The type of service provided by the vendor.';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'The name of the vendor associated with this contract.';
                }
                field("Vendor Email"; Rec."Vendor Email")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'The email address of the vendor associated with this contract.';
                }
                field("Vendor Designation"; Rec."Vendor Designation")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'The designation of the vendor contact person associated with this contract.';
                }
            }
            group("Delivery & Performance")
            {
                Caption = 'Delivery & Performance';
                field("Delivery Location"; Rec."Delivery Location")
                {
                    ApplicationArea = All;
                    Caption = 'Delivery Location';
                    Editable = false;
                    ToolTip = 'The location where the goods or services will be delivered.';
                }
                field("Delivery Date"; Rec."Delivery Date")
                {
                    ApplicationArea = All;
                    Caption = 'Delivery Date';
                    Editable = false;
                    ToolTip = 'The date by which the goods or services should be delivered.';
                }
                field(Incoterms; Rec.Incoterms)
                {
                    ApplicationArea = All;
                    Caption = 'Incoterms';
                    Editable = false;
                    ToolTip = 'The Incoterms applicable to the vendor contract.';
                }
                field("Late Delivery Penalty %"; Rec."Late Delivery Penalty %")
                {
                    ApplicationArea = All;
                    Caption = 'Late Delivery Penalty %';
                    Editable = false;
                    ToolTip = 'The penalty percentage applied for late delivery of goods or services.';
                }
            }
            group("Price & Payment Terms")
            {
                Caption = 'Price & Payment Terms';
                field("Total Contract Value (AED)"; Rec."Total Contract Value (AED)")
                {
                    ApplicationArea = All;
                    Caption = 'Total Contract Value (AED)';
                    Editable = false;
                    ToolTip = 'The total value of the vendor contract in AED.';
                }
                field("Advance Payment (%)"; Rec."Advance Payment (%)")
                {
                    ApplicationArea = All;
                    Caption = 'Advance Payment (%)';
                    Editable = false;
                    ToolTip = 'The percentage of the total contract value to be paid in advance.';
                }
                field("Interim Payment (%)"; Rec."Interim Payment (%)")
                {
                    ApplicationArea = All;
                    Caption = 'Interim Payment (%)';
                    Editable = false;
                    ToolTip = 'The percentage of the total contract value to be paid as interim payments.';
                }
                field("Final Payment (%)"; Rec."Final Payment (%)")
                {
                    ApplicationArea = All;
                    Caption = 'Final Payment (%)';
                    Editable = false;
                    ToolTip = 'The percentage of the total contract value to be paid as the final payment.';
                }
                field("Payment Method"; Rec."Payment Method")
                {
                    ApplicationArea = All;
                    Caption = 'Payment Method';
                    Editable = false;
                    ToolTip = 'The method of payment for the vendor contract.';
                }
                field("Warranty Period (Months)"; Rec."Warranty Period (Months)")
                {
                    ApplicationArea = All;
                    Caption = 'Warranty Period (Months)';
                    Editable = false;
                    ToolTip = 'The warranty period for the goods or services provided under the vendor contract.';
                }
            }
            group("Quality & Compliance")
            {
                Caption = 'Quality & Compliance';
                field("UAE Compliance Requirements"; Rec."UAE Compliance Requirements")
                {
                    ApplicationArea = All;
                    Caption = 'UAE Compliance Requirements';
                    ToolTip = 'The compliance requirements specific to UAE regulations for the vendor contract.';
                    Editable = false;
                }
                field("Industry Standards"; Rec."Industry Standards")
                {
                    ApplicationArea = All;
                    Caption = 'Industry Standards';
                    ToolTip = 'The industry standards applicable to the vendor contract.';
                    ShowMandatory = true;
                    Editable = false;
                }

            }

            group("GOVERNING LAW & DISPUTE RESOLUTION")
            {
                Caption = 'Governing Law & Dispute Resolution';


                field("Dispute Resolution"; Rec."Dispute Resolution")
                {
                    ApplicationArea = All;
                    Caption = 'Dispute Resolution';
                    ShowMandatory = true;
                    Editable = false;
                    ToolTip = 'The method of dispute resolution agreed upon in the vendor contract.';
                }
            }



            group("Vendor Contract Details")
            {
                Caption = 'Vendor Contract Details';
                field("Work Scope"; Rec."Work Scope")
                {
                    ApplicationArea = All;
                    multiLine = true;
                    Editable = false;
                    ToolTip = 'The scope of work to be performed under the vendor contract.';
                }
                field("Contract Start Date"; Rec."Contract Start Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'The start date of the vendor contract.';
                }
                field("Contract End Date"; Rec."Contract End Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'The end date of the vendor contract.';
                }
                field("Duration"; Rec."Duration")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'The duration of the vendor contract.';
                }
            }

            group("Vendor Contract Status")
            {
                Caption = 'Vendor Contract Status';
                field("Internal Approval Status"; Rec."Internal Approval Status")
                {
                    ApplicationArea = All;
                    Editable = approvaleditable;
                    ToolTip = 'The internal approval status of the vendor contract.';
                }
                field("Internal Remarks"; Rec."Internal Remarks")
                {
                    ApplicationArea = All;
                    multiLine = true;
                    Editable = approvaleditable;
                    ToolTip = 'Internal remarks or comments regarding the vendor contract.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'The user who created the vendor contract.';
                }
                field("Vendor Approval Status"; Rec."Vendor Approval Status")
                {
                    ApplicationArea = All;
                    Editable = approvaleditable;
                    ToolTip = 'The approval status of the vendor for this contract.';
                }
                field("Vendor Remarks"; Rec."Vendor Remarks")
                {
                    ApplicationArea = All;
                    multiLine = true;
                    Editable = approvaleditable;
                    ToolTip = 'Remarks or comments provided by the vendor regarding the contract.';
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
                ToolTip = 'Submit the vendor contract for approval by the project manager.';

                trigger OnAction()
                var
                    ApprovalVendorProposal: Codeunit "Approval Vendor Contract";
                begin
                    ApprovalVendorProposal.SubmitVendorContract(Rec);
                    Dialog.Message('✅ Your request has been submitted successfully.');

                end;
            }

        }
        area(Promoted)
        {
            actionref(submitforapprovaltoprojectmanager; "Submission for Approval")
            { }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
    begin
        Rec.TestField("Proposal ID");
    end;

    trigger OnAfterGetRecord()
    begin
        approvaleditable := UserApprovalProjectStatus();
        CanSubmitForApproval := (Rec."Internal Approval Status" in [Rec."Internal Approval Status"::Draft, Rec."Internal Approval Status"::Rejected]);
    end;

    procedure UserApprovalProjectStatus(): Boolean
    var
        UserPersonalization: Record "User Personalization";
    begin

        if UserPersonalization.Get(UserSecurityId()) then
            case UserPersonalization."Profile ID" of
                'PROJECT MANAGER':
                    exit(true);
                'PROJECT OWNER':
                    exit(false);
                'FINANCE MANAGER':
                    exit(false);
            end;

        exit(false);
    end;

    var
        approvaleditable: Boolean;
        CanSubmitForApproval: Boolean;

}