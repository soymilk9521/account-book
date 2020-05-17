package examples.account.dto
{
	[Bindable]
	public class GroupedAccount
	{
		public var firstTitleName: String;
		public var secondTitleName: String;
		public var groupPrice: Number;
		
		public function GroupedAccount()
		{
			
		}
		
		public function get titleName(): String {
			return this.firstTitleName + "-" + this.secondTitleName;
		}

	}
}