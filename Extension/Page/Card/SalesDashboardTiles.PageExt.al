pageextension 51253 "Sales Dashboard Tiles" extends "Sales & Relationship Mgr. Act."
{
    layout
    {
        addbefore(Contacts)
        {
            cuegroup("Tasks")
            {
                Caption = 'All Lead Task''s';
                field("All Task's"; this.GetAllTasksCount())
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'All Task''s';
                    ToolTip = 'Count of all tasks.';

                    trigger OnDrillDown()
                    begin
                        PAGE.RUN(PAGE::"Task List");
                    end;
                }
                field("All Pending Task's"; this.GetPendingTasksCount())
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'All Pending Task''s';
                    ToolTip = 'Count of all pending tasks.';

                    trigger OnDrillDown()
                    begin
                        this.ShowPendingTasks();
                    end;
                }
                field("All Completed Task's"; this.GetCompletedTasksCount())
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'All Completed Task''s';
                    ToolTip = 'Count of all completed tasks.';

                    trigger OnDrillDown()
                    begin
                        this.ShowCompletedTasks();
                    end;
                }
            }
            cuegroup("Today's Lead Tasks")
            {
                Caption = 'Today''s Lead Task''s';
                field("Todays Tasks"; this.GetTodaysTasksCount())
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Todays Task''s';
                    ToolTip = 'Count of Todays tasks.';
                    trigger OnDrillDown()
                    begin
                        this.ShowTodaysTasks();
                    end;
                }
                field("Todays Pending Tasks"; this.GetTodaysPendingTasksCount())
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Today''s Pending Task''s';
                    ToolTip = 'Count of Todays pending tasks.';

                    trigger OnDrillDown()
                    begin
                        this.ShowTodaysPendingTasks();
                    end;
                }
                field("Todays Completed Tasks"; this.GetTodaysCompletedTasksCount())
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Today''s Completed Task''s';
                    ToolTip = 'Count of Todays completed tasks.';

                    trigger OnDrillDown()
                    begin
                        this.ShowTodaysCompletedTasks();
                    end;
                }
            }
        }
    }



    //All Task Count
    procedure GetAllTasksCount(): Integer;
    var
        TaskRec: Record "To-do";
    begin
        exit(TaskRec.Count());
    end;


    //All Pending Task Count
    procedure GetPendingTasksCount(): Integer;
    var
        TaskRec: Record "To-do";
    begin
        TaskRec.SetFilter(Status, '<>%1', TaskRec.Status::Completed);
        exit(TaskRec.Count());
    end;

    procedure ShowPendingTasks();
    var
        TaskRec: Record "To-do";
        TaskListPage: Page "Task List";
    begin
        TaskRec.SetFilter(Status, '<>%1', TaskRec.Status::Completed);
        TaskListPage.SetTableView(TaskRec);
        TaskListPage.Run();
    end;


    //All Completed Task Count
    procedure GetCompletedTasksCount(): Integer;
    var
        TaskRec: Record "To-do";
    begin
        TaskRec.SetRange(Status, TaskRec.Status::Completed);
        TaskRec.SetRange(Closed, true);
        exit(TaskRec.Count());
    end;

    procedure ShowCompletedTasks();
    var
        TaskRec: Record "To-do";
        TaskListPage: Page "Task List";
    begin
        TaskRec.SetRange(Status, TaskRec.Status::Completed);
        TaskRec.SetRange(Closed, true);
        TaskListPage.SetTableView(TaskRec);
        TaskListPage.Run();
    end;


    //Today's Task Count
    procedure GetTodaysTasksCount(): Integer;
    var
        TaskRec: Record "To-do";
    begin
        TaskRec.SetRange(Date, Today()); // Filter for today's date
        exit(TaskRec.Count()); // Return the count of today's tasks
    end;

    procedure ShowTodaysTasks();
    var
        TaskRec: Record "To-do";
        TaskListPage: Page "Task List";
    begin
        TaskRec.SetRange(Date, Today()); // Filter for today's date
        TaskListPage.SetTableView(TaskRec);
        TaskListPage.Run();
    end;


    //Today's Pending Task Count
    procedure GetTodaysPendingTasksCount(): Integer;
    var
        TaskRec: Record "To-do";
    begin
        TaskRec.SetRange(Date, Today());
        TaskRec.SetFilter(Status, '<>%1', TaskRec.Status::Completed);
        exit(TaskRec.Count());
    end;

    procedure ShowTodaysPendingTasks();
    var
        TaskRec: Record "To-do";
        TaskListPage: Page "Task List";
    begin
        TaskRec.SetRange(Date, Today());
        TaskRec.SetFilter(Status, '<>%1', TaskRec.Status::Completed);
        TaskListPage.SetTableView(TaskRec);
        TaskListPage.Run();
    end;


    //Today's Completed Task Count
    procedure GetTodaysCompletedTasksCount(): Integer;
    var
        TaskRec: Record "To-do";
    begin
        TaskRec.SetRange(Date, Today());
        TaskRec.SetRange(Status, TaskRec.Status::Completed);
        TaskRec.SetRange(Closed, true);
        exit(TaskRec.Count());
    end;

    procedure ShowTodaysCompletedTasks();
    var
        TaskRec: Record "To-do";
        TaskListPage: Page "Task List";
    begin
        TaskRec.SetRange(Date, Today());
        TaskRec.SetRange(Status, TaskRec.Status::Completed);
        TaskRec.SetRange(Closed, true);
        TaskListPage.SetTableView(TaskRec);
        TaskListPage.Run();
    end;

}