report 53751 "Vendor Contract"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = "VendorContract.docx";

    dataset
    {
        dataitem("Vendor Contract"; "Vendor Contract")
        {
            DataItemTableView = sorting("Contract ID");
            RequestFilterFields = "Contract ID";
            column(Day; Day) { }
            column(Month; Month) { }
            column(Year; Year) { }
            column(Contract_ID; "Contract ID") { }
            column(Contract_Date; "Contract Date") { }
            column(Contract_Start_Date; "Contract Start Date") { }
            column(Contract_End_Date; "Contract End Date") { }
            column(Vendor_ID; "Vendor ID") { }
            column(Vendor_Name; "Vendor Name") { }
            column(Work_Scope; "Work Scope") { }
            column(VendorCountry; VendorCountry) { }
            column(VendorAddess; VendorAddess) { }
            column(CompanyName; CompanyName) { }
            column(CompanyAddress; CompanyAddress) { }
            column(ProjectName; ProjectName) { }
            column(ProjectLocation; ProjectLocation) { }
            column(Incoterms; Incoterms) { }
            column(Contract_Amount; "Total Contract Value (AED)") { }
            column(Payment_Terms; "Payment Terms") { }
            column(Payment_Method; "Payment Method") { }
            column(UAE_Compliance_Requirements; "UAE Compliance Requirements") { }
            column(Dispute_Resolution; "Dispute Resolution") { }
            column(Industry_Standards; "Industry Standards") { }
            column(PenaltyClauses; PenaltyClauses) { }
            column(Description; Description) { }
            column(Delivery_Location; "Delivery Location") { }
            column(Delivery_Date; "Delivery Date") { }
            column(Advance_Payment; "Advance Payment (%)") { }
            column(Interim_Payment; "Interim Payment (%)") { }
            column(Final_Payment; "Final Payment (%)") { }
            column(Warranty_Period__Months_; "Warranty Period (Months)") { }

            dataitem("Pricing Breakdown"; "Pricing Breakdown")
            {
                DataItemLink = "Vendor Contract ID" = field("Contract ID");
                DataItemLinkReference = "Vendor Contract";
                DataItemTableView = sorting("Entry No.");

                column(Vendor_Contract_ID; "Vendor Contract ID") { }
                column(Item_Description; "Item Description") { }
                column(Quantity; Quantity) { }
                column(Unit; Unit) { }
                column(Price_Per_Unit; "Price Per Unit") { }
                column(Total_Cost; "Total Cost") { }
            }


            trigger OnAfterGetRecord()
            var
                fetchMonth: Codeunit "Fetch Month";
            begin
                if CompanyInfo.Get() then begin
                    CompanyName := CompanyInfo.Name;
                    CompanyAddress := CompanyInfo.Address;
                end;

                if VendorProfile.Get("Vendor ID") then begin
                    VendorCountry := VendorProfile."Country";
                    VendorAddess := VendorProfile.Address + ', ' + VendorProfile."Address 2" + ', ' + VendorProfile."Address 3";
                end;

                if Project.Get("Project ID") then begin
                    ProjectName := Project."Project Name";
                    ProjectLocation := Project."Address Line 1" + ', ' + Project."Address Line 2" + ', ' + Project."Postal Code" + ',';
                end;

                Day := AddSuffix(Format(Date2DMY("Contract Date", 1)));
                Month := fetchMonth.GetMonthName(Date2DMY("Contract Date", 2));
                Year := Format(Date2DMY("Contract Date", 3));
            end;
        }
    }

    rendering
    {
        layout("VendorContract.docx")
        {
            Type = Word;
            LayoutFile = './ReportTemplate/VendorContract.docx';
        }
    }

    var
        CompanyInfo: Record "Company Information";
        VendorProfile: Record "Facility Vendor Profiles";
        Project: Record "Construction Project";
        Day, Month, Year : Text;
        CompanyName: Text;
        CompanyAddress: Text;
        VendorCountry: Text;
        VendorAddess: Text;
        ProjectName: Text;
        ProjectLocation: Text;
        PenaltyClauses: Text[250];

    procedure AddSuffix(pDay: Text): Text
    var
        onesDigit: Text;
    begin
        if StrLen(pDay) > 1 then
            onesDigit := CopyStr(pDay, StrLen(pDay) - 1, StrLen(pDay))
        else
            onesDigit := CopyStr(pDay, StrLen(pDay), StrLen(pDay));


        case onesDigit of
            '1':
                exit(pDay + 'st');
            '2':
                exit(pDay + 'nd');
            '3':
                exit(pDay + 'rd');
            else
                exit(pDay + 'th');
        end;
    end;
}