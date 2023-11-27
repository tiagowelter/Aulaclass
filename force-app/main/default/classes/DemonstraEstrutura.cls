public with sharing class DemonstraEstrutura {

    //CONSTANTES
    private static final Double TAXA_IFO = 0.5;
    private static Double TAXA_IFO_VARIANTE = 0.5;
    eNum DiaDaSemana{
        DOMINGO, SEGUNDA, SABADO
    }

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

        //ENUM - enumeração
        DiaDaSemana hoje = DiaDaSemana.SABADO;

    }

    public static void condicionais(){
        //IF == Se
        Integer num = 5;

        if(num > 2){
            system.debug('É MAIOR DO QUE 2');
        }

        //ELSE IF + ELSE
        Integer idade = 25;

        //se a idade for menor que 18 escreve que é criança
        // se a idade for maior ou IGUAL que 18 e menor do que 30 escrever você é jovem
        // senão escrever você é adulto
        //ESTRUTURA : IF + ELSE IF + ELSE
        if(idade < 18){
            system.debug('você é uma criança');
        }else if(idade >= 18 && idade < 30){
            system.debug('você é jovem');
        }else{
            if(idade > 60){
                system.debug('você é idoso');
            }else{
                system.debug('você é adulto');
            }
        }

        //TERNARIO DA CONDICAO ACIMA
        String textoIdade = idade < 18 ? 'você é uma criança' : (idade >= 18 && idade < 30 ? 'você é jovem' : (idade > 60 ? 'você é idoso' :'você é adulto' ));
        system.debug(textoIdade);

        //SWITCH
        //0 = Domingo, 1 = Segunda, 2 =Terça, 3 = Quarta .... 6 = Sabado
        Integer dayWeek = 3;

        switch on dayWeek{
            when 0{
                system.debug('Domingo');
            }
            when 1{
                system.debug('Segunda');
            }
            when 2{
                system.debug('Terça');
            }
            when else{
                system.debug('Dia inválido');
            }
        }

        //IF TERNÁRIO
        Integer numVal  = 30;
        String result = numVal > 5 ? 'Num é maior do que 5' : 'Num é menor ou igual a 5';
    }

    //LOOPS
    public static void loops(){
        //FOR
        for(Integer i = 0; i < 10; i++){
            system.debug('EXECUTOU O FOR COM O NUMERO '+i);
        }

        //WHILE
        Integer count = 1;
        while(count <= 10){
            system.debug('Count é : '+count);
            count++;
        }

        //DO-WHILE
        Integer counter = 0;
        do{
            system.debug('O valor de COUNTER é: '+counter);
            counter++;
        }while (counter < 5);

        //FOREACH
        for(Account acc : [SELECT Name FROM Account]){
            system.debug('O nome da conta é :'+acc.Name);
        }

        List<Integer> integerList = new List<Integer>{1,2,3,4,5,6,7,8,9};
        for(Integer num : integerList){
            system.debug('O valor de NUM é '+num);
        }
    }

    //OPERADORES
    public static void operadores(){
        //ARITMETICOS + - * /
        Integer exSoma = 1 + 2;
        Integer exSub = 1 - 2;
        Integer exMult = exSoma * exSub;
        Integer exDiv = 10/5;

        //ATRIBUIÇÃO =
        Integer atribuiNum = 10;

        //COMPARAÇÃO == != < > <= >=
        if(exSoma == 3){

        }
        if(exSoma != 1){

        }
        if(exSoma  > 2){

        }

        //LÓGICOS && || !
        if(exSoma > 2 && exSoma < 4){

        }
        if(exSoma > 2 || exSoma < 4){

        }
        if( !(exSoma == 3) ){

        }

        //CONDICIONAIS ? :
        String ternarioEx = exSoma > 3 ? 'É maior do que 3' : 'É menor ou igual à 3';
    }

    //OPERADORES DE ATRIBUIÇÃO
    // =
    // +=
    // -=
    // *=
    // /=
    // %= pega o resto de um número de uma divisão

    //FUNÇÕES E MÉTODOS

    //função para calcular a média de uma lista de números
    //List<Double> doubleList = new List<Double>{10,20,5,50}
    public static Double calcAvarege(List<Double> numbers){
        Double sum = 0;
        for(Double num : numbers){
            sum += num;
        }
        return sum / numbers.size();
    }

    /*
    modificador_de_acesso(public|private) tipo_retorno nome_da_funcao(parametros){
            //logica da função
            return igual_ao_tipo_retorno;
    }
    */

    //DESAFIO : fazer uma função, que recebe dois inteiros e retorna a soma deles.

    //Exemplo retorna uma lista com todos os contatos
    public static List<Contact> getContacts(String name){
        List<Contact> contactList = [SELECT Id, FirstName, LastName, Email FROM Contact WHERE FirstName = :name];
        return contactList;
    }

    public static void adjustPhone(){
        List<Contact> contactList = [SELECT Id, Email, Phone FROM Contact];

        for(Contact cnt : contactList){
            if(cnt.Phone == null){
                system.debug('O contato está com o telefone vazio: '+cnt.Id);
            }
        }
    }

    //Exemplo DML
    public static void exampleDml(){
        List<Account> accList = [SELECT Id FROM Account WHERE Name = 'Teste 1'];
        //Inserindo dados
        Account acc = new Account();
        acc.Name = 'Teste 1';
        if(accList.size() == 0){
            insert acc;
        }

        //Atualizar dados
        Account accUpd = [SELECT Id, Name FROM Account WHERE Name = 'Teste 1' LIMIT 1];
        accUpd.Name = 'Teste 2';
        update accUpd;

        //Exclui os registros
        delete accList;
    }

    //Exemplo DML em massa
    public static void exampleDmlMass(){
        List<Account> accountToInsert = new List<Account>();

        Account acc1 = new Account();
        acc1.Name = 'Exemplo em massa 1';
        acc1.CustomerPriority__c = 'Exemplo em massa 1';
        accountToInsert.add(acc1);

        Account acc2 = new Account();
        acc2.Name = 'Exemplo em massa 2';
        accountToInsert.add(acc2);

        Account acc3 = new Account();
        acc3.Name = 'Exemplo em massa 3';
        accountToInsert.add(acc3);

        Account acc4 = new Account();
        acc4.Name = 'Exemplo em massa 4';
        accountToInsert.add(acc4);

        insert accountToInsert;
    }
}