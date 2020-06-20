enum 50101 "Tracking Number Provider" implements "Tracking Number"
{
    Extensible = true;
    DefaultImplementation = "Tracking Number" = "Default Tracking Number";
    value(0; Default)
    {
        Caption = 'Default';
    }
    value(50002; DHL)
    {
        Caption = 'DHL';
        Implementation = "Tracking Number" = "DHL Tracking Number";
    }
    value(50003; PostNord)
    {
        Caption = 'PostNord';
        Implementation = "Tracking Number" = "PostNord Tracking Number";
    }
}