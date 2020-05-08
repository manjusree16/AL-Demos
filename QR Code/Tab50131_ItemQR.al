table 50131 "Item QR"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Item No."; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "QR Code"; Media)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Item No.")
        {
            Clustered = true;
        }
    }
}