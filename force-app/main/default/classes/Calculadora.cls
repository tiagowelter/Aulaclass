public with sharing class Calculadora {
    public Decimal valor;
    public Calculadora(Decimal pValor) {
        this.valor = pValor;
    }
    public void soma(Decimal valorSomar){
        this.valor += valorSomar;
    }
    public void subtrair(Decimal valorSubtrai){
        this.valor -= valorSubtrai;
    }
}
/*
Calculadora newValue = new Calculadora(10.00);
system.debug('O valor de newValue é de '+newValue.valor);
newValue.soma(2.00);
system.debug('O valor de newValue é de '+newValue.valor);
newValue.subtrair(3.00);
system.debug('O valor de newValue é de '+newValue.valor);
*/