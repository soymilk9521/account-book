package examples.account
{
	import examples.account.dto.FirstTitle;
	import examples.account.dto.SecondTitle;
	import examples.account.events.RecordUpdateWindowEvent;
	
	import flash.events.MouseEvent;
	
	import mx.controls.Alert;
	import mx.core.IMXMLObject;
	import mx.events.CloseEvent;
	import mx.events.FlexEvent;
	import mx.events.ListEvent;
	import mx.managers.PopUpManager;
	import mx.validators.Validator;
	
	public class RecordUpdateWindowController implements IMXMLObject
	{
		private var view: RecordUpdateWindow;
		
		public function initialized(document: Object, id: String): void {
			view = document as RecordUpdateWindow;
			view.addEventListener(FlexEvent.CREATION_COMPLETE, creationCompleteHandler);	
		}
		
		public function RecordUpdateWindowController()
		{
		}
		
		public function creationCompleteHandler(event: FlexEvent): void {
			view.executeButton.addEventListener(MouseEvent.CLICK, executeButtonClickHandler);
			view.cancelButton.addEventListener(MouseEvent.CLICK, cancleButtonClickHandler);
			view.addEventListener(CloseEvent.CLOSE, closeButtonClickHandler);
			view.firstTitleCmb.addEventListener(ListEvent.CHANGE, firstTitleComboboxChangeHandler);
		} 
		
		public function firstTitleComboboxChangeHandler(event: ListEvent): void {
			if(view.firstTitleCmb.selectedItem != null){
				var firstTitleid: int = FirstTitle(view.firstTitleCmb.selectedItem).firstTitleId;
				view.model.secondTitleList.filterFunction = 
					function(item: Object): Boolean {
						return SecondTitle(item).firstTitleId = firstTitleid;
					}
			}else {
				view.model.secondTitleList.filterFunction = null;
			}
			view.model.secondTitleList.refresh();
		}
		
		public function executeButtonClickHandler(event: MouseEvent): void {
			var validationResults: Array = Validator.validateAll(view.validators);
			if(validationResults.length > 0) {
				return ;
			}
			var state: String = view.currentState;
			switch(state){
				case "Insert":
					Alert.show("この記録を追加してよろしいでしょうか？",
						"確認", Alert.OK | Alert.CANCEL, view, insertConfirmCallback);
					break;
				case "Update":
					Alert.show("この記録を訂正してよろしいでしょうか？",
						"確認", Alert.OK | Alert.CANCEL, view, updateConfirmCallback);
					break;
				case "Delete":
					Alert.show("この記録を削除してよろしいでしょうか？",
						"確認", Alert.OK | Alert.CANCEL, view, deleteConfirmCallback);
					break;
				default:
					throw new Error("currentState invalid: " + view.currentState);
			}
		}
		
		public function cancleButtonClickHandler(event: MouseEvent): void {
			PopUpManager.removePopUp(view);
		}
		
		public function closeButtonClickHandler(event: CloseEvent): void {
			PopUpManager.removePopUp(view);
		}
		
		private function insertConfirmCallback(event: CloseEvent): void {
			if(event.detail == Alert.OK) {
				doInsert();
			}
		}
		
		public function doInsert(): void {
			view.dispatchEvent(new RecordUpdateWindowEvent(RecordUpdateWindowEvent.UPDATE_COMPLETE));
			PopUpManager.removePopUp(view);
		}
		
		private function updateConfirmCallback(event: CloseEvent): void {
			if(event.detail == Alert.OK) {
				doUpdate();
			}
		}
		
		public function doUpdate(): void {
			view.dispatchEvent(new RecordUpdateWindowEvent(RecordUpdateWindowEvent.UPDATE_COMPLETE));
			PopUpManager.removePopUp(view);
		}
		
		private function deleteConfirmCallback(event: CloseEvent): void {
			if(event.detail == Alert.OK) {
				doDelete();
			}
		}
		
		public function doDelete(): void {
			view.dispatchEvent(new RecordUpdateWindowEvent(RecordUpdateWindowEvent.UPDATE_COMPLETE));
			PopUpManager.removePopUp(view);
		}

	}
}