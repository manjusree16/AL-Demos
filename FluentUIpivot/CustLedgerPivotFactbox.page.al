page 50126 "Pivot Factbox"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Cust. Ledger Entry";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                ShowCaption = false;
                usercontrol(Pivot; PivotFluentUI)
                {
                    ApplicationArea = all;
                    trigger Ready()
                    begin
                        SendData();
                    end;
                }
            }
        }
    }
    local procedure SendData();
    var
        CustDataArray: JsonArray;
        DocType: enum "Gen. Journal Document Type";
    begin
        CustDataArray.add(CreateJsonObject(DocType::Invoice, 0));
        CustDataArray.add(CreateJsonObject(DocType::"Credit Memo", 1));
        CustDataArray.add(CreateJsonObject(DocType::Payment, 2));
        CustDataArray.add(CreateJsonObject(DocType::Refund, 3));
        CurrPage.Pivot.SendData(CustDataArray);
    end;

    local procedure CreateJsonObject(EntryTypeEnum: Enum "Gen. Journal Document Type"; KeyID: integer) Json: JsonObject;
    begin
        clear(Json);
        Json.Add('text', FORMAT(EntryTypeEnum));
        Json.Add('key', KeyID);
        Json.Add('data', CreateJsonArray(EntryTypeEnum));
    end;

    local procedure CreateJsonArray(EntryTypeEnum: Enum "Gen. Journal Document Type") JArray: JsonArray
    var
        CustLedger: Record "Cust. Ledger Entry";
    begin
        Clear(JArray);
        CustLedger.Reset();
        CustLedger.SetCurrentKey("Document Type", "Customer No.", "Posting Date", "Currency Code");
        CustLedger.SetRange("Customer No.", Rec."Customer No.");
        CustLedger.SetRange("Document Type", EntryTypeEnum);
        if CustLedger.FindSet() then
            repeat
                JArray.Add(CustLedger."Document No.");
            until CustLedger.Next() = 0;
    end;
}
