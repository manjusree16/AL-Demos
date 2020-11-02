pageextension 50126 "Customer Entry Pivot" extends "Customer Card"
{
    layout
    {
        addlast(factboxes)
        {
            part(Pivot; "Pivot Factbox")
            {
                ApplicationArea = all;
                SubPageLink = "Customer No." = field("No.");
            }
        }
    }
}