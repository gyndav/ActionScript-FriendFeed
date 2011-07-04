package com.wheesper.model 
{
	
	/**
	 * ...
	 * @author David Guyon
	 */
	public class Entries extends Object
	{
		private var _entries: Array = new Array();
		
		public function Entries(p_entries:Array) 
		{
			var count:int = 0;
			
			while (count < p_entries.length)
			{
				_entries.push(new Entry(p_entries[count]));
				count++;
			}
			
		}
		
		
		public function getEntries() : Array
		{
			return _entries;
		}
		
	}
	
}