interface "Tracking Number"
{
    //Generates new tracking number for shipment
    procedure GenerateTrackingNumber(): Text;
    //gets full url to track shipment
    procedure GetTrackingURL(TrackingNumber: Text; var TrackingURL: Text): Boolean
    //displays name to show end users
    procedure GetTrackingURLDisplayName(TrackingNumber: Text): Text

}