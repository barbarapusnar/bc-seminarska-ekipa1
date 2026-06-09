page 50114 RentalList
{
    ApplicationArea = All;
    Caption = 'Rental List';
    PageType = List;
    SourceTable = "RentalHeader";
    UsageCategory = Lists;
    CardPageId = RentalCard;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.") { ApplicationArea = All; }
                field("Customer No."; Rec."Customer No.") { ApplicationArea = All; }
                field("Rental Date"; Rec."Rental Date") { ApplicationArea = All; }
                field("Expected Return Date"; Rec."Expected Return Date") { ApplicationArea = All; }
                field("Actual Return Date"; Rec."Actual Return Date") { ApplicationArea = All; }
                field(Status; Rec.Status) { ApplicationArea = All; }
                field("Total Amount"; Rec."Total Amount") { ApplicationArea = All; }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(PrintRentalReport)
            {
                Caption = 'Rental Report';
                ApplicationArea = All;
                Image = Print;

                trigger OnAction()
                begin
                    Report.Run(50110, true, true);
                end;
            }
        }
    }
}