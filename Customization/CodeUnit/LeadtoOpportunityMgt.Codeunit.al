codeunit 51252 "Lead to Opportunity Mgt"
{
    procedure ConvertLeadToOpportunity(LeadRecord: Record "Lead Management"): Code[20]
    var
        OpportunityRecord: Record "Opportunity Management";
        NoSeriesSetup: Record "No. Series Setup";
        NoSeriesMgt: Codeunit "No. Series";
        OpportunityNo: Code[20];
    begin
        // Validate lead before conversion
        ValidateLeadForConversion(LeadRecord);

        // Get No. Series Setup and ensure Opportunity No. Series is configured
        if not NoSeriesSetup.Get() then
            Error('No. Series Setup is not configured.');

        if NoSeriesSetup."Opportunity ID Nos." = '' then
            Error('Opportunity ID No. Series is not configured in No. Series Setup.');

        // Create new opportunity record
        OpportunityRecord.Init();

        // Auto-generate Opportunity ID using No. Series
        OpportunityNo := NoSeriesMgt.GetNextNo(NoSeriesSetup."Opportunity ID Nos.");
        OpportunityRecord."Opportunity ID" := OpportunityNo;

        // Map data from Lead to Opportunity BEFORE inserting
        OpportunityRecord."Lead ID" := LeadRecord."Lead ID";
        OpportunityRecord."Opportunity Name" := LeadRecord."Lead Name";
        OpportunityRecord."Created By" := CopyStr(UserId(), 1, StrLen(UserId()));
        OpportunityRecord."Created Date" := Today;
        OpportunityRecord."Pipeline Stage" := OpportunityRecord."Pipeline Stage"::Inquiry;
        OpportunityRecord.Status := OpportunityRecord.Status::Open;

        // Map Interest Area to Notes if exists
        if LeadRecord."Interst Area" <> '' then
            OpportunityRecord.Notes := 'Lead Interest: ' + LeadRecord."Interst Area";

        // Map Expected Budget to Opportunity Value if exists
        if LeadRecord."Expected Budget" > 0 then
            OpportunityRecord."Opportunity Value" := LeadRecord."Expected Budget";

        // Insert the record with all data populated
        OpportunityRecord.Insert(true);

        // Optionally update lead status to Converted
        UpdateLeadStatusAfterConversion(LeadRecord."Lead ID");

        exit(OpportunityNo);
    end;

    local procedure ValidateLeadForConversion(LeadRecord: Record "Lead Management")
    begin
        // Check if lead status is Qualified
        if LeadRecord."Lead Status" <> LeadRecord."Lead Status"::Qualified then
            Error('Only Qualified leads can be converted to opportunities.');

        // Check if an opportunity already exists for this lead
        if OpportunityAlreadyExists(LeadRecord."Lead ID") then
            Error('An Opportunity already exists for this lead.');
    end;

    local procedure OpportunityAlreadyExists(LeadID: Code[20]): Boolean
    var
        OpportunityRecord: Record "Opportunity Management";
    begin
        OpportunityRecord.SetRange("Lead ID", LeadID);
        exit(not OpportunityRecord.IsEmpty);
    end;

    local procedure UpdateLeadStatusAfterConversion(LeadID: Code[20])
    var
        LeadRecord: Record "Lead Management";
    begin
        if LeadRecord.Get(LeadID) then begin
            LeadRecord."Lead Status" := LeadRecord."Lead Status"::Contacted;
            LeadRecord.Modify(true);
        end;
    end;
}