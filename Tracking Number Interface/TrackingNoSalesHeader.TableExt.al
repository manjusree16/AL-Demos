tableextension 50101 "Tracking No Sales Header" extends "Sales Header"
{
    fields
    {
        field(50000; "Tracking Service Provider"; Enum "Tracking Number Provider")
        {
            DataClassification = CustomerContent;
            Caption = 'Tracking Service Provider';
            trigger OnValidate()
            var
                TrackingNumber: Interface "Tracking Number";
            begin
                TrackingNumber := "Tracking Service Provider";
                "Tracking Number Value" := TrackingNumber.GenerateTrackingNumber();
            end;
        }

        field(50001; "Tracking Number Value"; Text[1024])
        {
            DataClassification = CustomerContent;
            Caption = 'Tracking Number Value';
        }
    }
}