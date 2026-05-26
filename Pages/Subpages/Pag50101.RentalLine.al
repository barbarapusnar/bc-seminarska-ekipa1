namespace bcseminarskaekipa.bcseminarskaekipa;

page 50101 RentalLine
{
    ApplicationArea = All;
    Caption = 'Rental Line Subpage';
    PageType = ListPart;
    SourceTable = "Rental Line";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Rental No."; Rec."Rental No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the rental document number.';
                }

                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the line number.';
                }

                field("Bicycle No."; Rec."Bicycle No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the bicycle number.';
                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the description.';
                }

                field("Rental Days"; Rec."Rental Days")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of rental days.';
                }

                field("Daily Rate"; Rec."Daily Rate")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the daily rental rate.';
                }

                field("Line Amount"; Rec."Line Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the line amount.';
                }
            }
        }
    }
}