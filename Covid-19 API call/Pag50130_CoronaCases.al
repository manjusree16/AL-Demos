page 50130 "Corona Cases"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Corona Cases";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Country; Country)
                {
                    ApplicationArea = All;

                }
                field("Total Confirmed"; "Total Confirmed")
                {
                    ApplicationArea = All;

                }

                field("Toatl Deaths"; "Total Deaths")
                {
                    ApplicationArea = All;

                }
                field("Total Recovered"; "Total Recovered")
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Import Data")
            {
                ApplicationArea = All;

                trigger OnAction();
                var
                    ProcMgmt: Codeunit "Process Management";
                begin
                    ProcMgmt.ImportData();
                end;
            }
        }
    }
}