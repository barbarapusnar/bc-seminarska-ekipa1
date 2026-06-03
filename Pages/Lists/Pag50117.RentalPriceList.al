namespace bcseminarskaekipa.bcseminarskaekipa;

page 50117 RentalPriceList
{
    Caption = 'Rental Price List';
    PageType = List;
    SourceTable = RentalPriceList;
    ApplicationArea = All;
    CardPageID = RentalPriceCard;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(RentalTypeCode; Rec.RentalTypeCode)
                {
                    ApplicationArea = All;
                }
                field(StartingDate; Rec.StartingDate)
                {
                    ApplicationArea = All;
                }
                field(EndingDate; Rec.EndingDate)
                {
                    ApplicationArea = All;
                }
                field(DailyRate; Rec.DailyRate)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            action(OpenCard)
            {
                Caption = 'Open Card';
                ApplicationArea = All;
                Image = EditLines;
                RunObject = page RentalPriceCard;
            }
        }
    }
}
