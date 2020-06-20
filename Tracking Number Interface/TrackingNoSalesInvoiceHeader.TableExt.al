tableextension 50102 "Tracking No Sales Inv Header" extends "Sales Invoice Header"
{
    fields
    {
        field(50000; "Tracking Service Provider"; Enum "Tracking Number Provider")
        {
            DataClassification = CustomerContent;
            Caption = 'Tracking Service Provider';
        }

        field(50001; "Tracking Number Value"; Text[1024])
        {
            DataClassification = CustomerContent;
            Caption = 'Tracking Number Value';
        }
    }
}