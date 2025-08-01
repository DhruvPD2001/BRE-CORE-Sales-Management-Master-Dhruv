page 53106 "Vendor Proposal"
{
    PageType = Card;
    SourceTable = "Vendor Proposal";
    ApplicationArea = All;
    UsageCategory = None;
    Caption = 'Vendor Proposal Card';

    layout
    {
        area(Content)
        {
            group("General Information")
            {
                Caption = 'General Information';
                field("Proposal ID"; Rec."Proposal ID")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    Editable = false;
                    ToolTip = 'Unique identifier for the vendor proposal.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = 'Identifier for the project associated with the vendor proposal.';
                    trigger OnValidate()
                    var
                        ProjectRec: Record "Construction Project";
                    begin
                        ProjectRec.SetRange("Project ID", Rec."Project ID");
                        if ProjectRec.FindFirst() then
                            Rec."Project Name" := ProjectRec."Project Name"
                        else
                            Rec."Project Name" := '';
                    end;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = All;
                    Caption = 'Project Name';
                    ToolTip = 'Name of the project associated with the vendor proposal.';
                    Editable = false;
                }
                field("Project Location"; Rec."Project Location")
                {
                    ApplicationArea = All;
                    Caption = 'Project Location';
                    Editable = false;
                    ToolTip = 'Location of the project associated with the vendor proposal.';
                }
                field("Proposal Date"; Rec."Proposal Date")
                {
                    ApplicationArea = All;
                    Caption = 'Proposal Date';
                    ToolTip = 'Date when the vendor proposal was created.';
                }
                field(Description; Rec.Description)
                {
                    Caption = 'Description';
                    ApplicationArea = All;
                    MultiLine = true;
                    ToolTip = 'Description of the vendor proposal.';
                }

            }
            group("Vendor Information")
            {
                Caption = 'Vendor Information';
                field("Vendor ID"; Rec."Vendor ID")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = 'Identifier for the vendor associated with the proposal.';

                    trigger OnValidate()
                    var
                        VendorRec: Record "Facility Vendor Profiles";
                    begin
                        VendorRec.SetRange("Profile ID", Rec."Vendor ID");
                        if VendorRec.FindFirst() then begin
                            Rec."Vendor Name" := VendorRec."Profile Name";
                            Rec."Vendor Email" := VendorRec."Email Address";
                            Rec."Vendor Designation" := VendorRec.Designation;
                        end;
                    end;
                }
                field("Service Type"; Rec."Service Type")
                {
                    ApplicationArea = all;
                    Caption = 'Service Type';
                    ToolTip = 'Type of service provided by the vendor.';

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        vendorbusinessprofileRec: Record "Vendor Business Profile";
                        Vendorbusinessprofilelist: Page "Vendor Business Profile Lookup";
                    begin
                        vendorbusinessprofileRec.SetRange("Profile ID", Rec."Vendor ID");
                        Vendorbusinessprofilelist.SetTableView(vendorbusinessprofileRec);
                        Vendorbusinessprofilelist.LookupMode(true);
                        if not (Vendorbusinessprofilelist.RunModal() = Action::LookupOK) then
                            exit(false);

                        Text := Vendorbusinessprofilelist.GetLookUpValues(Vendorbusinessprofilelist, vendorbusinessprofileRec);
                        exit(true);
                    end;

                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Name of the vendor associated with the proposal.';
                }
                field("Vendor Email"; Rec."Vendor Email")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Email address of the vendor associated with the proposal.';
                }
                field("Vendor Designation"; Rec."Vendor Designation")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Designation of the vendor associated with the proposal.';
                }
            }

            group("Delivery & Performance")
            {
                Caption = 'Delivery & Performance';
                field("Delivery Location"; Rec."Delivery Location")
                {
                    ApplicationArea = All;
                    Caption = 'Delivery Location';
                    ToolTip = 'Location where the goods or services will be delivered.';
                }
                field("Delivery Date"; Rec."Delivery Date")
                {
                    ApplicationArea = All;
                    Caption = 'Delivery Date';
                    ToolTip = 'Expected date of delivery for the goods or services.';
                }
                field(Incoterms; Rec.Incoterms)
                {
                    ApplicationArea = All;
                    Caption = 'Incoterms';
                    ToolTip = 'International Commercial Terms that define the responsibilities of buyers and sellers.';

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        incoterms: Record Incoterms;
                        IncotermsList: Page "Incoterms List";
                    begin
                        IncotermsList.LookupMode(true);
                        if not (IncotermsList.RunModal() = Action::LookupOK) then
                            exit(false);

                        Text := IncotermsList.GetLookUpValues(IncotermsList, incoterms);
                        exit(true);
                    end;
                }
                field("Late Delivery Penalty %"; Rec."Late Delivery Penalty %")
                {
                    ApplicationArea = All;
                    Caption = 'Late Delivery Penalty %';
                    ToolTip = 'Percentage penalty applied for late delivery of goods or services.';
                    trigger OnValidate()
                    begin
                        if Rec."Late Delivery Penalty %" > 100 then
                            Error('Late Delivery Penalty %1 cannot exceed 100.', Rec."Late Delivery Penalty %");
                    end;
                }
            }
            group("Price & Payment Terms")
            {
                Caption = 'Price & Payment Terms';
                field("Total Contract Value (AED)"; Rec."Total Contract Value (AED)")
                {
                    ApplicationArea = All;
                    Caption = 'Total Contract Value (AED)';
                    ToolTip = 'Total value of the contract in AED.';
                }
                field("Advance Payment (%)"; Rec."Advance Payment (%)")
                {
                    ApplicationArea = All;
                    Caption = 'Advance Payment (%)';
                    ToolTip = 'Percentage of the total contract value to be paid in advance.';
                }
                field("Interim Payment (%)"; Rec."Interim Payment (%)")
                {
                    ApplicationArea = All;
                    Caption = 'Interim Payment (%)';
                    ToolTip = 'Percentage of the total contract value to be paid as interim payments.';
                }
                field("Final Payment (%)"; Rec."Final Payment (%)")
                {
                    ApplicationArea = All;
                    Caption = 'Final Payment (%)';
                    ToolTip = 'Percentage of the total contract value to be paid as final payment.';
                }
                field("Payment Method"; Rec."Payment Method")
                {
                    ApplicationArea = All;
                    Caption = 'Payment Method';
                    ToolTip = 'Method of payment for the contract value.';
                }
            }
            group("Quality & Compliance")
            {
                Caption = 'Quality & Compliance';
                field("UAE Compliance Requirements"; Rec."UAE Compliance Requirements")
                {
                    ApplicationArea = All;
                    Caption = 'UAE Compliance Requirements';
                    ToolTip = 'Compliance requirements specific to UAE regulations.';
                    ShowMandatory = true;

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        UAERegulatoryReq: Record "UAE Regulatory Requirements";
                        UAERegulatoryList: Page "UAE Regulatory Reqs. List";
                    begin
                        UAERegulatoryList.LookupMode(true);
                        if not (UAERegulatoryList.RunModal() = Action::LookupOK) then
                            exit(false);

                        Text := UAERegulatoryList.GetLookUpValues(UAERegulatoryList, UAERegulatoryReq);
                        exit(true);
                    end;
                }
                field("Industry Standards"; Rec."Industry Standards")
                {
                    ApplicationArea = All;
                    Caption = 'Industry Standards';
                    ShowMandatory = true;
                    ToolTip = 'Industry standards applicable to the vendor proposal.';

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        industryStandard: Record "Industry Standards";
                        industryStandardsList: Page "Industry Standards";
                    begin
                        industryStandardsList.LookupMode(true);
                        if not (industryStandardsList.RunModal() = Action::LookupOK) then
                            exit(false);

                        Text := industryStandardsList.GetLookUpValues(industryStandardsList, industryStandard);
                        exit(true);
                    end;
                }

            }
            field("Warranty Period (Months)"; Rec."Warranty Period (Months)")
            {
                ApplicationArea = All;
                Caption = 'Warranty Period (Months)';
                ToolTip = 'Warranty period for the goods or services provided by the vendor.';
            }
            group("GOVERNING LAW & DISPUTE RESOLUTION")
            {
                Caption = 'Governing Law & Dispute Resolution';

                field("Dispute Resolution"; Rec."Dispute Resolution")
                {
                    ApplicationArea = All;
                    Caption = 'Dispute Resolution';
                    ShowMandatory = true;
                    ToolTip = 'Method of resolving disputes related to the vendor proposal.';
                    TableRelation = GoverningLawDisputeResolution.Name;
                }
            }

            group("Vendor Proposal Details")
            {
                Caption = 'Vendor Proposal Details';

                field("Work Scope"; Rec."Work Scope")
                {
                    ApplicationArea = All;
                    multiLine = true;
                    ToolTip = 'Scope of work defined in the vendor proposal.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    Caption = 'Proposed Contract Start Date';
                    ApplicationArea = All;
                    ToolTip = 'Proposed start date for the contract associated with the vendor proposal.';

                    trigger OnValidate()
                    begin
                        CalculateDuration();
                    end;
                }
                field("End Date"; Rec."End Date")
                {
                    Caption = 'Proposed Contract End Date';
                    ApplicationArea = All;
                    ToolTip = 'Proposed end date for the contract associated with the vendor proposal.';

                    trigger OnValidate()
                    begin
                        CalculateDuration();
                    end;
                }
                field("Duration"; Rec."Duration")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Duration of the contract based on the start and end dates.';
                }

            }
            group("Vendor Proposale Status")
            {
                Caption = 'Vendor Proposal Status';

                field("Internal Approval Status"; Rec."Internal Approval Status")
                {
                    ApplicationArea = All;
                    Editable = approvaleditable;
                    ToolTip = 'Status of the internal approval process for the vendor proposal.';
                }
                field("Internal Remarks"; Rec."Internal Remarks")
                {
                    ApplicationArea = All;
                    multiLine = true;
                    Editable = approvaleditable;
                    ToolTip = 'Internal remarks or comments regarding the vendor proposal.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'User who created the vendor proposal.';
                }
                field("Vendor Approval Status"; Rec."Vendor Approval Status")
                {
                    ApplicationArea = All;
                    Editable = approvaleditable;
                    ToolTip = 'Status of the vendor''s approval for the proposal.';
                }
                field("Vendor Remarks"; Rec."Vendor Remarks")
                {
                    ApplicationArea = All;
                    multiLine = true;
                    Editable = approvaleditable;
                    ToolTip = 'Remarks or comments provided by the vendor regarding the proposal.';
                }
                field("Created DateTime"; Rec."Created DateTime")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Date and time when the vendor proposal was created.';
                }
            }
            part("Pricing Breakdown Grid"; "Pricing Breakdown Grid")
            {
                ApplicationArea = All;
                Caption = 'Pricing Breakdown Grid';
                Visible = true;
                SubPageLink = "Vendor Proposal ID" = field("Proposal ID");
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
                Caption = 'Submit for Approval';
                Image = Approve;
                Enabled = CanSubmitForApproval;
                ToolTip = 'Submit the vendor proposal for approval to the project manager.';
                trigger OnAction()
                var
                    ApprovalVendorProposal: Codeunit "Approval Vendor Proposal";
                begin

                    ApprovalVendorProposal.SubmitVendorProposal(Rec);
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
    begin
        Rec.TestField("Project ID");
        Rec.TestField("Vendor ID");
        Rec."Proposal Date" := Today;
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

    procedure CalculateDuration()
    var
        ProposalStartDate: Date;
        ProposalEndDate: Date;
        Years: Integer;
        Months: Integer;
        Days: Integer;
        DurationText: Text;
        TempStartDate: Date;
        DaysDifference: Integer;
    begin
        ProposalStartDate := Rec."Start Date";
        ProposalEndDate := Rec."End Date";
        if (ProposalStartDate <> 0D) and (ProposalEndDate <> 0D) then begin
            if ProposalEndDate >= ProposalStartDate then begin
                // Calculate total days difference
                DaysDifference := ProposalEndDate - ProposalStartDate + 1;

                // If the difference is exactly 365 or 366 days (accounting for leap year)
                if (DaysDifference = 365) or (DaysDifference = 366) then begin
                    Years := 1;
                    Months := 0;
                    Days := 0;
                end else begin
                    TempStartDate := ProposalStartDate;

                    // Calculate the years
                    Years := 0;
                    while (CALCDATE('<+1Y>', TempStartDate) <= ProposalEndDate) or
                          (CALCDATE('<+1Y-1D>', TempStartDate) = ProposalEndDate) do begin
                        TempStartDate := CALCDATE('<+1Y>', TempStartDate);
                        Years := Years + 1;
                    end;

                    // Calculate the months
                    Months := 0;
                    while CALCDATE('<+1M>', TempStartDate) <= ProposalEndDate do begin
                        TempStartDate := CALCDATE('<+1M>', TempStartDate);
                        Months := Months + 1;
                    end;

                    // Calculate the remaining days
                    Days := ProposalEndDate - TempStartDate + 1;
                end;

                // Build the duration text
                DurationText := '';
                if Years > 0 then
                    DurationText := Format(Years) + ' year(s) ';

                if Months > 0 then
                    DurationText := DurationText + Format(Months) + ' month(s) ';

                if Days > 0 then
                    DurationText := DurationText + Format(Days) + ' day(s)';

                DurationText := DelChr(DurationText, '<>', ' ');

                Rec."Duration" := CopyStr(DurationText, 1, StrLen(DurationText));
            end else
                Rec."Duration" := '';
        end else
            Rec."Duration" := '';
    end;
}







