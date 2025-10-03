// page 51501 "Lead Card"
// {
//     PageType = Card;
//     ApplicationArea = All;
//     UsageCategory = None;
//     SourceTable = "Lead Management";
//     Caption = 'Lead Card';
//     layout
//     {
//         area(Content)
//         {
//             group("General Information")
//             {
//                 Editable = not IsQualified;
//                 field("Lead ID"; Rec."Lead ID")
//                 {
//                     Editable = false;
//                     ToolTip = 'Unique identifier for the lead.';
//                 }
//                 field("Lead Name"; Rec."Lead Name")
//                 {
//                     ToolTip = 'Name of the lead.';
//                     trigger OnValidate()
//                     begin
//                         if Rec."Lead Name" = '' then
//                             Error('Lead Name cannot be empty.');
//                     end;
//                 }
//                 field("Lead Owner"; Rec."Lead Owner")
//                 {
//                     ToolTip = 'Owner of the lead.';
//                 }
//                 field("Lead Source"; Rec."Lead Source")
//                 {
//                     ToolTip = 'Source from which the lead was generated.';
//                 }
//                 field("Other"; Rec."Other")
//                 {
//                     ToolTip = 'Specifies any other lead source not listed in the predefined options.';
//                     Editable = (Rec."Lead Source" = Rec."Lead Source"::Other);
//                 }
//                 field("Campaign Name"; Rec."Campaign Name")
//                 {
//                     ToolTip = 'Specifies the name of the marketing campaign or promotion from which the lead was generated.';
//                     Editable = (Rec."Lead Source" = Rec."Lead Source"::"Campaign/Events");
//                 }
//                 field("Lead Status"; Rec."Lead Status")
//                 {
//                     ToolTip = 'Current status of the lead.';
//                     Editable = FieldEditable;
//                     trigger OnValidate()
//                     begin
//                         ValidateLeadStatus();
//                     end;
//                 }
//                 field("Lead Rating"; Rec."Lead Rating")
//                 {
//                     ToolTip = 'Rating of the lead.';
//                 }
//                 field("Disqualification Reason"; Rec."Disqualification Reason")
//                 {
//                     ToolTip = 'Reason why the lead was disqualified.';
//                     Editable = FieldEditable;
//                 }
//                 field("Disqualification Date"; Rec."Disqualification Date")
//                 {
//                     ToolTip = 'Date when the lead was disqualified.';
//                     Editable = false;
//                 }
//             }
//             group("Contact & Company Details")
//             {
//                 Editable = not IsQualified;
//                 field("Assigned Sales Person"; Rec."Assigned Sales Person")
//                 {
//                     ToolTip = 'Salesperson assigned to the lead.';
//                     TableRelation = "Salesperson/Purchaser";

//                     trigger OnValidate()
//                     var
//                         SalesRole: Record "Salesperson/Purchaser";
//                     begin
//                         if SalesRole.Get(Rec."Assigned Sales Person") then
//                             Rec."Position/Role" := SalesRole."Job Title";   // replace with actual role field name in Salesperson/Purchaser table
//                     end;
//                 }
//                 field(Email; Rec.Email)
//                 {
//                     ToolTip = 'Email address of the lead.';
//                     trigger OnValidate()
//                     var
//                         LeadRec: Record "Lead Management";
//                     begin
//                         if Rec.Email <> '' then
//                             if not Rec.Email.Contains('@') then
//                                 Error('Invalid email address format.');
//                         if Rec.Email <> '' then begin
//                             LeadRec.Reset();
//                             LeadRec.SetRange(Email, Rec.Email);
//                             if LeadRec.FindFirst() then
//                                 if LeadRec."Lead ID" <> Rec."Lead ID" then
//                                     Error('Duplicate email found: %1 already assigned to Lead: %2.', Rec.Email, LeadRec."Lead Name");
//                         end;
//                     end;
//                 }
//                 field("Mobile No."; Rec."Mobile No.")
//                 {
//                     ToolTip = 'Mobile number of the lead.';
//                     trigger OnValidate()
//                     var
//                         LeadRec: Record "Lead Management";
//                     begin
//                         if Rec."Mobile No." <> '' then begin
//                             LeadRec.Reset();
//                             LeadRec.SetRange("Mobile No.", Rec."Mobile No.");
//                             if LeadRec.FindFirst() then
//                                 if LeadRec."Lead ID" <> Rec."Lead ID" then
//                                     Error('Duplicate phone number found: %1 already assigned to Lead: %2.', Rec."Mobile No.", LeadRec."Lead Name");
//                         end;
//                     end;
//                 }

