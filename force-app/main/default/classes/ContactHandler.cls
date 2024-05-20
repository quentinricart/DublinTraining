public class ContactHandler {
    public void CreateContact(List<Contact> listContact){
        List<Case> listCase = new List<Case>();
        for(Contact c: listContact){
            Case newCase = new Case();
            newCase.Description = c.FirstName + ' ' + c.LastName;
            newCase.OwnerId = c.OwnerId;
            newCase.contactId = c.Id;
            listCase.add(newCase);
        }
        try{
        	insert listCase;
        }
        catch(Exception e){
            System.debug(e.getMessage());
		}
    }
}