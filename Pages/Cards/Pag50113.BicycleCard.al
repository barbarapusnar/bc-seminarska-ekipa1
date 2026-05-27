namespace bcseminarskaekipa.bcseminarskaekipa;

page 50113 BicycleCard
{
    ApplicationArea = All;
    Caption = 'Bicycle Card';
    PageType = Card;
    SourceTable = Bicycle;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field("Rental Type Code"; Rec."Rental Type Code")
                {
                    ToolTip = 'Specifies the value of the Rental Type Code field.', Comment = '%';
                }

                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }

                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
            }
            group(Purchase)
            {
                Caption = 'Purchase';

                field("Purchase Date"; Rec."Purchase Date")
                {
                    ToolTip = 'Specifies the value of the Purchase Date field.', Comment = '%';
                }
                field("Purchase Price"; Rec."Purchase Price")
                {
                    ToolTip = 'Specifies the value of the Purchase Price field.', Comment = '%';
                }
            }
            group(LocationService)
            {
                Caption = 'Location & Service';
                field("Current Location"; Rec."Current Location")
                {
                    ToolTip = 'Specifies the value of the Current Location field.', Comment = '%';
                }
                field("Last Service Date"; Rec."Last Service Date")
                {
                    ToolTip = 'Specifies the value of the Last Service Date field.', Comment = '%';
                }
            }
        }
    }
}
