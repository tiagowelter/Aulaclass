public with sharing class Car {
    private String tipo;
    private String cor;
    private String placa;
    private Integer numeroPortas;
    private Integer velocidadeAtual = 0;

    public Car(String pTipo, String pCor, String pPlaca, Integer pNumeroPortas) {
        this.tipo = pTipo;
        this.cor = pCor;
        this.placa = pPlaca;
        this.numeroPortas = pNumeroPortas;
    }

    public void acelerar(Integer pAceleracao){
        this.velocidadeAtual = pAceleracao;
        System.debug('Acelerou: '+this.velocidadeAtual);
    }

}
/*
Car carObj1 = new Car('Brasilha','Amarela','ABCD',2);
carObj1.acelerar(50);
system.debug('carObj1 '+carObj1);

Car carObj2 = new Car('Fusca','Verde','50',2);
system.debug('carObj2 '+carObj2);
*/