query 50130 "Active Rentals Analysis"
{
    Caption = 'Active Rentals Analysis';
    QueryType = Normal;
    UsageCategory = ReportsAndAnalysis;

    elements
    {
        dataitem(RentalHeader; "Rental Header")
        {
            DataItemTableFilter = Status = CONST(Active);

            column(RentalNo; "No.")
            {
            }

            column(RentalStatus; Status)
            {
            }

            column(CustomerNo; "Customer No.")
            {
            }

            dataitem(Customer; Customer)
            {
                DataItemLink = "No." = RentalHeader."Customer No.";

                column(CustomerName; Name)
                {
                }

                dataitem(RentalLine; "Rental Line")
                {
                    DataItemLink = "Rental No." = RentalHeader."No.";

                    column(BicycleNo; "Bicycle No.")
                    {
                    }

                    column(RentalDays; "Rental Days")
                    {
                    }

                    column(LineAmount; "Line Amount")
                    {
                    }

                    dataitem(Bicycle; Bicycle)
                    {
                        DataItemLink = "No." = RentalLine."Bicycle No.";

                        column(BicycleDescription; Description)
                        {
                        }
                    }
                }
            }
        }
    }
}