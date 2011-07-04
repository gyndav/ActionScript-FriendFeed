package libraries
{	
	/**
	 * @author David Guyon
	 * @desc Takes an ISO time and returns a string representing how long ago the date represents
	 */
	
	public class PrettyDate
	{
		private var _dirty_date : Date;
		private var _diff : Number;
		public var _day_diff : Number;
		public var pretty_date : String;
		
		
		public function PrettyDate(p_iso_date:String)
		{
			try
			{
				_dirty_date = new Date(p_iso_date.replace(/-/g,"/").replace(/[TZ]/g," "));
				_diff = ((new Date().getTime()) - (_dirty_date.getTime())) / 1000;
				_day_diff = Math.floor(_diff / 86400);
				
				// final date
				if (isNaN(_day_diff) || _day_diff < 0 || _day_diff > 31)
				{
					pretty_date = "";
				}
				else
				{
					if (_day_diff == 0)
					{
						if (_diff < 60)
						{
							pretty_date = _diff.toString() + " seconds ago";	
						}
						else if (_diff < 120)
						{
							pretty_date = "1 minute ago";
						}
						else if (_diff < 3600)
						{
							pretty_date = Math.floor(_diff / 60).toString() + " minutes ago";
						}
						else if (_diff < 7200)
						{
							pretty_date = "1 hour ago";
						}
						else if (_diff < 86400)
						{
							pretty_date = Math.floor(_diff / 3600).toString() + " hours ago";
						}
					}
					else if (_day_diff == 1)
					{
						pretty_date = "yesterday";
					}
					else if (_day_diff < 7)
					{
						pretty_date = _day_diff.toString() + " days ago";
					}
					else if (_day_diff < 31)
					{
						pretty_date = (Math.ceil(_day_diff / 7)).toString() + " weeks ago";
					}
				}
				
			}
			catch(e:Error)
			{
				trace("PrettyDate.as => PrettyDate constructor failure");
				trace(e.message);
			}
		}
		
	}
	
}