namespace bcseminarskaekipa.bcseminarskaekipa;

page 50111 RentalTypeCard
{
    ApplicationArea = All;
    Caption = 'Rental Type Card';
    PageType = Card;
    SourceTable = "RentalType";

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
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }

            }
            group(Rental)
            {
                Caption = 'Rental';

                field("Daily Rate"; Rec."Daily Rate")
                {
                    ToolTip = 'Specifies the value of the Daily Rate field.', Comment = '%';
                }
                field("Max Rental Days"; Rec."Max Rental Days")
                {
                    ToolTip = 'Specifies the value of the Max Rental Days field.', Comment = '%';
                }
                field("Requires Deposit"; Rec."Requires Deposit")
                {
                    ToolTip = 'Specifies the value of the Requires Deposit field.', Comment = '%';
                }
                field("Deposit Amount"; Rec."Deposit Amount")
                {
                    ToolTip = 'Specifies the value of the Deposit Amount field.', Comment = '%';
                }
            }
        }
    }
}
