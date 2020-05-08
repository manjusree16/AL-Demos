page 50131 "Item QR List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Item QR";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Item No."; "Item No.")
                {
                    ApplicationArea = All;

                }
                field("QR Code"; "QR Code")
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Generate QR Code")
            {
                ApplicationArea = All;

                trigger OnAction();
                var
                    QRmgmt: Codeunit "QR Management";
                begin
                    QRmgmt.Run();
                end;
            }
        }
    }
}