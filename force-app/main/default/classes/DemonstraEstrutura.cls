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

    public static void variavesDeColecao(){

        //Lista
        List<String> listNames = new List<String>();
        
        //adicionando o nome da Ana
        listNames.add('Ana');
        
        //adicionando o nome da Maria
        listNames.add('Maria');
        
        //adiconando o nome do Carlos
        listNames.add('Carlos');

        listNames.add('30');

        system.debug('listNames '+listNames);

        system.debug('recuperando o segundo valor da lista listNames: '+listNames[1]);

        List<Integer> listDeInteiros = new List<Integer>{10,20};
        listDeInteiros.add(30);
        system.debug('listDeInteiros '+listDeInteiros);


        Account acc1 = new Account();
        acc1.Name = 'Conta 1';
        acc1.Phone = '1111111111111';

        Account acc2 =  new Account();
        acc2.Name = 'Conta 2';
        acc2.Phone = '22222222222';

        List<Account> accountList = new List<Account>{acc1, acc2};

        Account acc3 = new Account();
        acc3.Name = 'Conta 3';
        acc3.Phone = '3333333333';

        accountList.add(acc3);

        Account acc4 = new Account();
        acc4.Name = 'Conta 4';

        accountList.add(acc4);

        system.debug('accountList '+accountList);

        system.debug('recuperando o nome da segunda posição da variável accountList:'+accountList[1].Name);

        system.debug('recuperando o phone posição 4:'+accountList[3].Phone);

        //Sets
        List<String> listNames2 = new List<String>{'João','Maria','José','João','Maria'};
        system.debug('listNames2 '+ listNames2);

        Set<String> setNames =  new Set<String>{'João','Maria','José','João','Maria'};
        system.debug('setNames '+setNames);

        //Maps
        Map<String,Integer> nomeIdadeMap = new Map<String,Integer>();
        nomeIdadeMap.put('Maria',30);
        nomeIdadeMap.put('João',19);
        nomeIdadeMap.put('José',63);
        system.debug('nomeIdadeMap '+nomeIdadeMap);

        system.debug('Idade do João: '+nomeIdadeMap.get('João'));

        nomeIdadeMap.put('André',99);
        if(nomeIdadeMap.containsKey('André')){
            system.debug('Idade do André: '+nomeIdadeMap.get('André'));
        }else{
            system.debug('Não existe a chave André na variável nomeIdadeMap');
        }

        //Recuprando as informações de uma conta pelo CNPJ
        Map<String,Account> contaPorCnpjMap = new Map<String,Account>();

        Account accEx1 = new Account();
        accEx1.Name = 'Conta 1 ';
        accEx1.Phone = '11111111';

        contaPorCnpjMap.put('15151516616', accEx1);
        contaPorCnpjMap.put('12334556660', new Account(Name = 'Conta 2', Phone = '11111111'));

        Account accEx3 = new Account(Name = 'Conta 3 ', Phone = '333333');

        Account accEx2 = contaPorCnpjMap.get('12334556660');
        accEx2.Phone = '2222222';
        accEx2.NumberofLocations__c = 20;
        system.debug('accEx2 '+accEx2);

        system.debug('contaPorCnpjMap '+contaPorCnpjMap);

        //Criar uma variável mapa, que recebe um nome de uma pessoa, e armazena a idade, criar 4 registros, e recuperar a idade do terceiro registro mostrando em um system.debug
        Map<String, Integer> nomesIdadesMap = new Map<String,Integer>{'Maria' => 30, 'José' => 50, 'Tatiane' => 20, 'André' => 35};
        system.debug('A idade da terceira pessoa é: ' + nomesIdadesMap.get('Tatiane'));

    }

}