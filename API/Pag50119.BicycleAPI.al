namespace bcseminarskaekipa.bcseminarskaekipa;

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