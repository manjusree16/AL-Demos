table 50101 "Web Order Line"
{
    Caption = 'Web Order Line';
    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            TableRelation = "Web Order Header"."No.";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; Type; Enum "Sales Line Type")
        {
            Caption = 'Type';

        }
        field(4; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(5; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(6; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(7; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
        }
        field(8; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(8000; "Document Id"; Guid)
        {
            Caption = 'Document Id';
            TableRelation = "Web Order Header".SystemId;
        }
        field(9031; "Account Id"; Guid)
        {
            Caption = 'Account Id';
            TableRelation = "G/L Account".SystemId;

            trigger OnValidate()
            begin
                Validate(Type, Type::"G/L Account");
                UpdateNo;
            end;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.", "Document Id")
        {

        }
    }

    var
        WebOrderHeader: Record "Web Order Header";

    trigger OnInsert()
    begin
        UpdateCalculatedFields;
    end;

    trigger OnModify()
    begin
        UpdateCalculatedFields;
    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin
        UpdateCalculatedFields;
    end;

    procedure UpdateAccountId()
    var
        GLAccount: Record "G/L Account";
    begin
        if ("No." = '') or (Type <> Type::"G/L Account") then begin
            Clear("Account Id");
            exit;
        end;

        if not GLAccount.Get("No.") then
            exit;

        "Account Id" := GLAccount.SystemId;
    end;

    procedure UpdateNo()
    var
        Item: Record Item;
        GLAccount: Record "G/L Account";
    begin
        case Type of
            Type::"G/L Account":
                begin
                    GLAccount.SetRange(SystemId, "Account Id");
                    if not GLAccount.FindFirst then
                        exit;

                    "No." := GLAccount."No.";
                end;
        end;
    end;

    local procedure UpdateCalculatedFields()
    begin
        UpdateReferencedRecordIds;
        Type := Type::"G/L Account";
    end;

    procedure UpdateReferencedRecordIds()
    begin
        UpdateAccountId;
    end;
}