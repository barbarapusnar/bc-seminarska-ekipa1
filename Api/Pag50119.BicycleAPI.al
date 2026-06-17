namespace bcseminarskaekipa.bcseminarskaekipa;

page 50119 BicycleAPI
{
    PageType = API;
    Caption = 'Bicycle API';

    APIPublisher = 'school';
    APIGroup = 'rental';
    APIVersion = 'v1.0';

    EntityName = 'bicycle';
    EntitySetName = 'bicycles';

    SourceTable = Bicycle;

    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'Id';
                    ApplicationArea = All;
                }

                field(no; Rec."No.")
                {
                    Caption = 'No.';
                    ApplicationArea = All;
                }

                field(description; Rec.Description)
                {
                    Caption = 'Description';
                    ApplicationArea = All;
                }

                field(status; Rec.Status)
                {
                    Caption = 'Status';
                    ApplicationArea = All;
                }

                field(rentalTypeCode; Rec."Rental Type Code")
                {
                    Caption = 'Rental Type';
                    ApplicationArea = All;
                }
            }
        }
    }
}