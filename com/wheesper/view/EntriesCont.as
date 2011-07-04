package com.wheesper.view 
{
	import caurina.transitions.Tweener;
	import com.wheesper.controller.Config;
	import com.wheesper.model.FriendFeed;
	import flash.display.Sprite;
	import gs.TweenMax;
	
	/**
	 * ...
	 * @author David Guyon
	 */
	public class EntriesCont extends Sprite
	{
		private var _bg: Sprite;
		public var cont_height: int;
		private var _user: FriendFeed;
		
		public function EntriesCont(p_user:FriendFeed)
		{
			_user = p_user;
			_bg = new Sprite();
			
			var entries: Array = _user.getEntries();	
			var pos_y : int = 0;
			
			for (var i:int = 0; i < entries.length; i++)
			{
				var entry: EntryView = new EntryView(entries[i]);
				addChild(entry);
				entry.x = 5;
				entry.y = pos_y;
				pos_y += int(entry.height) + 10;
			}
			
			// Scroll
			cont_height = height;
		}
		
	}
	
}