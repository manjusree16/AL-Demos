table 50100 "Web Order Buffer"
{
    Caption = 'Web Order Header';

    fields
    {
        field(1; "No."; Code[20])
        {

        }
        field(2; "Sell-to Customer No."; Code[20])
        {
            NotBlank = true;
            TableRelation = Customer;

            trigger OnValidate()
            begin
                UpdateSellToCustomerId;
            end;
        }
        field(3; "Sell-to Name"; Text[100])
        {
        }
        field(4; "Posting Date"; Date)
        {
        }
        field(5; "External Doc. No."; Code[35])
        {
        }
        field(8000; Id; Guid)
        {
        }
        field(9630; "Last Modified Date Time"; DateTime)
        {
            Caption = 'Last Modified Date Time';
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(9631; "Customer Id"; Guid)
        {
            Caption = 'Customer Id';
            DataClassification = SystemMetadata;
            TableRelation = Customer.SystemId;
        }
    }

    keys
    {
        key(PK; "No.")
        {
        }
        key(SK; id)
        {

        }
    }


    trigger OnInsert()
    begin
        "Last Modified Date Time" := CurrentDateTime;
        UpdateReferencedRecordIds();
    end;

    trigger OnModify()
    begin
        "Last Modified Date Time" := CurrentDateTime;
        UpdateReferencedRecordIds();
    end;

    trigger OnDelete()
    var
        WebOrderLine: Record "Web Order Line";
    begin
        WebOrderLine.Reset();
        WebOrderLine.SetCurrentKey("Document Id");
        WebOrderLine.SetRange("Document Id", Id);
        if WebOrderLine.FindSet() then
            WebOrderLine.DeleteAll();
    end;

    trigger OnRename()
    begin
        "Last Modified Date Time" := CurrentDateTime;
        UpdateReferencedRecordIds();
    end;

    local procedure UpdateSellToCustomerId()
    var
        Customer: Record Customer;
    begin
        if "Sell-to Customer No." = '' then begin
            Clear("Customer Id");
            exit;
        end;

        if not Customer.Get("Sell-to Customer No.") then
            exit;

        "Customer Id" := Customer.SystemId;
        "Sell-to Name" := Customer.Name;
    end;


    procedure UpdateReferencedRecordIds()
    begin
        UpdateNo();
        UpdateSellToCustomerId();
    end;

    local procedure UpdateNo()
    var
        WebOrderBuffer: Record "Web Order Buffer";
    begin
        if "No." = '' then
            if WebOrderBuffer.FindLast() then
                "No." := IncStr(WebOrderBuffer."No.")
            else
                "No." := 'WO0001';
        Id := CreateGuid();
    end;

}