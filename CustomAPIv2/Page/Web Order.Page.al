page 50100 "Web Order Entity"
{
    Caption = 'webOrders', Locked = true;
    PageType = API;

    APIPublisher = 'Manjusree';
    APIGroup = 'app1';
    APIVersion = 'v2.0';

    EntityCaption = 'webOrder';
    EntitySetCaption = 'webOrders';
    EntityName = 'webOrder';
    EntitySetName = 'webOrders';

    ODataKeyFields = SystemId;
    SourceTable = "Web Order Header";

    ChangeTrackingAllowed = true;
    DelayedInsert = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(number; Rec."No.")
                {
                    ApplicationArea = All;
                    Caption = 'number';
                }
                field(externalDocumentNumber; Rec."External Doc. No.")
                {
                    ApplicationArea = All;
                    Caption = 'externalDocumentNumber';
                }
                field(orderDate; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    Caption = 'orderDate', Locked = true;
                }
                field(sellToCustomerNo; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = All;
                }
                field(sellToName; Rec."Sell-to Name")
                {
                    ApplicationArea = All;
                }
                field(SystemId; Rec.SystemId)
                {

                }
                part(webOrderLines; "Web Order Line")
                {
                    ApplicationArea = All;
                    Caption = 'Lines', Locked = true;
                    EntityName = 'webOrderLine';
                    EntitySetName = 'webOrderLines';
                    SubPageLink = "Document Id" = FIELD(SystemId);
                }

            }
        }
    }
}

