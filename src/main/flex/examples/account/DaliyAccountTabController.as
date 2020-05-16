package examples.account
{
	import flash.events.MouseEvent;
	
	import mx.controls.Alert;
	import mx.core.IMXMLObject;
	
	public class DaliyAccountTabController implements IMXMLObject
	{
		private var view: DaliyAccountTab; // ビューオブジェクト
		
		public function DaliyAccountTabController()
		{
		}
		
		public function initialized(document: Object, id: String): void {
			view = document as DaliyAccountTab;
		}
		
		public function insertButtonClickHandler(event: MouseEvent): void {
			Alert.show("クリックされた.");
		}

	}
}