public class IterableOpp implements Iterable<Opportunity>{
    public Iterator<Opportunity> iterator(){
		List<Opportunity> listOpp = [SELECT Id, Name, Description, Probability FROM Opportunity WHERE isClosed=False AND Probability > 30 AND CloseDate = THIS_MONTH];
        return new IteratorOpp(listOpp);
    }
}