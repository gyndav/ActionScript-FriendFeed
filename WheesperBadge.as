package  
{
	import com.wheesper.controller.Config;
	import com.wheesper.view.Badge;
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	
	/**
	 * ...
	 * @author David Guyon
	 */
	public class WheesperBadge extends Sprite
	{
		
		public function WheesperBadge()
		{	
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
				
			Badge.getInstance().init(this);
			
			var flash_vars: Object = LoaderInfo(this.root.loaderInfo).parameters;flash_vars.nickname = "davidguyon";
			Config.getInstance().init(flash_vars);
			
		}
		
	}
	
}