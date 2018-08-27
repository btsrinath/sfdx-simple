public with sharing class SearchContactController {
    /**
     * An empty constructor for the testing
     */
    public SearchContactController() {}
    
    /**
     * Global variable
     */
     private List<Contact> CntList = null;
     public String lastName{get; set;}
     public String firstName{get; set;}

    public Pagereference searchContact()
    {
        Pagereference pg = null;
        if(lastName != null)
        {   
            // Query the object
            Contact theContact = [SELECT ID FROM Contact WHERE LastName = :lastName LIMIT 1];
            pg = new ApexPages.StandardController(theContact).view();
            pg.setRedirect(true);
        }
        return pg;
    }

    public List<Contact> getContacts()
    {
       if ( CntList == null )
        {
            CntList = [select id, Name, FirstName, LastName from Contact limit 10];
        }
        return CntList;
    }

    /*
    ApexPages.Message msg = new ApexPages.Message(Apexpages.Severity.ERROR, 'No contact found with last name: ' + lastName);
    ApexPages.addMessage(msg); 
    */
}