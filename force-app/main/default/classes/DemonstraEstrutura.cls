public with sharing class DemonstraEstrutura {
    public DemonstraEstrutura() {

    }

    /*
    Autor: Tiago Welter
    Classe que demostra estrutura para nossa super aula com supers participantes
    */
    public static void variaveis(){
        
        //Aqui é um exemplo de declaração de variável
        Boolean ehGremista = true;
        system.debug('a variavel ehGremista tem o valor de '+ehGremista);//isso é um sistem debug

        //Declaração de uma variável
        //TIPO + NOME DA VARIAVEL = VALOR INICIAL
        String nomeAluno = 'Maria';

        //transformando uma variável booleana em um texto do tipo string
        String transformandoTipo = String.valueOf(ehGremista);

        //Exemplo com varias variaveis
        Integer idade = 10;
        String nome = 'Mariana';
        Boolean ehMenina = true;
        system.debug('O valor definido para a variável idade é = '+idade);
        system.debug('O valor definido para a variável nome é = '+nome);
        system.debug('O valor definido para a variável ehMenina é = '+ehMenina);

        //outro exemplo
        Integer valornaContaDoGian;
        system.debug('O valor definido para a variável valornaContaDoGian é = '+valornaContaDoGian);

        valornaContaDoGian = 1000;
        system.debug('O valor definido para a variável valornaContaDoGian é = '+valornaContaDoGian);

        //Double pode ter casas decimais
        Double valorComCasasDecimais = 10.02550505;
        Decimal valorDecimal = 15.05;

        //Date trabalha com datas
        Date today = system.Today();
        system.debug('O dia de hoje é = '+today);

        DateTime dataEHora = system.Now();
        system.debug('O dia e a hora atual é = '+dataEHora);

        Integer diasASomar = 7;

        dataEHora = dataEHora.addDays(diasASomar);
        system.debug('O dia e a hora daqui a '+diasASomar+' dias é = '+dataEHora);

        Id idValido = '001D000000I8mUOIAZ';

        //Variaveis do tipo sObject
        Account acc = new Account();
        acc.Name = 'Lucas';
        acc.Phone = '55555555';
        system.debug('O valor do objeto acc é = '+acc);
        //insert acc;

        Opportunity opp = new Opportunity();
        opp.Name = 'Teste opp';
        opp.Description = 'Oportunidade criada para testes';
        system.debug('O valor do objeto opp é = '+opp);

        //Exemplos de utilização de sObject
        Account recuperaDadosAccount = (Account)DemonstraEstrutura.loadObjectInfoById('001Hp00002cztAFIAY');
        system.debug('recuperaDadosAccount = '+recuperaDadosAccount);

        Opportunity oppRecupera = (Opportunity)DemonstraEstrutura.loadObjectInfoById('006Hp000014WBblIAG');
        system.debug('oppRecupera = '+oppRecupera);

    }

    public static sObject loadObjectInfoById(Id recordId) {
        DescribeSObjectResult objectType = recordId.getSobjectType().getDescribe();
        List<String> objectFields = new List<String>(objectType.fields.getMap().keySet());
        String query = 'SELECT ' + String.join(objectFields, ',') + ' FROM ' + objectType.getName() + ' WHERE Id = \'' + String.escapeSingleQuotes(recordId) + '\' LIMIT 1';
        return Database.query(query);
    }

}