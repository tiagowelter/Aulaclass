public with sharing class ContactsFromAccount {
    private List<Contact> contacts;
    public ContactsFromAccount(String idAccount) {
        contacts = new List<Contact>(); //aqui nós instânciamos a lista
        contacts = [SELECT Id, FirstName, LastName, Email FROM Contact WHERE AccountId = :idAccount]; //Aqui preenchemos a lista
        system.debug('contacts '+contacts);
    }
}