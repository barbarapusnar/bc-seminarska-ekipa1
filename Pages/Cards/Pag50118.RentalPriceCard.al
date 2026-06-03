namespace bcseminarskaekipa.bcseminarskaekipa;

page 50118 RentalPriceCard
{
    Caption = 'Rental Price Card';
    PageType = Card;
    SourceTable = RentalPriceList;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
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
}
