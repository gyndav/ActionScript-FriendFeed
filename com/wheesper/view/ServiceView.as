package com.wheesper.view 
{
	import com.wheesper.controller.Config;
	import com.wheesper.model.Service;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author David Guyon
	 */
	public class ServiceView extends Sprite
	{
		private var _service: Service;
		private var _loader: Loader = new Loader();
		
		public function ServiceView(p_service:Service)
		{
			_service = p_service;
			
			mouseChildren = false;
			buttonMode = true;
			
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoaded);
			_loader.load(new URLRequest(_service.iconUrl));
		}
		
		private function onLoaded(e:Event):void 
		{
			addEventListener(MouseEvent.CLICK, onClick);
			_loader.cacheAsBitmap = true;
			_loader.width = _loader.height = Config.getInstance().SERVICE_SIZE;
			addChild(_loader);
		}
		
		private function onClick(e:MouseEvent):void 
		{
			navigateToURL(new URLRequest(_service.profileUrl));
			
		}
		
	}
	
}