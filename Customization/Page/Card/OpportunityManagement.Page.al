page 51264 "Opportunity Management"
{
    PageType = Card;
    SourceTable = "Opportunity Management";
    UsageCategory = None;
    Caption = 'Opportunity Management';
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(Group1)
            {
                Caption = 'Opportunity Details';
                field("Opportunity ID"; Rec."Opportunity ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unique identifier for the opportunity.';
                }
                field("Lead ID"; Rec."Lead ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unique identifier for the lead associated with this opportunity.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unique identifier for the project associated with this opportunity.';
                }
                field("Unit ID"; Rec."Unit ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unique identifier for the unit associated with this opportunity.';
                }
                field("Opportunity Name"; Rec."Opportunity Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the opportunity.';
                }
                field("Estimated Close Date"; Rec."Estimated Close Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the estimated date when the opportunity is expected to close.';
                }
                field("Opportunity Value"; Rec."Opportunity Value")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the estimated value of the opportunity.';
                }
                field("Pipeline Stage"; Rec."Pipeline Stage")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the current stage of the opportunity in the sales pipeline.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the current status of the opportunity.';
                }
                field("Probability %"; Rec."Probability %")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the probability percentage of closing the opportunity successfully.';
                }
                field(Notes; Rec.Notes)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies any additional notes or comments related to the opportunity.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the user who created the opportunity.';
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the opportunity was created.';
                }
            }
        }
    }
    actions
    {
        area(Navigation)
        {
            action(ViewRelatedLead)
            {
                ApplicationArea = All;
                Caption = 'View Related Lead';
                Image = ContactPerson;
                ToolTip = 'View the lead that was converted to this opportunity.';

                trigger OnAction()
                var
                    LeadRecord: Record "Lead Management";
                    LeadCard: Page "Lead Card";
                begin
                    if Rec."Lead ID" <> '' then begin
                        if LeadRecord.Get(Rec."Lead ID") then begin
                            LeadCard.SetRecord(LeadRecord);
                            LeadCard.Run();
                        end;
                    end else
                        Message('No related lead found for this opportunity.');
                end;
            }
        }
    }
}