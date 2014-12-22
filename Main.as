package
{
	import flash.filesystem.File;
	
	import lzm.starling.STLConstant;
	import lzm.starling.STLMainClass;
	import lzm.starling.entityComponent.Entity;
	import lzm.starling.entityComponent.EntityWorld;
	import lzm.starling.entityComponent.effects.BlurComponent;
	import lzm.starling.entityComponent.gestures.DragGesturesComponent;
	import lzm.starling.swf.Swf;
	import lzm.starling.swf.display.SwfMovieClip;
	
	import starling.utils.AssetManager;
	import starling.utils.formatString;
	
	public class Main extends STLMainClass
	{
		
		private var assets:AssetManager;
		private var swf:Swf;
		
		public function Main()
		{
			Swf.init(this);
			
			var file:File = File.applicationDirectory;
			
			assets = new AssetManager(STLConstant.scale);
			assets.verbose = true;
			assets.enqueue(file.resolvePath(formatString("assets/2x/test",STLConstant.scale)));
			assets.loadQueue(function(ratio:Number):void{
				if(ratio == 1){
					swf = new Swf(assets.getByteArray("test"),assets,60);
					
					var world:EntityWorld = new EntityWorld();
					world.start();
					addChild(world);
					
					var mc:SwfMovieClip;
					var entity:Entity;
					var mcNames:Array = ["mc_Tain","mc_Zombie_gargantuar","mc_Zombie_balloon"];
					var postions:Array = [[100,260],[280,130],[30,10]];
					for (var i:int = 0; i < 3; i++) {
						mc = swf.createMovieClip(mcNames[i]);
						entity = new Entity();
						entity.addChild(mc);
						entity.x = postions[i][0];
						entity.y = postions[i][1];
						entity.addComponentByType(BlurComponent);
						entity.addComponentByType(DragGesturesComponent);
						world.addChildEntity(entity);
					}
				}
			});
		}
	}
}