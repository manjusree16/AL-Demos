codeunit 50101 "Default Tracking Number" implements "Tracking Number"
{
    trigger OnRun()
    begin

    end;

    var
        DisplayNameLabel: Label 'Sent by DHL - Tracking Number %1';

    procedure GenerateTrackingNumber(): Text;
    begin
        exit('Generating Tracking Number is not supported');
    end;

    procedure GetTrackingURL(TrackingNumber: Text; var TrackingURL: Text): Boolean;
    begin
        exit(false);
    end;

    procedure GetTrackingURLDisplayName(TrackingNumber: Text): Text;
    begin
        exit('');
    end;

}