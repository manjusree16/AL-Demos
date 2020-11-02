controladdin PivotFluentUI
{
    RequestedHeight = 700;
    HorizontalStretch = true;
    HorizontalShrink = true;
    StartupScript = 'pivot\PivotControlAddIn\js\Pivot.js';
    event Ready()
    procedure SendData(CustDataArray: JsonArray)
}