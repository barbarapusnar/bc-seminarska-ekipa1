namespace bcseminarskaekipa.bcseminarskaekipa;
//http://BCSandbox-default:7048/BC/api/CRONUS/rental/v1.0/companies(4e7747a0-8c58-f111-8e23-7ced8dad73fc)/bicycles
page 50119 BicycleAPI
{
    PageType = API;

    APIPublisher = 'CRONUS';
    APIGroup = 'rental';
    APIVersion = 'v1.0';

    EntityName = 'bicycle';
    EntitySetName = 'bicycles';

    SourceTable = Bicycle;

    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    DelayedInsert = false;

    Caption = 'Bicycle API';

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(No; Rec."No.")
                {
                    ApplicationArea=All;
                }

                field(Description; Rec.Description)
                {
                }

                field(Status; Rec.Status)
                {
                }

                field(RentalType; Rec."Rental Type Code")
                {
                }
            }
        }
    }
}