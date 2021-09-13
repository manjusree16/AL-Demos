page 50100 PinPad
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                Caption = 'PinPad';
                usercontrol(PinPad; PinPad)
                {
                    ApplicationArea = all;
                    trigger OnInvoke(context: JsonObject)
                    var
                        Response: JsonObject;
                        TextData: Text[50];
                        SensitiveData: page "Sensitive Data";
                    begin
                        context.WriteTo(TextData);
                        TextData := CopyStr(TextData, 9, StrLen(TextData));
                        TextData := CopyStr(TextData, 1, StrLen(TextData) - 2);
                        if TextData <> '1234' then
                            Error('Wrong PIN')
                        else
                            SensitiveData.RunModal();
                    end;
                }
            }
        }
    }
}