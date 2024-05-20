public class BatchOppTask implements Database.Batchable<sObject> {
    Integer numberOfTask = 0;

    public Database.QueryLocator start(Database.BatchableContext bc) {
        System.debug('Batch start method called');
        String query = 'SELECT Id, Name, AccountId, ContactId, OwnerId FROM Opportunity WHERE isClosed = True';
        return Database.getQueryLocator(query);
    }

    public void execute(Database.BatchableContext bc, List<Opportunity> ListOpp) {
        System.debug('Batch execute method called');
        List<Task> listTask = new List<Task>();
        try {
            for (Opportunity opp : listOpp) {
                Task newTask = new Task();
                newTask.Subject = opp.Name;
                newTask.WhatId = opp.Id;
                newTask.WhoId = opp.ContactId;
                newTask.Description = 'Let\'s contact them again';
                newTask.OwnerId = opp.OwnerId;
                listTask.add(newTask);
            }
           
            if (!listTask.isEmpty()) {
                insert listTask;
                numberOfTask += listTask.size();
                System.debug('Tasks created: ' + listTask.size());
                System.debug(listTask);
            } else {
                System.debug('No tasks to insert');
            }
            
        } catch (Exception e) {
            System.debug('Error: ' + e.getMessage());
        }
    }

    public void finish(Database.BatchableContext bc) {
        System.debug('Batch finish method called');
        System.debug(numberOfTask + ' tasks have been created');
    }
}