codeunit 50103 "PostNord Tracking Number" implements "Tracking Number"
{
    trigger OnRun()
    begin

    end;

    var
        DisplayNameLabel: Label 'Sent by PostNord - Tracking Number %1';

    procedure GenerateTrackingNumber(): Text;
    begin
        exit('PostNord-JJD009999');
    end;

    procedure GetTrackingURL(TrackingNumber: Text; var TrackingURL: Text): Boolean;
    begin
        TrackingURL := StrSubstNo('https://www.postnord.dk/track-trace#dynamicloading=true&shipmentid=', TrackingNumber);
        exit(true);
    end;

    procedure GetTrackingURLDisplayName(TrackingNumber: Text): Text;
    begin
        exit(StrSubstNo(DisplayNameLabel, TrackingNumber));
    end;

}