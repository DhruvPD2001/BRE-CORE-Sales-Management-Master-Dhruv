pageextension 51257 "Task" extends "Task List"
{
    layout
    {
        modify(Type)
        {
            Visible = false;
        }
        addafter(Date)
        {
            field("Custome Type"; Rec."Custome Type")
            {
                ApplicationArea = All;
                Caption = 'Task Type';
                ToolTip = 'Select the type of task to automatically set duration and make time fields editable.';
            }
        }
    }
}