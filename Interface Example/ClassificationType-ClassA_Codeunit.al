codeunit 50151 "Classification Type - Class A" implements "Item Classification Type"
{
    procedure InsertRemarks(var ItemNo: Code[20])
    var
        CommentLine: Record "Comment Line";
        LineNo: Integer;
    begin
        if CommentLine.FindLast() then
            LineNo := CommentLine."Line No.";
        CommentLine.Init();
        CommentLine."Table Name" := CommentLine."Table Name"::Item;
        CommentLine."No." := ItemNo;
        CommentLine."Line No." := LineNo + 10000;
        CommentLine.Comment := 'Classification code of item ' + ItemNo + ' is A';
        CommentLine.Insert();
    end;
}