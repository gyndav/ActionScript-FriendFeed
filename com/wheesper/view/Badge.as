package com.wheesper.view 
{
	import com.wheesper.controller.Config;
	import com.wheesper.model.FriendFeed;
	import com.wheesper.model.Theme;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import flash.net.URLRequest;
	
	
	/**
	 * ...
	 * @author David Guyon
	 */
	public class Badge extends Sprite
	{
		
		/*
		 * Display vars
		 */ 
		private var _badge_spr: Sprite;
		private var _badge_bg_spr : Sprite;
		private var _profile_cont: ProfileCont;
		private var _entries_cont: EntriesCont;
		private var _arrow_top: Arrow;
		private var _arrow_bottom: Arrow;
		
		/*
		 * Config vars
		 */
		private var _user:FriendFeed;
		private var _theme:Theme;
		
		/*
		 * Static
		 */
		private static var _instance : Badge = new Badge();
		
		/*
		 *	Public vars
		 */
		public var BADGE_WIDTH : int;
		public var BADGE_HEIGHT : int;
		
		
		/*
		 * Constructor
		 */ 		
		public function Badge()
		{
			if (_instance) throw new Error("Badge object already instanced: use getInstance().");
		}
		
		
		public function init(p_badge_spr:Sprite):void
		{
			_badge_spr = p_badge_spr;
			_badge_spr.addChild(this);
			
			var loader: Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onPatternLoaded);
			loader.load(new URLRequest("http://wheesper.com/widget/assets/bg-badge.jpg"));
			
			BADGE_WIDTH = stage.stageWidth;
			BADGE_HEIGHT = stage.stageHeight;
			
			Config.getInstance().addEventListener("DATA_SUCCESS", onDataReady);
		}
		
		
		/*
		 * Events handlers
		 */
		private function onDataReady(evt:Event):void
		{
			_user = Config.getInstance().user;
			_theme = Config.getInstance().theme;
			
			//_badge_bg_spr = new Sprite();
			_profile_cont = new ProfileCont(_user,_theme);
			_entries_cont = new EntriesCont(_user);
		
			if (_theme.name != "friendfeed")
			{
				/*var loader: Loader = new Loader();
				loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onPatternLoaded);
				loader.load(new URLRequest("http://wheesper.com/widget/assets/bg-badge.jpg"));*/
			}
			
			_badge_bg_spr.addEventListener(Event.ADDED_TO_STAGE, onBgAddedToStage);
			
			
			//_badge_spr.addChild(_badge_bg_spr);trace("badge spr added");
			//_badge_bg_spr.addChild(_profile_cont);trace("profile cont added");
			_profile_cont.x = _profile_cont.y = 0;
			//_badge_bg_spr.addChild(_entries_cont);trace("entries cont added");
			_entries_cont.y = 85;
			_entries_cont.scrollRect = new Rectangle(0, 0, BADGE_WIDTH, (BADGE_HEIGHT - _entries_cont.y - 30));
			
			// Arrow top
			_arrow_top = new Arrow(_theme.name, "top");
			_arrow_top.x = ((BADGE_WIDTH - 10) / 2) + (_arrow_top.width / 2);
			_arrow_top.y = 60;
			_arrow_top.addEventListener(MouseEvent.CLICK, onClickedTop);
			//addChild(_arrow_top);
			
			// Arrow bottom
			_arrow_bottom = new Arrow(_theme.name, "bottom");
			_arrow_bottom.x = ((BADGE_WIDTH - 10) / 2) + (_arrow_top.width / 2);
			_arrow_bottom.y = BADGE_HEIGHT - 25;
			_arrow_bottom.addEventListener(MouseEvent.CLICK, onClickedBottom);
			_arrow_bottom.addEventListener(MouseEvent.MOUSE_DOWN, onDownBottom);
			//addChild(_arrow_bottom);
			
			stage.addEventListener(MouseEvent.MOUSE_WHEEL, onWheeled);
		}
		
		
		private function onClickedTop(e:MouseEvent):void 
		{
			var scroll_rect : Rectangle = _entries_cont.scrollRect;
			if (scroll_rect.y <= 0)
			{
				return;
			}
			scroll_rect.y -= 30;
			_entries_cont.scrollRect = scroll_rect;
		}		
		
		private function onClickedBottom(e:MouseEvent):void 
		{
			var scroll_rect : Rectangle = _entries_cont.scrollRect;
			if (scroll_rect.y > (_entries_cont.cont_height - scroll_rect.height))
			{
				return;
			}
			scroll_rect.y += 30;
			_entries_cont.scrollRect = scroll_rect;
		}
		
		
		private function onDownBottom(e:MouseEvent):void 
		{
			var scroll_rect : Rectangle = _entries_cont.scrollRect;
			if (scroll_rect.y > (_entries_cont.cont_height - scroll_rect.height))
			{
				return;
			}
			scroll_rect.y += 30;
			_entries_cont.scrollRect = scroll_rect;
		}	
		
		
		private function onPatternLoaded(e:Event):void 
		{
			var loader : Loader = e.currentTarget.loader;
			var bitmap_data : BitmapData = Bitmap(loader.content).bitmapData;
			
			/*_badge_spr.graphics.beginBitmapFill(bitmap_data);
			_badge_spr.graphics.drawRect(0, 0, BADGE_WIDTH, BADGE_HEIGHT);
			_badge_spr.graphics.endFill();*/
			_badge_bg_spr = new Sprite();
			_badge_bg_spr.graphics.beginBitmapFill(bitmap_data);
			_badge_bg_spr.graphics.drawRect(0, 0, BADGE_WIDTH, BADGE_HEIGHT);
			_badge_bg_spr.graphics.endFill();
			
			addChild(_badge_bg_spr);
			trace("pattern added");
			
		}
		
		
		
		public function onBgAddedToStage(e:Event):void
		{
			trace("bg added to stage");
		}
		
		private function onWheeled(e:MouseEvent):void 
		{
			var scroll_rect : Rectangle = _entries_cont.scrollRect;
			
			if (e.delta > 0 && scroll_rect.y < 0)
			{
				return;
			}
			if (e.delta < 0 && scroll_rect.y > (_entries_cont.cont_height - scroll_rect.height))
			{
				return;
			}
			
			scroll_rect.y -= (e.delta * 3);
			_entries_cont.scrollRect = scroll_rect;
		}
		
		
		/*
		 * Public getter methods
		 */
		public static function getInstance(): Badge
		{
			return _instance;
		}		
		
	}
	
}