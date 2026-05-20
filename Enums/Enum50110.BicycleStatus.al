namespace bcseminarskaekipa.bcseminarskaekipa;

enum 50110 "Bicycle Status"
{
    Extensible = true;
    
    value(0; Available)
    {
        Caption = 'Na voljo';
    }
    value(1; Rented)
    {
        Caption = 'Izposojeno';
    }
    value(2; Maintenance)
    {
        Caption = 'Na Servisu';
    }
    value(3; Retired)
    {
        Caption = 'Izločeno';
    }
}
