package com.wheesper.model 
{
	
	/**
	 * ...
	 * @author David Guyon
	 */
	public class Theme extends Object
	{
		public var name: String;
		public var bg_color: Number;
		public var border_color: Number;
		public var css: String;
		//public var cssUrl: String;
		
		public function Theme(p_theme: String) 
		{
			name = p_theme;
			border_color = 0xd5d5d5;
			// border : f0f0f0  start : ffffff end: eeeeee 
			
			switch(p_theme)
			{
				case("friendfeed"):
					bg_color = 0xdeedff;
					css = '.name { font-family: Trebuchet MS; font-size: 13px; color: #6292ce; font-weight: bold; } \t';
					css += '.service-name { font-family: Trebuchet MS; font-size: 11px; color:#303030; font-weight: bold; } \t';
					css += '.published { font-family: Trebuchet MS; font-size: 10px; color: #a1a1a1; font-weight:normal; } \t';
					css += 'a:hover { text-decoration: underline; } \t';
					css += 'p { font-family: Trebuchet MS; font-size: 12px; color: #303030; font-weight: normal; }';
					break;
				case("blue"):
					bg_color = 0xf9f9f9;
					css = '.name { font-family: Trebuchet MS; font-size: 13px; color: #05afd4; font-weight: bold; } \t';
					css += '.service-name { font-family: Trebuchet MS; font-size: 11px; color:#05afd4; font-weight: bold; } \t';
					css += '.published { font-family: Trebuchet MS; font-size: 10px; color: #fafafa; font-weight:normal; } \t';
					css += 'a:hover { text-decoration: underline; } \t';
					css += 'p { font-family: Trebuchet MS; font-size: 12px; color: #303030; font-weight: normal; }';
					break;
				case("pink"):
					bg_color = 0xf9f9f9;
					css = '.name { font-family: Trebuchet MS; font-size: 13px; color: #ff007e; font-weight: bold; } \t';
					css += '.service-name { font-family: Trebuchet MS; font-size: 11px; color:#ff007e; font-weight: bold; } \t';
					css += '.published { font-family: Trebuchet MS; font-size: 10px; color: #fafafa; font-weight:normal; } \t';
					css += 'a:hover { text-decoration: underline; } \t';
					css += 'p { font-family: Trebuchet MS; font-size: 12px; color: #303030; font-weight: normal; }';
					break;
				case("green"):
					bg_color = 0xf9f9f9;
					css = '.name { font-family: Trebuchet MS; font-size: 13px; color: #b3ec4b; font-weight: bold; } \t';
					css += '.service-name { font-family: Trebuchet MS; font-size: 11px; color:#b3ec4b; font-weight: bold; } \t';
					css += '.published { font-family: Trebuchet MS; font-size: 10px; color: #fafafa; font-weight:normal; } \t';
					css += 'a:hover { text-decoration: underline; } \t';
					css += 'p { font-family: Trebuchet MS; font-size: 12px; color: #303030; font-weight: normal; }';
					break;
				case("minimalist"):
					bg_color = 0xf9f9f9;
					css = '.name { font-family: Trebuchet MS; font-size: 13px; color: #fafafa; font-weight: bold; } \t';
					css += '.service-name { font-family: Trebuchet MS; font-size: 11px; color:#fafafa; font-weight: bold; } \t';
					css += '.published { font-family: Trebuchet MS; font-size: 10px; color: #fafafa; font-weight:normal; } \t';
					css += 'a:hover { text-decoration: underline; } \t';
					css += 'p { font-family: Trebuchet MS; font-size: 12px; color: #303030; font-weight: normal; }';
					break;
			}
			
		}
		
	}
	
}