package com.wheesper.view 
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author David Guyon
	 */
	public class Arrow extends Sprite
	{
		private var _loader: Loader;
		private var _query: String;
		
		public function Arrow(p_theme_name:String, p_direction:String) 
		{
			_query = 'http://wheesper.com/widget/assets/' + p_theme_name + '-' + p_direction + '-arrow.png';
			_loader = new Loader();
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoaded);
			_loader.load(new URLRequest(_query));
		}
		
		
		private function onLoaded(e:Event):void 
		{
			addChild(_loader);
		}
		
	}
	
}