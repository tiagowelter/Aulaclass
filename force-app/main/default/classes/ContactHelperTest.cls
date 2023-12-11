@isTest
public class ContactHelperTest {

    @TestSetup
    static void makeData(){
        Contact ctt = new Contact();
        ctt.LastName = 'Test';
        insert ctt;
    }

    @isTest
    static void testUpdateContact() {
        Contact ctt = [SELECT Email FROM Contact WHERE LastName = 'Test' LIMIT 1];

        String email = 'test@test.com';

        Test.startTest();
        ContactHelper.updateContactEmail(ctt.Id, email);
        Test.stopTest();

        Contact ctt2 = [SELECT Email FROM Contact WHERE Id = :ctt.Id LIMIT 1];
        System.assertEquals(email, ctt2.Email);
    }

    @isTest
    static void testUpdateContactError() {
        String email = 'test@test.com';

        Test.startTest();
        ContactHelper.updateContactEmail(null, email);
        Test.stopTest();
    }

    @isTest
    static void testUpdateContactErrorTry() {
        String email = 'test@test.com';

        Test.startTest();
        ContactHelper.updateContactEmail('006Hp000014WBblIAG', email);
        Test.stopTest();
    }
}