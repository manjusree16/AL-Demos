tableextension 50150 ItemExt extends Item
{
    fields
    {
        field(50100; "Classification Type"; Enum "Item Class. Type")
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                ItemClassification: Interface "Item Classification Type";
            begin
                ItemClassification := "Classification Type";//interface is initialized with enum 
                ItemClassification.InsertRemarks("No.");
            end;
        }
    }

    var
        myInt: Integer;
}