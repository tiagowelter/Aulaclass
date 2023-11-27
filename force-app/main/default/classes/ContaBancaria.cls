public with sharing class ContaBancaria {
    public String nomeCorrentista;
    public Decimal saldoAtual;

    //metodo construtor
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

    public String getName(){
        return this.nomeCorrentista;
    }

    public void setName(String nomeCorrentista){
        this.nomeCorrentista = name;
    }

}

/*
ContaBancaria conta1 = new ContaBancaria('Gian',1000.00);
system.debug('conta1 '+conta1);
conta1.sacar(100.00);
conta1.extrato();
conta1.sacar(50.00);
conta1.sacar(150.00);
conta1.extrato();
conta1.depositar(55);
conta1.extrato();

ContaBancaria conta2 = new ContaBancaria('André',2000.00);
system.debug('conta2 '+conta2);

conta1.depositar(5);
conta1.extrato();
*/