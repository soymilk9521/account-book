package examples.account.formatters
{
	import mx.controls.dataGridClasses.DataGridColumn;
	import mx.formatters.DateFormatter;
	
	public class DataColumnFormatter
	{
		private var dateFormatter: DateFormatter;
		
		public function DataColumnFormatter()
		{
			dateFormatter = new DateFormatter();
			dateFormatter.formatString = "YYYY/MM/DD(EEE)";
		}
		
		public function format(item: Object, column:DataGridColumn):String {
			return dateFormatter.format(item[column.dataField]);
		}

	}
}