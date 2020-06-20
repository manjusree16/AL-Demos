pageextension 50102 "Tracking No Posted Sales Inv" extends "Posted Sales Invoice"
{
    layout
    {

        addlast(General)
        {
            field("Tracking Service Provider"; "Tracking Service Provider")
            {
                ApplicationArea = All;
            }
            field("Tracking Number Value"; "Tracking Number Value")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addlast("&Invoice")
        {
            action("Print Invoice")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Print Invoice';
                Image = Print;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                begin
                    salesInvHeader := Rec;
                    CurrPage.SETSELECTIONFILTER(salesInvHeader);
                    Report.Run(50102, true, false, salesInvHeader);
                end;
            }
        }
    }
    var
        salesInvHeader: Record "Sales Invoice Header";
}