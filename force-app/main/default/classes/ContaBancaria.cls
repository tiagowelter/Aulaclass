public with sharing class ContaBancaria {
    public String nomeCorrentista;
    public Decimal saldoAtual;

    public ContaBancaria(String pNomeCorrentista, Decimal pSaldoAtual){
        this.nomeCorrentista = pNomeCorrentista;
        this.saldoAtual = pSaldoAtual;
    }

    public void sacar(Decimal valorSacado){
        this.saldoAtual -= valorSacado;
    }

    public void extrato(){
        system.debug('Seu saldo atual em '+System.now()+' é de R$ '+this.saldoAtual);
    }

    //Escrever um método que receba um parâmetro de some o valor ao saldo, esse vai ser o método chamado "depositar"
    public void depositar(Decimal valorDepositado){
        this.saldoAtual += valorDepositado;
    }
}