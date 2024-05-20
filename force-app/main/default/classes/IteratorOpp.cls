public class IteratorOpp implements Iterator<Opportunity>{
    
    private List<Opportunity> listOpp;
    private Integer index = 0;
    
    public IteratorOpp(List<Opportunity> listOpp){
        this.listOpp = listOpp;
    }
    
    public boolean hasNext(){
        return index < listOpp.size();
    }
    
    public Opportunity next(){
        if(!hasNext()){
            throw new System.NoSuchElementException('There is no more lemetns in this iterator');
        }
        else{
            return listOpp.get(index++);
        }
    }
}