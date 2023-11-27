public with sharing class CalculadoraV2 {
    public static Decimal soma(Decimal valoraSerSomado, Decimal valoraSomar){
        return valoraSerSomado + valoraSomar;
    }
    public static Decimal subtrair(Decimal valoraSerSubtraido, Decimal valoraSubtrair){
        return valoraSerSubtraido - valoraSubtrair;
    }
}
/*
Decimal valorInicial = 10.00;
system.debug('O valor de valorInicial é de '+valorInicial);
valorInicial = CalculadoraV2.soma(valorInicial, 2);
system.debug('O valor de valorInicial é de '+valorInicial);
valorInicial = CalculadoraV2.subtrair(valorInicial, 3);
system.debug('O valor de valorInicial é de '+valorInicial);
*/