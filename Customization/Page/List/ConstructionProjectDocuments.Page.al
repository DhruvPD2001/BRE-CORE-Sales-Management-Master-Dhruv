page 53757 "Construction Project Documents"
{
    PageType = ListPart;
    ApplicationArea = All;
    SourceTable = "Construction Project Documents";

    layout
    {
        area(Content)
        {
            repeater(Documents)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the type of document, such as contract, drawing, or report.';
                }
                field("Document Name"; Rec."Document Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name or title of the document.';
                }
                field("Upload Document"; Rec."Upload Document")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Allows you to upload a document related to this construction project.';
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
                            Rec."Upload Document" := CopyStr(fileName, 1, StrLen(fileName));
                            Rec."Document URL" := CopyStr(uploadResult, 1, StrLen(uploadResult));
                            Rec.Modify();
                            Message('File uploaded successfully: %1', fileName);
                        end;
                    end;
                }
                field("View & Download"; Rec."View & Download")
                {
                    ApplicationArea = All;
                    ToolTip = 'Opens the uploaded document in a browser for viewing or downloading.';
                    trigger OnDrillDown()
                    begin
                        if Rec."Document URL" = '' then
                            Error('No document is available to view.')
                        else
                            Hyperlink(Rec."Document URL");
                    end;
                }
            }
        }
    }
}
