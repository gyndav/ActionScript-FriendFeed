package com.wheesper.model
{
	import com.wheesper.controller.Config;
	import com.adobe.serialization.json.JSON;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author David Guyon
	 */
	public class FriendFeed extends Object
	{
		/*
		 * User vars
		 */		
		private var _entries : Entries;
		private var _profile : Profile;
		
		
		public function FriendFeed(p_user_feed_json:String, p_user_profile_json:String)
		{
			var user_feed_parsed:Object;
			var user_profile_parsed:Object;
			
			try
			{
				user_feed_parsed = JSON.decode(p_user_feed_json);
				_entries = new Entries(user_feed_parsed.entries);
				
				//trace("FriendFeed.as => JSON parse user feed success");
				
				user_profile_parsed = JSON.decode(p_user_profile_json);
				_profile = new Profile(user_profile_parsed);
				
				//trace("FriendFeed.as => JSON parse user profile success");
			}
			catch(e:Error)
			{
				trace("FriendFeed.as => JSON parse failure");
				//trace(e.message);
			}
			return;
		}
		
		
		/*
		 * Public getter methods
		 */
		public function getEntries() : Array
		{
			return _entries.getEntries();
		}
		
		
		public function getProfile(p_key:String) : *
		{
			return _profile.getProfile(p_key);
		}
		
		
		public function getServices():Array
		{
			return _profile.getServices();
		}
		
	}
	
}