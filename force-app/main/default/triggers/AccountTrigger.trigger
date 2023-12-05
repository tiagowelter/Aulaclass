trigger AccountTrigger on Account (before insert, after insert , before update, after update) {


    if(Trigger.isInsert && Trigger.isAfter){
        List<Opportunity> newOpps = new List<Opportunity>();

        for(Account acc : Trigger.new){
            Opportunity opp = new Opportunity();
            opp.Name = acc.Name + ' Opportunity';
            opp.CloseDate = Date.today().addMonths(6);
            opp.AccountId = acc.Id;
            opp.StageName = 'Prospecting';
            newOpps.add(opp);
        }

        insert newOpps;
    }

}