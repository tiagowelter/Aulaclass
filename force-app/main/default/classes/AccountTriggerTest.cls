@isTest
public with sharing class AccountTriggerTest {
    @isTest
    static void triggerTest() {
        Account acc =  new Account();
        acc.Name = 'Test';
        acc.Phone = '99999';

        Test.startTest();
        insert acc;
        Test.stopTest();

        List<Opportunity> oppList = new List<Opportunity>([SELECT Id FROM Opportunity WHERE AccountId = :acc.Id]);

        System.assertEquals(1, oppList.size());
    }
}