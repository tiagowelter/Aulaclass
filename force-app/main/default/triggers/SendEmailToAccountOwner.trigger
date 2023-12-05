trigger SendEmailToAccountOwner on Opportunity (after insert) {
    List<Id> accountIds = new List<Id>();
    for (Opportunity opp : Trigger.new) {
        accountIds.add(opp.AccountId);
    }

    List<Id> ownersIds = new List<Id>();
    List<Account> accounts = [SELECT Id, OwnerId FROM Account WHERE Id IN :accountIds];
    Map<Id, Id> accountOwnerMap = new Map<Id, Id>();
    for (Account acc : accounts) {
        accountOwnerMap.put(acc.Id, acc.OwnerId);
        ownersIds.add(acc.OwnerId);
    }

    List<User> users = [SELECT Id, Email FROM User WHERE Id IN :ownersIds];
    Map<Id, Id> userMap = new Map<Id, Id>();
    for (User acc : users) {
        userMap.put(acc.Id, acc.Email);
    }

    List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
    for (Opportunity opp : Trigger.new) {
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        String idOwner = accountOwnerMap.get(opp.AccountId);
        String email = userMap.get(idOwner);
        email.setToAddresses(new String[] {
            email
        });
        email.setSubject('New Opportunity Added');
        email.setPlainTextBody('A new opportunity has been added to your account ' + opp.Account.Name);
        emails.add(email);
    }

    Messaging.sendEmail(emails);
}