namespace bcseminarskaekipa.bcseminarskaekipa;

page 50114 RentalList
{
    ApplicationArea = All;
    Caption = 'Rental List';
    PageType = List;
    SourceTable = "Rental Header";
    UsageCategory = Lists;
    CardPageId = RentalCard;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the rental number.';
                }

                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer number.';
                }

                field("Rental Date"; Rec."Rental Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the rental date.';
                }

                field("Expected Return Date"; Rec."Expected Return Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the expected return date.';
                }

                field("Actual Return Date"; Rec."Actual Return Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the actual return date.';
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the rental status.';
                }

                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the total rental amount.';
                }
            }
        }
    }
}