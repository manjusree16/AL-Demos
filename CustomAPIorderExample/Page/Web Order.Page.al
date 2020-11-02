page 50100 "Web Order Entity"
{
    Caption = 'webOrders', Locked = true;
    ChangeTrackingAllowed = true;
    DelayedInsert = true;
    EntityName = 'webOrder';
    EntitySetName = 'webOrders';
    ODataKeyFields = Id;
    PageType = API;
    APIPublisher = 'Manjusree';
    APIGroup = 'app1';
    APIVersion = 'beta';
    SourceTable = "Web Order Buffer";
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(number; "No.")
                {
                    ApplicationArea = All;
                    Caption = 'number';
                }
                field(externalDocumentNumber; "External Doc. No.")
                {
                    ApplicationArea = All;
                    Caption = 'externalDocumentNumber';
                }
                field(Id; Id)
                {
                    ApplicationArea = All;
                    Caption = 'Id';
                }
                field(orderDate; "Posting Date")
                {
                    ApplicationArea = All;
                    Caption = 'orderDate', Locked = true;

                }

                field("SellToCustomerNo"; "Sell-to Customer No.")
                {
                    ApplicationArea = All;
                }
                field("SellToName"; "Sell-to Name")
                {
                    ApplicationArea = All;
                }

                part(webOrderLines; "Web Order Line")
                {
                    ApplicationArea = All;
                    Caption = 'Lines', Locked = true;
                    EntityName = 'webOrderLine';
                    EntitySetName = 'webOrderLines';
                    SubPageLink = "Document Id" = FIELD(Id);
                }

            }
        }
    }
}

