page 50101 "Web Order Line"
{
    PageType = Listpart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Web Order Line";
    Caption = 'Web Order Line';
    DelayedInsert = true;
    AutoSplitKey = true;
    ODataKeyFields = "Document Id";
    PopulateAllFields = true;
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field("Line No."; "Line No.")
                {
                    ApplicationArea = All;
                }
                field(Type; Type)
                {
                    ApplicationArea = All;
                }
                field("No."; "No.")
                {
                    ApplicationArea = All;
                }
                field(Quantity; Quantity)
                {
                    ApplicationArea = All;
                }
                field("Unit Price"; "Unit Price")
                {
                    ApplicationArea = All;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = All;
                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                }
                field("Document Id"; "Document Id")
                {
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        WebOrderHeader: Record "Web Order Buffer";
        WebOrderLine: Record "Web Order Line";
    begin
        WebOrderHeader.Reset();
        WebOrderHeader.SetCurrentKey(Id);
        WebOrderHeader.SetRange(Id, "Document Id");
        if WebOrderHeader.FindFirst() then begin
            "Document No." := WebOrderHeader."No.";
            WebOrderLine.Reset();
            WebOrderLine.SetCurrentKey("Document Id");
            WebOrderLine.SetRange("Document Id", "Document Id");
            if WebOrderLine.FindLast() then
                "Line No." := WebOrderLine."Line No." + 10000
            else
                "Line No." := 10000;
        end;
    end;
}