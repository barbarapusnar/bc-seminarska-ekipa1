report 50140 "Rental report"
{
    Caption = 'Rental report';

    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    DefaultRenderingLayout =WordLayout;

    dataset
    {
        dataitem(Customer; Customer)
        {
            column(CustomerNo; "No.") { }
            column(CustomerName; Name) { }

            dataitem(RentalHeader; "Rental Header")
            {
                DataItemLink = "Customer No." = FIELD("No.");

                column(RentalNo; "No.") { }
                column(RentalDate; "Rental Date") { }
                column(ExpectedReturnDate; "Expected Return Date") { }
                column(ActualReturnDate; "Actual Return Date") { }
                column(Status; Status) { }

                dataitem(RentalLine; "Rental Line")
                {
                    DataItemLink = "Rental No." = FIELD("No.");

                    column(BicycleNo; "Bicycle No.") { }
                    column(Description; Description) { }
                    column(RentalDays; "Rental Days") { }
                    column(DailyRate; "Daily Rate") { }
                    column(LineAmount; "Line Amount") { }
                }
            }
        }
    }

    rendering
    {
        layout(WordLayout)
        {
            Type = Word;
            LayoutFile = 'Layouts/RentalOverview.docx';
        }
    }
}