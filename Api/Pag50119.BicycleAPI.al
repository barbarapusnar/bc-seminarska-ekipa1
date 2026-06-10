namespace bcseminarskaekipa.bcseminarskaekipa;

page 50119 BicycleAPI
{
    PageType = API;
    SourceTable = "Bicycle";

    APIPublisher = 'bcseminarskaekipa';
    APIGroup = 'rental';
    APIVersion = 'v1.0';

    EntityName = 'bicycle';
    EntitySetName = 'bicycles';

    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(no; Rec."No.") { }
                field(description; Rec.Description) { }
                field(status; Rec.Status) { }
                field(rentalType; Rec."Rental Type Code") { }
            }
        }
    }
}