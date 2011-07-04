package com.wheesper.view 
{
	import com.wheesper.controller.Config;
	import com.wheesper.model.Theme;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;
	import flash.filters.GlowFilter;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author David Guyon
	 */
	public class PictureView extends Sprite
	{
		private var _profileUrl: String;
		private var _profilePictureUrl: String;
		private var _loader: Loader;
		private var _theme: Theme;
		
		public function PictureView(p_profilePictureUrl:String,p_profileUrl:String)
		{
			_profilePictureUrl = p_profilePictureUrl;
			_profileUrl = p_profileUrl;
			
			_theme = Config.getInstance().theme;
			
			mouseChildren = false;
			buttonMode = true;
			
			_loader = new Loader();
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoaded);
			_loader.load(new URLRequest(_profilePictureUrl));
		}
		
		private function onLoaded(e:Event):void 
		{
			addEventListener(MouseEvent.CLICK, onClick);
			_loader.cacheAsBitmap = true;
			_loader.width = _loader.height = Config.getInstance().PICTURE_SIZE;
			
			var glow_filter : GlowFilter = new GlowFilter(_theme.border_color, 1, 2, 2, 128, 1, true);
			var shadow : DropShadowFilter = new DropShadowFilter(2, 45, 0x000000, 1, 5.0, 5.0, 0.5);
			filters = [glow_filter,shadow];
			
			addChild(_loader);
		}
		
		private function onClick(e:MouseEvent):void 
		{
			navigateToURL(new URLRequest(_profileUrl));
			
		}
		
	}
	
}