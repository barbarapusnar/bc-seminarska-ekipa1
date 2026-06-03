namespace bcseminarskaekipa.bcseminarskaekipa;

page 50115 RentalCard
{
    ApplicationArea = All;
    Caption = 'Rental Card';
    PageType = Card;
    SourceTable = "RentalHeader";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

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

            part(RentalLines; RentalLine)
            {
                ApplicationArea = All;
                SubPageLink = "Rental No." = FIELD("No.");
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(StartRental)
            {
                ApplicationArea = All;
                Caption = 'Start Rental';
                Image = Start;

                trigger OnAction()
                var
                    RentalManagement: Codeunit "RentalManagement";
                begin
                    RentalManagement.StartRental(Rec);
                end;
            }

            action(ProcessReturn)
            {
                ApplicationArea = All;
                Caption = 'Process Return';
                Image = Return;

                trigger OnAction()
                var
                    RentalManagement: Codeunit "RentalManagement";
                begin
                    RentalManagement.ProcessReturn(Rec);
                end;
            }
        }
    }
}