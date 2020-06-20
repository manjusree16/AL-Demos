pageextension 50101 "Tracking Number Sales Order" extends "Sales Invoice"
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
}