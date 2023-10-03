public with sharing class AccountsWithContactsExerciseV2 {
	public Map<Id, List<Contact>> accountsWithContactsMap {get; set;}
	public Map<Id, Account> accountsWithoutContactsMap {get; set;}
	public List<Account> accounts = [SELECT Id, Name FROM Account];

	public AccountsWithContactsExerciseV2() {
		accountsWithContactsMap = new Map<Id, List<Contact>>();
		accountsWithoutContactsMap = new Map<Id, Account>();
		List<Contact> contacts = new List<Contact>();
	
		for (Contact cnt : [SELECT Id, FirstName, LastName, AccountId FROM Contact WHERE AccountId = :accounts] ) {
			List<Contact> contactTemp = new List<Contact>();
			if(accountsWithContactsMap.containsKey(cnt.AccountId)){
				contactTemp = accountsWithContactsMap.get(cnt.AccountId);
				contactTemp.add(cnt);
				accountsWithContactsMap.put(cnt.AccountId, contactTemp);
			}else{
				contactTemp.add(cnt);
				accountsWithContactsMap.put(cnt.AccountId, contactTemp);
			}
		}
	
		for(Account acc : accounts) {
			if (!accountsWithContactsMap.containsKey(acc.Id)) {
				accountsWithoutContactsMap.put(acc.Id, acc);
			}
		}
	}

	public void debugContactsForAccounts() {
		for (Id accId : accountsWithContactsMap.keySet()) {
			Account acc = accountsWithoutContactsMap.get(accId);
			for(Contact con : accountsWithContactsMap.get(accId)){
				System.debug('Account ' + acc.Name + ' has the following contact: ' + con.FirstName + ' ' + con.LastName);
			}
		}
	}
}