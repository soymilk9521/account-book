package examples.account
{
	import examples.account.dto.Account;
	
	import mx.collections.ArrayCollection;
	
	[Bindable]
	public class DaliyAccountTabModel
	{
		public var accounts:ArrayCollection;
		
		public function DaliyAccountTabModel()
		{
			var account1:Account = new Account();
			account1.txdate = new Date("05/12/2020");
			account1.firstTitleName = "大項目1";
			account1.secondTitleName = "中項目1";
			account1.thirdTitleName = "小項目1";
			account1.price = 1000;
			var account2:Account = new Account();
			account2.txdate = new Date("05/16/2020");
			account2.firstTitleName = "大項目2";
			account2.secondTitleName = "中項目2";
			account2.thirdTitleName = "小項目2";
			account2.price = 2000;
			var account3:Account = new Account();
			account3.txdate = new Date("05/17/2020");
			account3.firstTitleName = "大項目3";
			account3.secondTitleName = "中項目3";
			account3.thirdTitleName = "小項目3";
			account3.price = 3000;
			
			
			accounts = new ArrayCollection([account1, account2, account3]);
		}

	}
}