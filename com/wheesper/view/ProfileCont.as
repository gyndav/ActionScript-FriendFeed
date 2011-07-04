package com.wheesper.view 
{
	import com.wheesper.controller.Config;
	import com.wheesper.model.FriendFeed;
	import com.wheesper.model.Theme;
	import flash.text.StyleSheet;
	import flash.text.TextFieldAutoSize;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.net.URLRequest;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author David Guyon
	 */
	public class ProfileCont extends Sprite
	{
		/*
		 * Graphic vars
		 */ 
		public var _name: TextField;
		public var _bg: Sprite;
		private var _service_cont: Sprite;
		private var _picture: PictureView;
		private var _styleSheet : StyleSheet;
		
		/*
		 * Data vars
		 */ 
		private var _user: FriendFeed;
		private var _theme: Theme;
		
		
		public function ProfileCont(p_user:FriendFeed,p_theme: Theme)
		{
			_user = p_user;
			_theme = p_theme;
			
			// StyleSheet
			_styleSheet = new StyleSheet();
			_styleSheet.parseCSS(_theme.css);
			
			// Picture
			_picture = new PictureView(_user.getProfile("picture"), _user.getProfile("url"));
			addChild(_picture);
			_picture.x = _picture.y = 6;
			
			// Name
			_name = new TextField();
			_name.styleSheet = _styleSheet;
			_name.autoSize = TextFieldAutoSize.LEFT;
			_name.htmlText = '<span class="name"><a href="' + _user.getProfile("url") + '">' + _user.getProfile("name") + '</a></span>';
			addChild(_name);
			_name.x = 60;
			_name.y = 1;
			
			// Services
			var services : Array  = _user.getServices();
			_service_cont = new Sprite();
			_service_cont.x = _name.x + 2;
			_service_cont.y = _name.height + _name.y;
			
			var num_service : int = 0;
			var num_per_line: int = 8;
			var pos_x: int = 0;
			var pos_y :int = 0;
			
			for (var i:int = 0; i < services.length; i++) 
			{
				if (i >= 16) break;
				
				var service : ServiceView = new ServiceView(services[i]);
				_service_cont.addChild(service);
				service.x = pos_x;
				service.y = pos_y;
				
				num_service ++;
				if (num_service < num_per_line)
				{
					pos_x += 16 + 3;
				}
				else
				{
					pos_x = 0;
					pos_y += 16 + 3;
					num_service = 0;
				}
				
			}
			
			addChild(_service_cont);
		}
		
	}
	
}