codeunit 50130 "Process Management"
{
    trigger OnRun()
    begin

    end;

    procedure ImportData()
    var
        Client: HttpClient;
        Response: HttpResponseMessage;
        ResponseString: Text;
        JsonTokenData: JsonToken;
        JsonTokenData1: JsonToken;
        JsonObj: JsonObject;
        url: Text;
        JsonArr: JsonArray;
        jsToken: JsonToken;
        jsToken1: JsonToken;
        CoronaCases: Record "Corona Cases";

    begin
        url := 'https://api.covid19api.com/summary';
        Client.Get(url, Response);
        if not Response.IsSuccessStatusCode() then
            Error('Web service returned error:\\' +
              'Status code: %1\' +
              'Description: %2',
              Response.HttpStatusCode(),
              Response.ReasonPhrase());
        Response.Content.ReadAs(ResponseString);
        JsonTokenData.ReadFrom(ResponseString);
        JsonObj := JsonTokenData.AsObject();
        JsonObj.SelectToken('Countries', JsonTokenData1);
        JsonArr := JsonTokenData1.AsArray();

        CoronaCases.DeleteAll();
        CoronaCases.Init();
        foreach jsToken in JsonArr do begin
            clear(jsToken1);
            if jsToken.SelectToken('Country', jsToken1) then begin
                if jsToken1.IsValue then
                    CoronaCases.Country := copystr((jsToken1.AsValue().AsText()), 1, 30);
            end;
            clear(jsToken1);
            if jsToken.SelectToken('TotalConfirmed', jsToken1) then begin
                if jsToken1.IsValue then
                    CoronaCases."Total Confirmed" := jsToken1.AsValue().AsInteger();
            end;
            clear(jsToken1);
            if jsToken.SelectToken('TotalDeaths', jsToken1) then begin
                if jsToken1.IsValue then
                    CoronaCases."Total Deaths" := jsToken1.AsValue().AsInteger();
            end;
            clear(jsToken1);
            if jsToken.SelectToken('TotalRecovered', jsToken1) then begin
                if jsToken1.IsValue then
                    CoronaCases."Total Recovered" := jsToken1.AsValue().AsInteger();
            end;
            CoronaCases.Insert();
        end;
    end;
}