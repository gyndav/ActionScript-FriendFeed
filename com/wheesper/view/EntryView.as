package com.wheesper.view
{
	import com.wheesper.model.Entry;
	import com.wheesper.model.Theme;
	import com.wheesper.view.Badge;
	import flash.display.Sprite;
	import flash.text.StyleSheet;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import com.wheesper.controller.Config;
	
	/**
	 * ...
	 * @author David Guyon
	 */
	public class EntryView extends Sprite
	{
		/*
		 * Graphic vars
		 */ 
		private var _styleSheet : StyleSheet;
		private var _bg : Sprite;
		private var _service : ServiceView;
		private var _service_name: TextField;
		private var _content: TextField;
		private var _published: TextField;
		
		/*
		 * Data vars
		 */ 
		private var _entry: Entry;
		private var _theme: Theme;
		
		public function EntryView(p_entry: Entry)
		{
			_entry = p_entry;
			_theme = Config.getInstance().theme;
			
			// StyleSheet
			_styleSheet = new StyleSheet();
			_styleSheet.parseCSS(_theme.css);
			
			_bg = new Sprite();
			_content = new TextField();
			_content.styleSheet = _styleSheet;
			_content.autoSize = TextFieldAutoSize.LEFT;
			_content.wordWrap = true;
			_content.multiline = true;
			_service_name = new TextField();
			_service_name.styleSheet = _styleSheet;
			_service_name.autoSize = TextFieldAutoSize.LEFT;
			_published = new TextField();
			_published.styleSheet = _styleSheet;
			_published.autoSize = TextFieldAutoSize.RIGHT;
			
			// Service icon
			_service = new ServiceView(_entry.service);
			addChild(_service);
			_service.x = 0;
			// Service name
			_service_name.htmlText = '<span class="service-name"><a href="' + _entry.service.profileUrl + '">' + _entry.service.name + '</a></span>';
			addChild(_service_name);
			_service_name.x = 20;
			// Published date
			_published.htmlText = '<span class="published">' + _entry.published.pretty_date +'</span>';
			addChild(_published);
			_published.x = ((Badge.getInstance().BADGE_WIDTH - _published.width) - 10);
			
			if (_entry.hasMedia())
			{
				// Media
				var media : MediaView = new MediaView(_entry.medias[0]);
				media.x = media.y = 5;
				_bg.addChild(media);
				
				// Content line
				_content.width = (Badge.getInstance().BADGE_WIDTH - 10) - (Config.getInstance().MEDIA_SIZE + 10) - 3;
				_content.x = Config.getInstance().MEDIA_SIZE + 10;
				_content.htmlText = '<p class="content"><a href="'+ _entry.link  +'">'+ _entry.title +'</a></p>';
				
				// Background
				_bg.graphics.beginFill(_theme.bg_color);
				if (_theme.name == "friendfeed") _bg.graphics.drawRect(0, 0, (Badge.getInstance().BADGE_WIDTH - 10), 85);
				else _bg.graphics.drawRoundRect(0, 0, (Badge.getInstance().BADGE_WIDTH - 10), 85, 10, 10);
				_bg.graphics.endFill();
				
			}
			else
			{
				// Content line				
				_content.width = Badge.getInstance().BADGE_WIDTH - 18;
				_content.x = 3;
				
				if (_entry.service.id == "twitter" || _entry.service.id == "plurk" || _entry.service.id == "facebook" || _entry.service.id == "googletalk" || _entry.service.id == "jaiku" || _entry.service.id == "identica")
				{
					_content.htmlText = '<p>' + _entry.title +'</p>';
				}
				else
				{
					_content.htmlText = '<p><a href="'+ _entry.link +'">' + _entry.title +'</a></p>';
				}
				
				// Background
				_bg.graphics.beginFill(_theme.bg_color);
				if (_theme.name == "friendfeed") _bg.graphics.drawRect(0, 0, (Badge.getInstance().BADGE_WIDTH - 10), _content.height);
				else _bg.graphics.drawRoundRect(0, 0, (Badge.getInstance().BADGE_WIDTH - 10), _content.height, 10, 10);
				_bg.graphics.endFill();			
			}
			
			addChild(_bg);
			_bg.y = 20;
			addChild(_content);
			_content.y = 20;
		}
		
	}
	
}