page 53121 "Client Info List"
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = "Client Info";
    CardPageId = "Client Info Card";
    UsageCategory = Lists;
    ModifyAllowed = false;
    InsertAllowed = false;
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Client Info ID"; Rec."Client Info ID")
                {
                    ToolTip = 'Unique identifier for the Client Info.';
                }
                field("Client Name"; Rec."Client Name")
                {
                    ToolTip = 'Name of the Client Info.';
                }
                field("Email"; Rec."Email")
                {
                    ToolTip = 'Email of the Client Info.';
                }
                field("Mobile No."; Rec."Mobile No.")
                {
                    ToolTip = 'Mobile number of the Client Info.';
                }
                field("Created Date"; Rec."Created Date")
                {
                    ToolTip = 'Date when the Client Info was created.';
                }
            }
        }
    }
}