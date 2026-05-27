namespace bcseminarskaekipa.bcseminarskaekipa;

page 50116 RentalLineSubpage
{
    ApplicationArea = All;
    Caption = 'RentalLineSubpage';
    PageType = ListPart;
    SourceTable = "Rental Line";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Bicycle No."; Rec."Bicycle No.")
                {
                    ToolTip = 'Specifies the value of the Bicycle No. field.', Comment = '%';
                }
                field("Daily Rate"; Rec."Daily Rate")
                {
                    ToolTip = 'Specifies the value of the Daily Rate field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ToolTip = 'Specifies the value of the Line Amount field.', Comment = '%';
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.', Comment = '%';
                }
                field("Rental Days"; Rec."Rental Days")
                {
                    ToolTip = 'Specifies the value of the Rental Days field.', Comment = '%';
                }
                field("Rental No."; Rec."Rental No.")
                {
                    ToolTip = 'Specifies the value of the Rental No. field.', Comment = '%';
                }
            }
        }
    }
}
