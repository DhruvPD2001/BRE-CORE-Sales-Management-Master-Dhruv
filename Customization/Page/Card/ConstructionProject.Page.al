page 53501 "Construction Project"
{
    PageType = Card;
    SourceTable = "Construction Project";
    ApplicationArea = All;
    Caption = 'Construction Project Card';
    RefreshOnActivate = true;
    UsageCategory = Administration;
    layout
    {
        area(Content)
        {
            group("Project Details")
            {
                Caption = 'Project Details';
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    Editable = false;
                    ToolTip = 'The unique identifier for the construction project, used for tracking and reference.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = 'The name of the construction project, used for identification and reference.';
                }
                field("Project Type"; Rec."Project Type")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = 'The type of construction project, such as residential, commercial, or industrial.';
                }
                field("Project Status"; Rec."Project Status")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = 'The current status of the construction project, indicating its progress and state.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = All;
                    Editable = approvaleditable;
                    ToolTip = 'The current approval status of the construction project, indicating whether it is pending, approved, or rejected.';
                    trigger OnValidate()
                    var
                        dialogboxConstProjectRejection: Codeunit DialogboxConstProjectRejection;
                    begin
                        if Rec."Approval Status" = Rec."Approval Status"::Rejected then
                            dialogboxConstProjectRejection.DialogboxForRejection(Rec);
                    end;
                }
                field("Reason for Rejection"; Rec."Reason for Rejection")
                {
                    Editable = approvaleditable;
                    ApplicationArea = All;
                    ToolTip = 'The reason for project rejection, if applicable. This field is editable only when the project status is set to Rejected.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    ToolTip = 'The user who created the construction project record.';
                }
            }

            group("Project Scope")
            {
                Caption = 'Project Scope';
                group(ProjectScope)
                {
                    ShowCaption = false;
                    group(Description_)
                    {
                        ShowCaption = false;
                        field("Description"; Rec."Description")
                        {
                            ApplicationArea = All;
                            MultiLine = true;
                            ToolTip = 'A detailed description of the construction project, outlining its scope, objectives, and key features.';
                        }
                    }
                    group(Objective)
                    {
                        ShowCaption = false;
                        field("Objectives"; Rec."Objectives")
                        {
                            ApplicationArea = All;
                            MultiLine = true;
                            ToolTip = 'The specific objectives of the construction project, detailing what the project aims to achieve.';
                        }
                    }
                    group(AdditionalNotes)
                    {
                        showCaption = false;
                        field("Additional Notes"; Rec."Additional Notes")
                        {
                            ApplicationArea = All;
                            MultiLine = true;
                            ToolTip = 'Any additional notes or comments related to the construction project, providing further context or information.';
                        }
                    }
                }
            }

            group("Project Location")
            {
                Caption = 'Project Location';
                field("Address Line 1"; Rec."Address Line 1")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = 'The primary address line for the construction project location.';
                }
                field("Address Line 2"; Rec."Address Line 2")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = 'An optional secondary address line for additional location details.';
                }
                field("Postal Code"; Rec."Postal Code")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = 'The postal code for the project location, used for mail delivery and location identification.';
                }
                field("Latitude"; Rec."Latitude")
                {
                    ApplicationArea = All;
                    ToolTip = 'The geographical latitude of the project location, used for mapping and navigation.';
                }
                field("Longitude"; Rec."Longitude")
                {
                    ApplicationArea = All;
                    ToolTip = 'The geographical longitude of the project location, used for mapping and navigation.';
                }
                field("Location Link"; Rec."Location Link")
                {
                    ApplicationArea = All;
                    ToolTip = 'A link to an online map or location service for the project site, providing easy access to geographical information.';
                }
            }

            group("Timeline")
            {
                Caption = 'Timeline';
                field("Planned Start Date"; Rec."Planned Start Date")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = 'The planned start date of the construction project.';
                }
                field("Planned End Date"; Rec."Planned End Date")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = 'The planned end date of the construction project.';
                }
                field("Actual Start Date"; Rec."Actual Start Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'The actual start date of the construction project.';
                }
                field("Final Completion Date"; Rec."Final Completion Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'The final completion date of the construction project, marking the end of all activities.';
                }
            }
            part("Project Milestone List Part"; "Project Milestone List Part")
            {
                ApplicationArea = All;
                Caption = 'Project Milestones';
                Visible = true;
                SubPageLink = "Project ID" = field("Project ID");
                UpdatePropagation = Both;
            }

            part("Project Milestone Tasks"; "Project Milestone Task LP")
            {
                ApplicationArea = All;
                Caption = 'Milestone Tasks';
                Visible = true;
                Provider = "Project Milestone List Part";
                SubPageLink = "Milestone ID" = field("Milestone ID");
                UpdatePropagation = Both;
            }

            part("Project Milestone Sub Tasks"; "Project Milestone Sub Task LP")
            {
                ApplicationArea = All;
                Caption = 'Milestone Sub Tasks';
                Visible = true;
                Provider = "Project Milestone Tasks";
                SubPageLink = "Task ID" = field("Task ID");
                UpdatePropagation = Both;
            }

            group("Performance Metrics")
            {
                Caption = 'Performance Metrics';
                field("Progress Percentages"; Rec."Progress Percentages")
                {
                    ApplicationArea = All;
                    ToolTip = 'The percentage of project completion based on the planned timeline and budget.';
                    Editable = false;

                }
            }

            group("Financial Details")
            {
                Caption = 'Financial Details';
                field("Approved Budget"; Rec."Approved Budget")
                {
                    ApplicationArea = All;
                    ToolTip = 'The total budget approved for the construction project.';
                }
                field("Estimated Cost Breakdown"; Rec."Estimated Cost Breakdown")
                {
                    ApplicationArea = All;
                    ToolTip = 'A detailed breakdown of the estimated costs for various aspects of the project, such as materials, labor, and overhead.';
                }
                field("Funding Source"; Rec."Funding Source")
                {
                    ApplicationArea = All;
                    ToolTip = 'The source of funding for the project, such as internal funds, loans, or grants.';
                }
                field("Current Spends Tracking"; Rec."Current Spends Tracking")
                {
                    ApplicationArea = All;
                    ToolTip = 'A record of the current expenditures against the project budget, helping to track financial performance.';
                }
            }

            group("Responsible Parties")
            {
                Caption = 'Responsible Parties';
                field("Project Owner"; Rec."Project Owner")
                {
                    ApplicationArea = All;
                    ToolTip = 'The individual or entity responsible for the overall management and success of the project.';
                }
                field("Primary Contractor"; Rec."Primary Contractor")
                {
                    ApplicationArea = All;
                    ToolTip = 'The main contractor responsible for executing the construction work.';
                }
                field("Project Manager"; Rec."Project Manager")
                {
                    ApplicationArea = All;
                    ToolTip = 'The person responsible for planning, executing, and closing the project.';
                }
            }
            part("Construction Project Document List Part"; "Construction Project Documents")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Project Documents';
                Visible = true;
                SubPageLink = "Project ID" = field("Project ID");
            }
            group("Construction Specifications")
            {
                Caption = 'Construction Specifications';
                field("Building Type or Classification"; Rec."Building Type/Classification")
                {
                    ApplicationArea = All;
                    TableRelation = "Primary Classification"."Classification Name";
                    ToolTip = 'The primary classification of the building, such as residential, commercial, or industrial.';
                }
                field("UOM"; Rec."UOM")
                {
                    ApplicationArea = All;
                    TableRelation = "Unit of Measure".Description;
                    ToolTip = 'The unit of measure for the project, such as square meters or cubic feet.';
                }
                field("Number of Floors"; Rec."Number of Floors")
                {
                    ApplicationArea = All;
                    ToolTip = 'The total number of floors in the building.';
                }
                field("Construction Materials"; Rec."Construction Materials")
                {
                    ApplicationArea = All;
                    ToolTip = 'The primary materials used in the construction of the project, such as concrete, steel, or wood.';
                }
            }

            group("Stakeholders")
            {
                Caption = 'Stakeholders';
                field("Architect/Design Firm"; Rec."Architect/Design Firm")
                {
                    ApplicationArea = All;
                    ToolTip = 'The firm responsible for the architectural design of the project.';
                }
                field("Subcontractors List"; Rec."Subcontractors List")
                {
                    ApplicationArea = All;
                    ToolTip = 'A list of subcontractors involved in the project, detailing their roles and responsibilities.';
                }
                field("Key Consultants"; Rec."Key Consultants")
                {
                    ApplicationArea = All;
                    ToolTip = 'Consultants providing specialized expertise for the project, such as structural, mechanical, or electrical engineering.';
                }
            }

            group("Extended Timeline")
            {
                Caption = 'Extended Timeline';
                field("Design Completion Date"; Rec."Design Completion Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'The date when the design phase is completed.';
                }
                field("Permit Approval Date"; Rec."Permit Approval Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'The date when the necessary permits for construction are approved.';
                }
                field("Substantial Completion Date"; Rec."Substantial Completion Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'The date when the project is substantially complete, meaning it can be occupied or used for its intended purpose.';
                }
                field("Extended Final Completion Date"; Rec."Extended Final Completion Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'The date when the project is fully completed, including all punch list items and final inspections.';
                }
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
                ToolTip = 'Submit the construction project for approval by the project manager.';
                trigger OnAction()
                var
                    ConstructionProjectApproval: Codeunit ConstructionProjectApproval;
                begin
                    ConstructionProjectApproval.ConstructionProApproval(Rec);
                    Rec."Approval Status" := Rec."Approval Status"::Pending;
                    Rec.Modify(true);
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
        Rec.TestField("Project Name");
        Rec.TestField("Planned Start Date");
        Rec.TestField("Planned End Date");
        Rec.TestField("Project Status");

        Rec.TestField("Address Line 1");
        Rec.TestField("Address Line 2");
        Rec.TestField("Postal Code");
    end;

    trigger OnAfterGetRecord()
    begin
        approvaleditable := UserApprovalProjectStatus();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        Rec.RecalculateProgress();
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
}