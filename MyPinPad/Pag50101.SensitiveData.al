page 50101 "Sensitive Data"
{
    PageType = Card;
    UsageCategory = None;
    Caption = 'Sensitive Data';
    SourceTable = "General Ledger Setup";
    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field';
                    ApplicationArea = All;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field';
                    ApplicationArea = All;
                }
                field("Allow Posting From"; Rec."Allow Posting From")
                {
                    ToolTip = 'Specifies the value of the Allow Posting From field';
                    ApplicationArea = All;
                }
                field("Allow Posting To"; Rec."Allow Posting To")
                {
                    ToolTip = 'Specifies the value of the Allow Posting To field';
                    ApplicationArea = All;
                }
            }
        }
    }
}