package examples.account
{
	import examples.account.dto.GroupedAccount;
	
	import mx.collections.ArrayCollection;
	
	[Bindable]
	public class GroupedAccountTabModel
	{
		public var groupedAccountList: ArrayCollection;
		
		public function GroupedAccountTabModel()
		{
			var account1:GroupedAccount = new GroupedAccount();
			account1.firstTitleName = "大項目1";
			account1.secondTitleName = "中項目1";
			account1.groupPrice = 1000;
			var account2:GroupedAccount = new GroupedAccount();
			account2.firstTitleName = "大項目2";
			account2.secondTitleName = "中項目2";
			account2.groupPrice = 2000;
			var account3:GroupedAccount = new GroupedAccount();
			account3.firstTitleName = "大項目1";
			account3.secondTitleName = "中項目2";
			account3.groupPrice = 3000;
			
			groupedAccountList = new ArrayCollection([account1, account2, account3]);
		}

	}
}