page 50101 "Web Order Line"
{
    PageType = Listpart;
    Caption = 'Web Order Line';
    ApplicationArea = All;

    UsageCategory = Lists;
    SourceTable = "Web Order Line";

    DelayedInsert = true;
    AutoSplitKey = true;
    PopulateAllFields = true;
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Document Id"; Rec."Document Id")
                {
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        WebOrderHeader: Record "Web Order Header";
        WebOrderLine: Record "Web Order Line";
    begin
        if WebOrderHeader.GetBySystemId(Rec."Document Id") then begin
            Rec."Document No." := WebOrderHeader."No.";
            WebOrderLine.Reset();
            WebOrderLine.SetCurrentKey("Document Id");
            WebOrderLine.SetRange("Document Id", Rec."Document Id");
            if WebOrderLine.FindLast() then
                Rec."Line No." := WebOrderLine."Line No." + 10000
            else
                Rec."Line No." := 10000;
        end;
    end;
}