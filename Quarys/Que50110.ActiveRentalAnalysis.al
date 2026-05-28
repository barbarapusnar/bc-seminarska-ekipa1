namespace bcseminarskaekipa.bcseminarskaekipa;

query 50110 ActiveRentalAnalysis
{
    Caption = 'Active Rental Analysis';
    QueryType = Normal;

    elements
    {
        dataitem(RentalHeader; "Rental Header")
        {
            DataItemTableFilter = Status = const(Active);

            column(Rental_No; "No.") { }
            column(Customer_No; "Customer No.") { }
            column(Status; Status) { }

            dataitem(RentalLine; "Rental Line")
            {
                DataItemLink = "Rental No." = RentalHeader."No.";

                column(Bicycle_No; "Bicycle No.") { }
                column(Description; Description) { }
                column(Rental_Days; "Rental Days") { }
                column(Line_Amount; "Line Amount") { }

                dataitem(Bicycle; Bicycle)
                {
                    DataItemLink = "No." = RentalLine."Bicycle No.";

                    column(Bicycle_Description; Description) { }
                }
            }
        }
    }
}