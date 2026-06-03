report 50110 "RentalReport"
{
    Caption = 'Rental report';

    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    WordMergeDataItem = Customer;
    DefaultRenderingLayout = WordLayout;

    dataset
    {
        dataitem(Customer; Customer)
        {
            column(CustomerNo; "No.") { }
            column(CustomerName; Name) { }

            column(TodayDate; Today) { }
            column(CompanyName; CompanyName) { }
            dataitem(RentalHeader; "RentalHeader")
            {
                DataItemLink = "Customer No." = FIELD("No.");
                DataItemTableView = where(Status = const(Active));

                column(RentalNo; "No.") { }
                column(RentalDate; "Rental Date") { }
                column(ExpectedReturnDate; "Expected Return Date") { }
                column(ActualReturnDate; "Actual Return Date") { }
                column(Status; Status) { }

                dataitem(RentalLine; "RentalLine")
                {
                    DataItemLink = "Rental No." = FIELD("No.");

                    column(BicycleNo; "Bicycle No.") { }
                    column(Description; Description) { }
                    column(RentalDays; "Rental Days") { }
                    column(DailyRate; "Daily Rate") { }
                    column(LineAmount; "Line Amount") { }
                }
            }
            trigger OnAfterGetRecord()
            var
                RentalHeaderRec: Record "RentalHeader";
            begin
                RentalHeaderRec.SetRange("Customer No.", "No.");
                RentalHeaderRec.SetRange(Status, RentalHeaderRec.Status::Active);

                if RentalHeaderRec.IsEmpty() then
                    CurrReport.Skip();
            end;
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