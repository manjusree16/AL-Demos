codeunit 50131 "QR Management"
{
    trigger OnRun()
    begin
        ItemQr.DeleteAll();
        if item.FindSet() then
            repeat
                ItemQr.Init();
                ItemQr."Item No." := item."No.";
                if not httpclient.Get('https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=' + item."No.", Response) then
                    Error('The call to the web service failed.');
                Response.Content.ReadAs(ImageInStream);
                ItemQr."QR Code".ImportStream(ImageInStream, 'Image');
                ItemQr.Insert();
            until item.Next() = 0;
    end;

    var
        httpclient: HttpClient;
        Response: HttpResponseMessage;
        ItemQr: Record "Item QR";
        ImageInStream: InStream;
        item: Record Item;
}