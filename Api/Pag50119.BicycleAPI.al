namespace bcseminarskaekipa.bcseminarskaekipa;

page 50119 BicycleAPI
{
    PageType = API;
    SourceTable = Bicycle;

    APIPublisher = 'mycompany';
    APIGroup = 'rental';
    APIVersion = 'v1.0';

    EntityName = 'bicycle';
    EntitySetName = 'bicycles';

    DelayedInsert = true;

    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }

                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }

                field(status; Rec.Status)
                {
                    Caption = 'Status';
                }

                field(rentalType; Rec."Rental Type Code")
                {
                    Caption = 'Rental Type';
                }
            }
        }
    }
}
