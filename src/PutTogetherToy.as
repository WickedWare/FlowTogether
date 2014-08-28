package
{
	import quicksketch.Main;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	import starling.core.Starling;
	
	[SWF(frameRate="60", backgroundColor="#000000")]
	public class PutTogetherToy extends Sprite
	{
		private var starling:Starling;
		
		public function PutTogetherToy()
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			loaderInfo.addEventListener(Event.COMPLETE, onLoadComplete);
		}
		
		protected function onLoadComplete(event:Event):void
		{
			Starling.handleLostContext = true;
			starling = new Starling(Main, stage);
			starling.start();
			
			stage.addEventListener(Event.RESIZE, onStageResize);
			stage.addEventListener(Event.DEACTIVATE, onStageDeactivate);
		}
		
		protected function onStageResize(event:Event):void
		{
			starling.stage.stageWidth = stage.stageWidth;
			starling.stage.stageHeight = stage.stageHeight;
			
			const viewPort:Rectangle = starling.viewPort;
			viewPort.width = stage.stageWidth;
			viewPort.height = stage.stageHeight;
			starling.viewPort = viewPort;
		}
		
		protected function onStageDeactivate(event:Event):void
		{
			starling.stop();
			stage.addEventListener(Event.ACTIVATE, onStageActivate);
		}		
		
		protected function onStageActivate(event:Event):void
		{
			stage.removeEventListener(Event.ACTIVATE, onStageActivate);
			starling.start();
		}		
		
		
		
		
		
	}
}