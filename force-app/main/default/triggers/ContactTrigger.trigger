trigger ContactTrigger on Contact (before insert, after insert) {
    if(trigger.isBefore){
       
    }
    if(trigger.isAfter){
        if(trigger.isInsert){
            ContactHandler ch = new ContactHandler();
            ch.CreateContact(Trigger.new);
        }
		
    }
}