//                 field("Company Name"; Rec."Company Name")
//                 {
//                     ToolTip = 'Company Name to the lead.';
//                 }
//                 field("Position/Role"; Rec."Position/Role")
//                 {
//                     ToolTip = 'Position/Role attend to the lead.';
//                 }
//                 field("Interst Area"; Rec."Interst Area")
//                 {
//                     ToolTip = 'Area of interest for the lead.';
//                 }
//                 field(Nationality; Rec.Nationality)
//                 {
//                     ToolTip = 'Nationality of the lead';
//                 }
//                 field("Preferred Language"; Rec."Preferred Language")
//                 {
//                     ToolTip = 'Preferred Language of the Lead.';
//                     TableRelation = Language.Name;
//                 }
//             }

//             group("Property Requirements")
//             {
//                 field("Property Type"; Rec."Property Type")
//                 {
//                     ToolTip = 'Specifies the type of property the lead is interested in, such as apartment, villa, or commercial space.';
//                     TableRelation = "Property Type"."Property Type";
//                 }
//                 field("Preferred Location"; Rec."Preferred Location")
//                 {
//                     ToolTip = 'Specifies the location or area preferred by the lead for the property.';
//                 }
//                 field("Expected Budget"; Rec."Expected Budget")
//                 {
//                     ToolTip = 'Specifies the budget range the lead is willing to spend on the property.';
//                 }
//                 field("Size"; Rec."Size")
//                 {
//                     ToolTip = 'Specifies the size requirement of the property, such as square feet or square meters.';
//                     TableRelation = "Unit of Measure".Code;
//                 }
//                 field("Bedrooms & Bathrooms"; Rec."Bedrooms & Bathrooms")
//                 {
//                     ToolTip = 'Specifies the number of bedrooms and bathrooms required by the lead.';
//                 }
//                 field("Furnishing Status"; Rec."Furnishing Status")
//                 {
//                     ToolTip = 'Specifies whether the lead prefers a furnished, semi-furnished, or unfurnished property.';
//                 }
//                 field("Preferred Payment Plan"; Rec."Preferred Payment Plan")
//                 {
//                     ToolTip = 'Specifies the payment plan preferred by the lead, such as installment or one-time payment.';
//                 }
//                 field("Move-in Timeline"; Rec."Move-in Timeline")
//                 {
//                     ToolTip = 'Specifies the expected timeline by which the lead wants to move into the property.';
//                 }
//             }
//             group("Financial & Legal Details (For Compliance)")
//             {
//                 field("Emirates ID/Passport Number"; Rec."Emirates ID/Passport Number")
//                 {
//                     ToolTip = 'Specifies the Emirates ID or Passport Number of the lead for identification purposes.';
//                 }
//                 field("Visa Status"; Rec."Visa Status")
//                 {
//                     ToolTip = 'Specifies the visa status of the lead, such as resident, visitor, or work visa.';
//                 }
//                 field("Source of Funds"; Rec."Source of Funds")
//                 {
//                     ToolTip = 'Specifies the declared source of funds that the lead will use for the property purchase.';
//                 }
//                 field("Mortgage Pre-Approval Status"; Rec."Mortgage Pre-Approval Status")
//                 {
//                     ToolTip = 'Specifies whether the lead has obtained mortgage pre-approval from a bank or lender.';
//                 }
//                 field("TAX Registration_VAT"; Rec."TAX Registration_VAT")
//                 {
//                     ToolTip = 'Specifies the VAT or Tax Registration Number of the lead, if applicable.';
//                 }
//                 field("RERA Broker ID"; Rec."RERA Broker ID")
//                 {
//                     ToolTip = 'Specifies the RERA Broker ID associated with the lead or transaction.';
//                 }
//                 field("Preferred Sale Type"; Rec."Preferred Sale Type")
//                 {
//                     ToolTip = 'Specifies the preferred type of sale for the lead, such as off-plan, secondary market, or resale.';
//                 }
//             }
//             group("Follow-Up")
//             {
//                 field("Follow-up Date"; Rec."Follow-up Date")
//                 {
//                     ToolTip = 'Date for the next follow-up with the lead.';
//                     ApplicationArea = All;
//                     Editable = IsFollowUpEditable;
//                 }
//                 field(Notes; Rec.Notes)
//                 {
//                     ToolTip = 'Additional notes regarding the lead.';
//                 }
//             }
//             group("System Information")
//             {
//                 field("Created By"; Rec."Created By")
//                 {
//                     Editable = false;
//                     ToolTip = 'User who created the lead.';
//                 }
//                 field("Created Date"; Rec."Created Date")
//                 {
//                     Editable = false;
//                     ToolTip = 'Date when the lead was created.';
//                 }
//             }
//             part("lead interaction log"; "Lead Interaction Log Subpage")
//             {
//                 SubPageLink = "Lead ID" = field("Lead ID");
//             }
//         }
//     }
//     actions
//     {
//         area(Processing)
//         {
//             action("Convert To Opportunity")
//             {
//                 ApplicationArea = All;
//                 Caption = 'Convert to Opportunity';
//                 Image = Opportunity;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;
//                 Enabled = Rec."Lead Status" = Rec."Lead Status"::Qualified;
//                 ToolTip = 'Convert this qualified lead into an opportunity.';

