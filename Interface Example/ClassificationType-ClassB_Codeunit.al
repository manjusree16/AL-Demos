codeunit 50152 "Classification Type - Class B" implements "Item Classification Type"
{
    procedure InsertRemarks(var ItemNo: Code[20])
    begin

        Message('Classification Code of item ' + ItemNo + ' is B');
    end;
}