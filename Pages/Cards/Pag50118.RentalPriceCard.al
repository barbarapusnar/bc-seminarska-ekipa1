namespace bcseminarskaekipa.bcseminarskaekipa;

page 50118 RentalPriceCard
{
    ApplicationArea = All;
    Caption = 'RentalPriceCard';
    PageType = Card;
    SourceTable = RentalPrice;
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.', Comment = '%';
                }
                field(DailyRate; Rec.DailyRate)
                {
                    ToolTip = 'Specifies the value of the DailyRate field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field(EndingDate; Rec.EndingDate)
                {
                    ToolTip = 'Specifies the value of the EndingDate field.', Comment = '%';
                }
                field(RentalTypeCode; Rec.RentalTypeCode)
                {
                    ToolTip = 'Specifies the value of the RentalTypeCode field.', Comment = '%';
                }
                field(StartingDate; Rec.StartingDate)
                {
                    ToolTip = 'Specifies the value of the StartingDate field.', Comment = '%';
                }
            }
        }
    }
}
