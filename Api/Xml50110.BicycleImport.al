namespace bcseminarskaekipa.bcseminarskaekipa;

xmlport 50110 BicycleImport
{
    Caption = 'Bicycle Import';
    Direction = Import;
    Format = Xml;

    schema
    {
        textelement(Bicycles)
        {
            tableelement(Bicycle; Bicycle)
            {
                XmlName = 'Bicycle';

                fieldelement(No; Bicycle."No.")
                {
                }

                fieldelement(RentalType; Bicycle."Rental Type Code")
                {
                }

                fieldelement(Description; Bicycle.Description)
                {
                }

                trigger OnBeforeInsertRecord()
                var
                    RentalType: Record RentalType;
                    ExistingBicycle: Record Bicycle;
                begin
                    // Preskoči prazen No.
                    if Bicycle."No." = '' then begin
                        CurrXMLport.Skip();
                        exit;
                    end;

                    // Preskoči če kolo že obstaja
                    if ExistingBicycle.Get(Bicycle."No.") then begin
                        CurrXMLport.Skip();
                        exit;
                    end;

                    // Preveri obstoj Rental Type
                    if not RentalType.Get(Bicycle."Rental Type Code") then begin
                        CurrXMLport.Skip();
                        exit;
                    end;
                end;
            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Options)
                {
                }
            }
        }
    }
}