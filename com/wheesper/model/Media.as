package com.wheesper.model 
{
	
	/**
	 * ...
	 * @author David Guyon
	 */
	public class Media extends Object
	{
		public var title: String;
		public var player: String;
		public var link: String;
		public var thumbnailUrl: String;
		
		public function Media(p_media: Object) 
		{
			try
			{
				(p_media.title != null && p_media.title != "") ? title = p_media.title : title = "untitled";
				player = p_media.player;
				link = p_media.link;
				thumbnailUrl = p_media.thumbnails[0].url;				
			}
			catch (e:Error)
			{
				trace("Media.as => Media constructor failure");
				trace(e.message);
			}

		}
		
	}
	
}