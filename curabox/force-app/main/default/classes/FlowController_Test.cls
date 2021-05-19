@isTest

public class FlowController_Test {
   
    static testMethod void test_getContactsByFollowUpTasks(){
        //create contact
        Contact contact= new Contact(Lastname='test',Email='test@email.com');
        insert contact;
        //create follow up task 
        List<Follow_up_Task__c> tasks= new List<Follow_up_Task__c>();
        tasks.add(  new Follow_up_Task__c(Subject__c='Lieferung angehalten', Due_Date__c=System.now(),contact__c=contact.Id) );
        insert tasks;
        
        
		FlowController flowController= new FlowController();
        flowController.followUpTasks=tasks;
        System.assertEquals(flowController.contacts==null,false);
    }
}