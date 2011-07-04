package com.wheesper.controller
{	
	import com.wheesper.model.FriendFeed;
	import com.wheesper.model.Theme;
	import amfphp.AmfPhp;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.display.Sprite;
	
	
	/**
	 * @author David Guyon
	 */
	public class Config extends EventDispatcher
	{
		/*
		 * Badge & FriendFeed config vars
		 */
		// User customs
		private var _nickname:String;
		private var _num:String;
		private var _lang:String;
		private var _theme:String;
		
		// Constants, API, FriendFeed object
		private static var _instance: Config = new Config();
		private var _user_profile_json: String;
		private var _user_feed_json: String;
		private var _count:int = 0;
		
		// Available vars
		public var user:FriendFeed;
		public var theme : Theme;
		public const PICTURE_SIZE: int = 50;
		public const MEDIA_SIZE:int = 75;
		public const SERVICE_SIZE: int = 16;
		public const MIN_BADGE_HEIGHT : int = 215;
		public const MIN_BADGE_WIDTH : int = 215;
		public var width: int;
		
		
		/*
		 * Constructor
		 */ 
		public function Config()
		{
			if (_instance) throw new Error("Config object already instanced: use getInstance()");
		}
		
		
		public function init(p_flashvars: * = null):void
		{
			var flash_vars:Object = p_flashvars;
			var friendfeed_team : Array = new Array("bret", "jim", "paul", "sanjeev");
			var random: int = Math.random() * 4;
			
			_nickname = (flash_vars.nickname == undefined) ? friendfeed_team[random] : flash_vars.nickname;
			_num = (flash_vars.num == undefined) ? '5' : flash_vars.num;
			_lang = (flash_vars.lang == undefined) ? 'en-EN' : flash_vars.lang;
			_theme = (flash_vars.theme == undefined) ? 'blue' : flash_vars.theme;
			
			fetchUserFeed();
			getUserProfile();
		}
		
		
		/*
		 * FriendFeed API methods
		 */ 
		private function fetchUserFeed():void
		{
			var amf:AmfPhp = new AmfPhp('FriendFeed.fetch_user_feed',_nickname,_num);
			
			amf.addEventListener("AMF_RESULT",onUserFeedLoad);
		}
		
		
		private function getUserProfile():void
		{
			var amf:AmfPhp = new AmfPhp('FriendFeed.get_user_profile',_nickname);
			
			amf.addEventListener("AMF_RESULT",onUserProfileLoad);
		}
		
		
		/*
		 * Events handlers
		 */	
		private function onUserFeedLoad(evt:Event):void
		{
			var amf:AmfPhp = AmfPhp(evt.currentTarget);
			_user_feed_json = amf.result;
			
			try
			{
				isDataReady();
			}
			catch(evt:Error)
			{
				trace(evt.toString());
			}
		}
		
		
		private function onUserProfileLoad(evt:Event):void
		{
			var amf:AmfPhp = AmfPhp(evt.currentTarget);
			_user_profile_json = amf.result;
			
			try
			{
				isDataReady();
			}
			catch(evt:Error)
			{
				trace(evt.toString());
			}
		}
				
		
		private function isDataReady():void
		{
			_count++;
			
			if (_count == 2)
			{
				user = new FriendFeed(_user_feed_json, _user_profile_json);
				theme = new Theme(_theme);
				dispatchEvent(new Event("DATA_SUCCESS"));
			}
		}
		
		
		/*
		 * Public getter methods
		 */
		public static function getInstance(): Config
		{
			return _instance;
		}
	}
	
}