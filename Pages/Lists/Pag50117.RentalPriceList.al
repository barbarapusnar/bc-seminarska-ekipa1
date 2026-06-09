namespace bcseminarskaekipa.bcseminarskaekipa;

page 50117 RentalPriceList
{
    Caption = 'Rental Price List';
    PageType = List;
    SourceTable = RentalPriceList;
    ApplicationArea = All;
    UsageCategory = Lists;
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
}
