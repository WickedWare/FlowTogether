package
{
	import flash.display.Sprite;
	import starling.core.Starling;
	import wackobytes.games.G6FlowTogether.*;
	
	[SWF(width="580", height="400", frameRate="60", backgroundColor="#333333")]
	
	public class FlowTogether extends Sprite
	{
		public function FlowTogether()
		{
			var starling : Starling  = new Starling(Example,stage);
			starling.start();
			starling.showStatsAt("left","bottom");
		}
	}
}
