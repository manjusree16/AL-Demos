page 50100 "Item Images"
{
    Caption = 'Item Images';
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    PageType = CardPart;
    SourceTable = "Config. Media Buffer";
    SourceTableTemporary = true;
    layout
    {
        area(content)
        {
            field(Picture; TenantMediaRec.Content)
            {
                ApplicationArea = Basic, Suite, Invoicing;
                ShowCaption = false;
                ToolTip = 'Specifies the picture that has been inserted for the item.';
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ImportPicture)
            {
                ApplicationArea = All;
                Caption = 'Import';
                Image = Import;
                ToolTip = 'Import a picture file.';

                trigger OnAction()
                begin
                    ImportImages();
                end;
            }
            action(DeletePicture)
            {
                ApplicationArea = All;
                Caption = 'Delete';
                Image = Delete;
                ToolTip = 'Delete a picture file.';

                trigger OnAction()
                begin
                    DeleteImages();
                end;
            }
            action(Next)
            {
                ApplicationArea = All;
                Image = NextRecord;
                Promoted = true;
                PromotedOnly = true;
                trigger OnAction()
                begin
                    Rec.Next(1);
                end;
            }
            action(Previous)
            {
                ApplicationArea = All;
                Image = PreviousRecord;
                Promoted = true;
                PromotedOnly = true;
                trigger OnAction()
                begin
                    Rec.Next(-1);
                end;
            }
        }
    }

    trigger OnOpenPage()
    var
    begin
        InsertItemMediaBuffer();
    end;

    trigger OnAfterGetCurrRecord()
    var
    begin
        InsertItemMediaBuffer();
    end;

    local procedure InsertItemMediaBuffer()
    var
        Item: Record Item;
        TenantMedia: Record "Tenant Media";
        PicInStream: InStream;
        i: Integer;
    begin
        if Item.Get(Rec."Package Code") then begin
            Counter := Item.Picture.Count;
            if (Counter <> Rec.Count) then begin
                Rec.DeleteAll();
                for i := 1 to Counter do begin
                    if not Rec.Get(Rec."Package Code", Rec."Media Set ID", Rec."Media ID", i) then begin
                        Rec.Init();
                        Rec."No." := i;
                        Rec."Package Code" := Item."No.";
                        if TenantMedia.Get(Item.Picture.Item(i)) then begin
                            TenantMedia.CalcFields(Content);
                            if TenantMedia.Content.HasValue then
                                Rec."Media ID" := Rec."Media ID";
                            Rec."Media Set ID" := Rec."Media ID";
                            Rec.SystemId := TenantMedia.ID;
                        end;
                        Rec.Insert();
                        if Rec.FindFirst() then;
                    end;
                end;
            end;
            clear(TenantMediaRec.Content);
            TenantMediaRec.Reset();
            if TenantMediaRec.Get(Rec.SystemId) then
                TenantMediaRec.CalcFields(Content);
        end;
    end;

    local procedure ImportImages();
    var
        Item: Record Item;
        TempItemMediaBuffer: Record "Config. Media Buffer" temporary;
        PicInStream: InStream;
        FromFileName: Text;
    begin
        if Item.get(Rec."Package Code") then begin
            if UploadIntoStream('Import', '', 'All Files (*.*)|*.*', FromFileName, PicInStream) then begin
                TempItemMediaBuffer.DeleteAll();
                TempItemMediaBuffer.Init();
                TempItemMediaBuffer."No." := 1;
                TempItemMediaBuffer."Package Code" := Item."No.";
                TempItemMediaBuffer.Media.ImportStream(PicInStream, FromFileName);
                TempItemMediaBuffer."Media ID" := TempItemMediaBuffer.Media.MediaId;
                TempItemMediaBuffer."Media Set ID" := TempItemMediaBuffer.Media.MediaId;
                TempItemMediaBuffer.Insert();
                Item.Picture.Insert(TempItemMediaBuffer.Media.MediaId);
                Item.Modify();
                InsertItemMediaBuffer();
            end;
        end;
    end;

    local procedure DeleteImages()
    var
        Item: Record Item;
        TenantMedia: Record "Tenant Media";
    begin
        if Item.Get(Rec."Package Code") then begin
            if Item.Picture.Remove(Rec.SystemId) then
                Item.Modify();
        end;
        if TenantMedia.Get(Rec.SystemId) then
            TenantMedia.Delete(true);
        CurrPage.Update(false);
    end;

    var
        Counter: Integer;
        TenantMediaRec: Record "Tenant Media";
}

