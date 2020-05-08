table 50130 "Corona Cases"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Country; Code[30])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Total Confirmed"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Total Deaths"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Total Recovered"; Integer)
        {
            DataClassification = ToBeClassified;
        }

        field(5; "As per Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; Country)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}