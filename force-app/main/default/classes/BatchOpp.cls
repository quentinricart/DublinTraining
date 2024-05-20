public class BatchOpp implements Database.Batchable<Opportunity>{
	Integer recordProcessed = 0;
    Integer recFailed = 0;
    public Iterable<Opportunity> start(Database.BatchableContext bc){
		return new IterableOpp();
    }
    
    public void execute(database.BatchableContext bc, List<Opportunity> listOpp){
        try{
            for(Opportunity opp: listOpp){
                opp.Description = 'This Opportunity Current Probability is ' + opp.Probability + ' %';
            }
            update listOpp;
        recordProcessed = listOpp.size();
        }        
        catch(Exception e){
            System.debug('An error happen during the run of this batchable class: \n' + e.getMessage());
            recFailed = listOpp.size();
        }
        
    }
    
    public void finish(Database.BatchableContext bc){
        System.debug('Batch processed with ' + recordProcessed + ' record processed and ' + recFailed + ' records failed');
    }
}