public class FlowMapClass{
	@AuraEnabled
	public Map<Id, Account> accountsMap{
		get{
			if (accountsMap == null){
				system.debug('only one SOQL');
				accountsMap = new Map<Id, Account>([select Id, Name
				                                    from Account]);
			}
			return accountsMap;
		}

		set;
	}

	@AuraEnabled
	public String accountId;

	@AuraEnabled
	public Account account{
		get{
			return (Account)accountsMap.get(accountId);
		}

		set;
	}
}