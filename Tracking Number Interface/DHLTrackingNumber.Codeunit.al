codeunit 50102 "DHL Tracking Number" implements "Tracking Number"
{
    trigger OnRun()
    begin

    end;

    var
        DisplayNameLabel: Label 'Sent by DHL - Tracking Number %1';

    procedure GenerateTrackingNumber(): Text;
    begin
        exit('DHL-JJD009999');
    end;

    procedure GetTrackingURL(TrackingNumber: Text; var TrackingURL: Text): Boolean;
    begin
        TrackingURL := StrSubstNo('https://www.dhl.com/global-en/home/tracking/tracking-express.html?tracking-id=', TrackingNumber);
        exit(true);
    end;

    procedure GetTrackingURLDisplayName(TrackingNumber: Text): Text;
    begin
        exit(StrSubstNo(DisplayNameLabel, TrackingNumber));
    end;

}