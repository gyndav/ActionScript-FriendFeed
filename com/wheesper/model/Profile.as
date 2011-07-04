package com.wheesper.model 
{
	
	/**
	 * ...
	 * @author David Guyon
	 */
	public class Profile extends Object
	{
		public var name: String;
		public var nickname:String;
		public var profileUrl:String;
		public var profilePictureUrl:String;
		public var services:Array = new Array();
		
		public function Profile(p_profile:Object)
		{
			if (p_profile.status == "public")
			{
				//trace("public profile");
				name = p_profile.name;
				nickname = p_profile.nickname;
				profileUrl = p_profile.profileUrl;
				profilePictureUrl = 'http://friendfeed.com/' + p_profile.nickname + '/picture?size=medium';
				
				for (var i:int = 0; i < p_profile.services.length; i++)
				{
					services.push(new Service(p_profile.services[i]));
				}
			}
			else
			{
				trace("private profile");
			}	
		}
		
		
		public function getProfile(p_key:String): *
		{
			switch(p_key)
			{
				case "name":
					return name;
					break;
				case "nickname":
					return nickname;
					break;
				case "url":
					return profileUrl;
					break;
				case "picture":
					return profilePictureUrl;
					break;
				default:
					return "Wrong key choosen";
			}
		}
		
		
		public function getServices():Array
		{
			return services;
		}
		
	}
	
}