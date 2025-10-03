codeunit 53502 DialogboxConstProjectRejection
{
    procedure DialogboxForRejection(var Rec: Record "Construction Project")
    var
        ConstructionProjectRec: Record "Construction Project";
        Rejectionmail: Codeunit ConstructionProjectRejection;
        dialogpage: Page DialogBoxForRejection;
        ReasonForRejection: Text;

    begin
        if ConstructionProjectRec.Get(Rec."Project ID") then
            if dialogpage.RunModal() = Action::OK then begin
                ReasonForRejection := dialogpage.GetReason();
                Rec."Reason for Rejection" := CopyStr(ReasonForRejection, 1, StrLen(ReasonForRejection));
                Rec.Modify();
                Rejectionmail.ConstructionProjectRejection(Rec);
            end else
                Message('Please Enter Reason');
    end;


    // procedure DialogboxForDisqualifiedLead(var Rec: Record "Lead Management")
    // var
    //     LeadRec: Record "Lead Management";
    //     dialogpage: Page DialogBoxForRejection;
    //     ReasonForDisqualifyLead: Text;
    // begin
    //     if LeadRec.Get(Rec."Lead ID")
    //      then
    //         if dialogpage.RunModal() = Action::OK then begin
    //             ReasonForDisqualifyLead := dialogpage.GetReason();
    //             Rec."Lead Status" := Rec."Lead Status"::Disqualified;
    //             Rec."Disqualification Reason" := CopyStr(ReasonForDisqualifyLead, 1, StrLen(ReasonForDisqualifyLead));
    //             Rec."Disqualification Date" := Today();
    //             Rec.Modify();
    //         end;
    // end;

}