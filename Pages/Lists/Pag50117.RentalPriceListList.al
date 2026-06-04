namespace bcseminarskaekipa.bcseminarskaekipa;

page 50117 RentalPriceListList
{
    PageType = List;
    SourceTable = RentalPriceList;
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'Rental Price List';
    CardPageId = RentalPriceListCard;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Code; Rec.Code) { }
                field(Description; Rec.Description) { }
                field(RentalTypeCode; Rec.RentalTypeCode) { }
                field(StartingDate; Rec.StartingDate) { }
                field(EndingDate; Rec.EndingDate) { }
                field(DailyRate; Rec.DailyRate) { }
            }
        }
    }
}