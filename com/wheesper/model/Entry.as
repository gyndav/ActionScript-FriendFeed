package com.wheesper.model 
{
	import libraries.PrettyDate;
	import libraries.Linkify;
	
	
	/**
	 * ...
	 * @author David Guyon
	 */
	public class Entry extends Object
	{
		public var id:String;
		public var title:String;
		public var link:String;
		//public var published: String;
		public var published:PrettyDate;
		public var service:Service;
		public var medias : Array = new Array();
		
		public function Entry(p_entry:Object)
		{
			try
			{
				id = p_entry.id;
				link = p_entry.link;
				title = p_entry.title;
				//published = p_entry.published;
				published = new PrettyDate(p_entry.published);
				service = new Service(p_entry.service);			
				for (var i:int = 0; i < p_entry.media.length; i++)
				{
					medias.push(new Media(p_entry.media[i]));
				}				
			}
			catch(e:Error)
			{
				trace("Entry.as => Entry constructor failure");
				trace(e.message);
			}
		}
		
		public function hasMedia(): Boolean
		{
			return medias.length == 0 ? false : true;
		}
		
	}
	
}