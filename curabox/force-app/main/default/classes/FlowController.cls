/**
 * Wael Chorfan - @CloudMonsters 
 * Last Changed 18.05.2021
 * Flow Controller 
 *@description used by visual flows  
 **/


public class FlowController {
    
     /*Input */
    	@AuraEnabled 
        public List<Follow_up_Task__c> followUpTasks;
    	
        /*Output */
  /*Get Contacts by follow up tasks Ids 
  * returned contact fields :Id, LastName, Name, Salutation, Salutation_Text_Curabox__c, WorkAroundTemplatesAccountNumber__c 
  * where contact has Email
  */
    @AuraEnabled   
    	public List<Contact> contacts {
        get{
             
             Set<Id> followUpTasksIds=new Set<Id>();
         	 for(Follow_up_Task__c task:followUpTasks){followUpTasksIds.add(task.Id);}
               
        return [SELECT Id, LastName, Name, Salutation, Salutation_Text_Curabox__c, WorkAroundTemplatesAccountNumber__c, Email FROM Contact WHERE  Email != null 
               AND  Id IN  (select Contact__c from Follow_up_Task__c where id in :followUpTasksIds)
                limit 50000];
    	}
        set;
        }
	
   
}