//                 trigger OnAction()
//                 var
//                     OpportunityRecord: Record "Opportunity Management";
//                     LeadConversionMgt: Codeunit "Lead to Opportunity Mgt";
//                     OpportunityCard: Page "Opportunity Management";
//                     OpportunityNo: Code[20];
//                 begin
//                     OpportunityNo := LeadConversionMgt.ConvertLeadToOpportunity(Rec);

//                     // Try to find and open the created opportunity
//                     OpportunityRecord.SetRange("Opportunity ID", OpportunityNo);
//                     if OpportunityRecord.FindFirst() then begin
//                         OpportunityCard.SetRecord(OpportunityRecord);
//                         OpportunityCard.Run();
//                     end;

//                     Message('Lead successfully converted to Opportunity: %1', OpportunityNo);
//                 end;
//             }
//             action(DisqualifyLead)
//             {
//                 ApplicationArea = All;
//                 Image = CloseDocument;
//                 Enabled = EditableAction;
//                 Caption = 'Disqualify Lead';
//                 ToolTip = 'Mark this lead as disqualified and record the reason.';
//                 trigger OnAction()
//                 var
//                     DialogboxConstProjectRejectionCodeunit: Codeunit DialogboxConstProjectRejection;
//                 begin
//                     DialogboxConstProjectRejectionCodeunit.DialogboxForDisqualifiedLead(Rec);
//                 end;
//             }
//         }
//     }
//     trigger OnInsertRecord(BelowxRec: Boolean): Boolean
//     var
//     begin
//         Rec.TestField("Lead Name");
//         Rec.TestField(Email);
//         Rec.TestField("Mobile No.");
//     end;

//     var
//         IsFollowUpEditable: Boolean;

//     trigger OnAfterGetRecord()
//     begin
//         IsQualified := (Rec."Lead Status" = Rec."Lead Status"::Qualified);
//         if Rec."Lead Status" = Rec."Lead Status"::Disqualified then
//             EditableAction := false;
//         if Rec."Disqualification Reason" <> '' then
//             FieldEditable := false;

//         // IsFollowUpEditable :=
//         //     (Rec."Lead Status" = Rec."Lead Status"::New) or
//         //     (Rec."Lead Status" = Rec."Lead Status"::Contacted) or
//         //     (Rec."Lead Status" = Rec."Lead Status"::Qualified);
//         if Rec."Lead Status" = Rec."Lead Status"::New then
//             IsFollowUpEditable := true;
//         if Rec."Lead Status" = Rec."Lead Status"::Contacted then
//             IsFollowUpEditable := true;
//         if Rec."Lead Status" = Rec."Lead Status"::Qualified then
//             IsFollowUpEditable := true;
//         if Rec."Lead Status" = Rec."Lead Status"::Disqualified then
//             IsFollowUpEditable := false;
//     end;

//     trigger OnOpenPage()
//     begin
//         EditableAction := true;
//         FieldEditable := true;
//         IsFollowUpEditable := true;
//     end;

//     var
//         IsQualified: Boolean;
//         FieldEditable: Boolean;
//         EditableAction: Boolean;

//     procedure ValidateLeadStatus()
//     var
//         ConfirmMgt: Codeunit "Confirm Management";
//     begin
//         case xRec."Lead Status" of
//             "Lead Status"::New:
//                 if Rec."Lead Status" = "Lead Status"::Qualified then
//                     Error('Lead must be Contacted before it can be marked as Qualified.');
//             "Lead Status"::Contacted:
//                 if Rec."Lead Status" = "Lead Status"::New then
//                     Error('Cannot move back to New from Contacted.');
//             "Lead Status"::Qualified:
//                 if Rec."Lead Status" <> "Lead Status"::Qualified then
//                     Error('Cannot change status after Qualified.');
//             "Lead Status"::Disqualified:
//                 if Rec."Lead Status" <> "Lead Status"::Disqualified then
//                     Error('Cannot change status after Disqualified.');
//         end;
//         if Rec."Lead Status" = "Lead Status"::Qualified then
//             if Rec."Assigned Sales Person" = '' then
//                 Error('Assigned Sales Person must be populated before marking as Qualified.');
//         if Rec."Lead Status" = "Lead Status"::Disqualified then
//             if not ConfirmMgt.GetResponseOrDefault('Are you sure you want to Disqualify this lead?', false) then
//                 Rec."Lead Status" := xRec."Lead Status";
//     end;
// }