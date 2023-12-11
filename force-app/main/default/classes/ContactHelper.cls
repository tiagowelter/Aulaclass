public with sharing class ContactHelper {
    public static void updateContactEmail(Id contactId, String email) {
        try{
            if(contactId != null && email != null){
                Contact cntt = [SELECT Id, Email FROM Contact WHERE Id = :contactId LIMIT 1];
                cntt.Email = email;
                update cntt;
            }
        }catch(Exception error){
            system.debug('error '+error);
        }
    }
}