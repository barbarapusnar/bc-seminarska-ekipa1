namespace bcseminarskaekipa.bcseminarskaekipa;

enum 50111 RentalStatus
{
    Extensible = true;
    
    value(0; Open)
    {
        Caption = 'Odprto';
    }
    value(1; Active)
    {
        Caption = 'Aktivno';
    }
    value(2; Returned)
    {
        Caption = 'Vrnjeno';
    }
    value(3; Cancelled)
    {
        Caption = 'Preklicano';
    }
}
