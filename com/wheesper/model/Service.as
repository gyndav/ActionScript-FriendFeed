package com.wheesper.model 
{
	
	/**
	 * ...
	 * @author David Guyon
	 */
	public class Service extends Object
	{
		public var id : String;
		public var name : String;
		public var iconUrl : String;
		public var profileUrl : String;
		
		public function Service(p_service:Object) 
		{
			try
			{
				id = p_service.id;
				name = p_service.name;
				iconUrl = p_service.iconUrl;
				profileUrl = p_service.profileUrl;
			}
			catch (e:Error)
			{
				trace("Service.as => Service constructor failure");
				trace(e.message);
			}

		}
		
	}
	
}