controladdin PinPad
{
    VerticalStretch = true;
    HorizontalStretch = true;
    RequestedHeight = 700;
    RequestedWidth = 700;
    Scripts =
    'app.js', 'jquery-3.5.1.min.js';
    StyleSheets =
        'main.css';
    StartupScript = 'PinPad.js';

    event Ready()

    event OnInvoke(context: JsonObject)
}