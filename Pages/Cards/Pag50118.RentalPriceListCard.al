namespace bcseminarskaekipa.bcseminarskaekipa;

page 50118 RentalPriceListCard
{
    PageType = Card;
    SourceTable = RentalPriceList;
    ApplicationArea = All;
    Caption = 'Rental Price List Card';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(Code; Rec.Code) { }
                field(Description; Rec.Description) { }
                field(RentalTypeCode; Rec.RentalTypeCode) { }
            }

            group(Pricing)
            {
                field(StartingDate; Rec.StartingDate) { }
                field(EndingDate; Rec.EndingDate) { }
                field(DailyRate; Rec.DailyRate) { }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(TestPrice)
            {
                Caption = 'Test Price';
                ApplicationArea = All;

                trigger OnAction()
                var
                    PriceList: Record RentalPriceList;
                    Price: Decimal;
                begin
                    Price := PriceList.FindPrice(Rec.RentalTypeCode, Today);
                    Message('Price is %1', Price);
                end;
            }
        }
    }
}