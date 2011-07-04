package com.wheesper.view 
{
	import com.wheesper.controller.Config;
	import com.wheesper.model.Media;
	import com.wheesper.model.Theme;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.GlowFilter;
	import flash.geom.Rectangle;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author David Guyon
	 */
	public class MediaView extends Sprite
	{
		private var _media: Media;
		private var _loader : Loader;
		private var _theme :Theme;
		
		public function MediaView(p_media:Media) 
		{
			_media = p_media;
			_theme = Config.getInstance().theme;
			
			mouseChildren = false;
			buttonMode = true;
			
			_loader = new Loader();
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoaded);
			_loader.load(new URLRequest(_media.thumbnailUrl));
		}
		
		private function onLoaded(evt:Event):void 
		{
			addEventListener(MouseEvent.CLICK, onClick);
			// Resize
			_loader.height = Config.getInstance().MEDIA_SIZE;
			_loader.scaleX = _loader.scaleY;
			scrollRect = new Rectangle(0, 0, _loader.height, _loader.height);
			
			var glow_filter : GlowFilter = new GlowFilter(_theme.border_color, 1, 2, 2, 255, 1, true);
			filters = [glow_filter];
			
			addChild(_loader);
		}
		
		private function onClick(evt:Event):void 
		{
			navigateToURL(new URLRequest(_media.link));
		}
		
	}
	
}