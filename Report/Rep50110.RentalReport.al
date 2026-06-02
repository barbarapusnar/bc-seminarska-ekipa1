namespace bcseminarskaekipa.bcseminarskaekipa;

using Microsoft.Sales.Customer;

report 50110 RentalReport
{
    Caption = 'Pregled izposoj po strankah';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    DefaultLayout = Word;
    WordLayout = 'RentalReport.docx';

    dataset
    {
        dataitem(Customer; Customer)
        {
            column(Customer_No; "No.") { }
            column(Customer_Name; Name) { }

            dataitem(RentalHeader; "Rental Header")
            {
                DataItemLink = "Customer No." = field("No.");

                column(Rental_No; "No.") { }
                column(Rental_Date; "Rental Date") { }
                column(Expected_Return_Date; "Expected Return Date") { }
                column(Actual_Return_Date; "Actual Return Date") { }
                column(Status; Status) { }

                dataitem(RentalLine; "Rental Line")
                {
                    DataItemLink = "Rental No." = field("No.");

                    column(Bicycle_No; "Bicycle No.") { }
                    column(Description; Description) { }
                    column(Rental_Days; "Rental Days") { }
                    column(Daily_Rate; "Daily Rate") { }
                    column(Line_Amount; "Line Amount") { }
                }
            }
        }
    }
}