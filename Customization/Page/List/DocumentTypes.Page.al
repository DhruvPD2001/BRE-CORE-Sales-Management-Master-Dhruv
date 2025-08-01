page 53756 "Document Types"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Document Type";
    Caption = 'Document Types';

    layout
    {
        area(Content)
        {
            repeater(DocumentTypes)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name or code of the document type.';
                }
                field("Description"; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Provides a description of the document type for better identification.';
                }
            }
        }
    }
}
