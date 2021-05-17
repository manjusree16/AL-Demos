pageextension 50100 "Item Images Ext" extends "Item Card"
{
    layout
    {
        addafter(ItemPicture)
        {
            part(ItemImages; "Item Images")
            {
                ApplicationArea = All;
                Caption = 'Picture';
                SubPageLink = "Package Code" = FIELD("No."), "Media ID" = field(SystemId), "Media Set ID" = field(SystemId);
            }
        }
    }
}