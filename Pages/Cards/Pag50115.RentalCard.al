namespace bcseminarskaekipa.bcseminarskaekipa;

page 50115 "Rental Card"
{
    ApplicationArea = All;
    Caption = 'Rental Card';
    PageType = Card;
    SourceTable = "Rental Header";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.") { }
                field("Customer No."; Rec."Customer No.") { }
                field("Rental Date"; Rec."Rental Date") { }
                field("Expected Return Date"; Rec."Expected Return Date") { }
                field("Actual Return Date"; Rec."Actual Return Date") { }
                field(Status; Rec.Status) { }
                field("Total Amount"; Rec."Total Amount")
                {
                    Editable = false;
                }
            }

            part(RentalLines; RentalLineSubpage)
            {
                SubPageLink = "Rental No." = field("No."); //Povezava podstrani
            }
        }
    }
}
