package
{
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	import lzm.starling.STLStarup;
	
	[SWF(width="960",height="640")]
	public class Test extends STLStarup
	{
		public function Test()
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.frameRate = 60;
			initStarling(Main,480,true,true);
			
			trace("test");
			trace("dfdf");
			
			
			//fsdfds
			
			
		}
	}
}