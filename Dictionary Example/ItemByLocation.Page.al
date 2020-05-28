page 50000 "Item By Location"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Integer;
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(ItemNo; ItemList.Get(Number))
                {
                    ApplicationArea = All;
                }
                field(inv1; ItemInventoryList.Get(1))
                {
                    ApplicationArea = All;
                    CaptionClass = LocationList.Get(1);
                    BlankZero = true;
                    trigger OnDrillDown()
                    begin
                        InventoryDrillDown(LocationList.Get(1));
                    end;
                }
                field(inv2; ItemInventoryList.Get(2))
                {
                    ApplicationArea = All;
                    CaptionClass = LocationList.Get(2);
                    BlankZero = true;
                    trigger OnDrillDown()
                    begin
                        InventoryDrillDown(LocationList.Get(2));
                    end;
                }
                field(inv3; ItemInventoryList.Get(3))
                {
                    ApplicationArea = All;
                    CaptionClass = LocationList.Get(3);
                    BlankZero = true;
                    trigger OnDrillDown()
                    begin
                        InventoryDrillDown(LocationList.Get(3));
                    end;
                }
                field(inv4; ItemInventoryList.Get(4))
                {
                    ApplicationArea = All;
                    CaptionClass = LocationList.Get(4);
                    BlankZero = true;
                    trigger OnDrillDown()
                    begin
                        InventoryDrillDown(LocationList.Get(4));
                    end;
                }
            }
        }
    }
    trigger OnOpenPage()
    var
        i: Integer;
        Location: Record Location;
    begin

        LocationList.Insert(1, 'Not Specified');
        i := 1;
        Location.reset;
        Location.SetRange("Use As In-Transit", false);
        if Location.FindSet() then
            repeat
                i += 1;
                LocationList.Insert(i, Location.Code);
            until Location.Next() = 0;

        itemRec.Reset();
        if itemRec.FindSet() then
            Rec.SetRange(Number, 1, itemRec.Count);

    end;

    trigger OnAfterGetRecord()
    var
        i: Integer;
        ItemLedgerEntry: Record "Item Ledger Entry";
        Location: Record Location;
        itemExists: Boolean;
    begin
        itemRec.Reset();
        if itemRec.FindSet() then
            repeat
                Clear(InventoryList);
                for i := 1 to LocationList.Count do
                    InventoryList.Insert(i, 0);
                ItemLedgerEntry.Reset();
                ItemLedgerEntry.SetCurrentKey("Item No.", Positive, "Location Code", "Variant Code");
                ItemLedgerEntry.SetRange("Item No.", itemRec."No.");
                ItemLedgerEntry.SetRange(Open, true);
                if ItemLedgerEntry.FindSet() then
                    repeat
                        if ItemLedgerEntry."Location Code" = '' then
                            InventoryList.Set(LocationList.IndexOf('Not Specified'), InventoryList.Get(LocationList.IndexOf('Not Specified')) + ItemLedgerEntry."Remaining Quantity")
                        else
                            if LocationList.Contains(ItemLedgerEntry."Location Code") then
                                InventoryList.Set(LocationList.IndexOf(ItemLedgerEntry."Location Code"), InventoryList.Get(LocationList.IndexOf(ItemLedgerEntry."Location Code")) + ItemLedgerEntry."Remaining Quantity");
                    until ItemLedgerEntry.Next() = 0;
                itemExists := ItemLocationDictionary.ContainsKey(itemRec."No.");
                if not itemExists then
                    ItemLocationDictionary.Add(itemRec."No.", InventoryList)
                else
                    ItemLocationDictionary.Set(itemRec."No.", InventoryList);
                ItemList := ItemLocationDictionary.Keys;
            until itemRec.Next() = 0;
        ItemInventoryList := ItemLocationDictionary.Get(ItemList.Get(Number));
    end;

    local procedure InventoryDrillDown(LocationCode: Code[20])
    begin
        ItemLedEntry.SetCurrentKey(
          "Item No.", "Entry Type", "Variant Code", "Drop Shipment", "Location Code", "Posting Date");
        ItemLedEntry.SetRange("Item No.", ItemList.Get(Number));
        if LocationCode = 'NOT SPECIFIED' then
            clear(LocationCode);
        ItemLedEntry.SetRange("Location Code", LocationCode);
        PAGE.Run(0, ItemLedEntry);
    end;

    var
        itemRec: Record item;
        LocationList: List of [Code[20]];
        InventoryList: List of [Decimal];
        ItemInventoryList: List of [Decimal];
        ItemList: List of [Code[20]];
        ItemLocationDictionary: Dictionary of [Code[20], List of [Decimal]];
        ItemLedEntry: Record "Item Ledger Entry";

}