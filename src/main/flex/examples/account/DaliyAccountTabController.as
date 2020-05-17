package examples.account
{
	import examples.account.dto.Account;
	import examples.account.events.RecordUpdateWindowEvent;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.core.IMXMLObject;
	import mx.events.FlexEvent;
	import mx.events.ListEvent;
	import mx.managers.PopUpManager;
	
	public class DaliyAccountTabController implements IMXMLObject
	{
		private var view: DaliyAccountTab; // ビューオブジェクト
		
		public function DaliyAccountTabController()
		{
		}
		
		public function initialized(document: Object, id: String): void {
			view = document as DaliyAccountTab;
			// コンポーネントは未だ初期化してないので、エラーが発生する
			// view.insertButton.addEventListener(MouseEvent.CLICK, insertButtonClickHandler); 
			view.addEventListener(FlexEvent.CREATION_COMPLETE, creationCompleteHandler);
		}
		
		public function creationCompleteHandler(event: FlexEvent): void {
			view.accountGrid.addEventListener(ListEvent.CHANGE, accountGridChangeHandler);
			view.insertButton.addEventListener(MouseEvent.CLICK, insertButtonClickHandler);
			view.updateButton.addEventListener(MouseEvent.CLICK, updateButtonClickHandler);
			view.deleteButton.addEventListener(MouseEvent.CLICK, deleteButtonClickHandler);
		}
		
		public function accountGridChangeHandler(event: ListEvent): void {
			if(view.accountGrid.selectedItem == null) {
				view.currentState = "";
			}else {
				view.currentState = "Selected";
			}
		}
		
		public function insertButtonClickHandler(event: MouseEvent): void {
			// Alert.show("追加ボタンがクリックされた.");
			var insertWindow: RecordUpdateWindow = 
				PopUpManager.createPopUp(view, RecordUpdateWindow, true) as RecordUpdateWindow;
			insertWindow.currentState = "Insert";
			PopUpManager.centerPopUp(insertWindow);
			
			// ポップアップウィンドウへのイベントを追加する
			insertWindow.addEventListener(RecordUpdateWindowEvent.UPDATE_COMPLETE, 
				recordUpdateWindowCompleteHanler);
		}
		
		public function updateButtonClickHandler(event: MouseEvent): void {
			// Alert.show("更新ボタンがクリックされた.");
			var updateWindow: RecordUpdateWindow = 
				PopUpManager.createPopUp(view, RecordUpdateWindow, true) as RecordUpdateWindow;
			updateWindow.currentState = "Update";
			var account: Account = Account(view.accountGrid.selectedItem);
			updateWindow.model.account = account;
			PopUpManager.centerPopUp(updateWindow);
			
			// ポップアップウィンドウへのイベントを追加する
			updateWindow.addEventListener(RecordUpdateWindowEvent.UPDATE_COMPLETE, 
				recordUpdateWindowCompleteHanler);
		}
		
		public function deleteButtonClickHandler(event: MouseEvent): void {
			// Alert.show("削除ボタンがクリックされた.");
			var deleteWindow: RecordUpdateWindow = 
				PopUpManager.createPopUp(view, RecordUpdateWindow, true) as RecordUpdateWindow;
			deleteWindow.currentState = "Delete";
			var account: Account = Account(view.accountGrid.selectedItem);
			deleteWindow.model.account = account;
			PopUpManager.centerPopUp(deleteWindow);
			
			// ポップアップウィンドウへのイベントを追加する
			deleteWindow.addEventListener(RecordUpdateWindowEvent.UPDATE_COMPLETE, 
				recordUpdateWindowCompleteHanler);
		}
		
		public function recordUpdateWindowCompleteHanler(event:Event): void {
			
		}
		
		

	}
}