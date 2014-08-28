package quicksketch
{
	import quicksketch.screens.BrowseScreen;
	import quicksketch.screens.HomeScreen;
	import quicksketch.screens.SketchScreen;
	
	import feathers.controls.ScreenNavigator;
	import feathers.controls.ScreenNavigatorItem;
	import feathers.controls.TabBar;
	import feathers.data.ListCollection;
	import feathers.motion.transitions.ScreenFadeTransitionManager;
	import feathers.themes.MetalWorksMobileTheme;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Main extends Sprite
	{
		
		private var screenNavigator:ScreenNavigator;
		
		private var screenTransitionManager:ScreenFadeTransitionManager;
		private var navigationBar:TabBar;
		private var navHeight:int;
		
		private static const HOME_SCREEN:String = "homeScreen";
		private static const BROWSE_SCREEN:String = "browseScreen";
		private static const SKETCH_SCREEN:String = "sketchScreen";
		
		
		public function Main()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, onStageReady);
		}
		
		private function onStageReady():void
		{
			new MetalWorksMobileTheme();
			buildLayout();
			setupScreens();
			completeLayout();
		}
		
		private function buildLayout():void
		{
			navigationBar = new TabBar();
			navigationBar.dataProvider = new ListCollection([
				{label:"Browse", data:BROWSE_SCREEN},
				{label:"Home", data:HOME_SCREEN},
				{label:"Sketch", data:SKETCH_SCREEN}
			]);
			navigationBar.selectedIndex = 1;
			navigationBar.addEventListener(Event.CHANGE, navigationBarChanged);
			navigationBar.width = stage.stageWidth;
			addChild(navigationBar);
		}
		
		private function navigationBarChanged(event:Event):void
		{
			screenNavigator.showScreen(navigationBar.selectedItem.data);
		}
		
		private function setupScreens():void
		{
			screenNavigator = new ScreenNavigator();
			screenNavigator.addScreen(HOME_SCREEN, new ScreenNavigatorItem(HomeScreen));
			screenNavigator.addScreen(BROWSE_SCREEN, new ScreenNavigatorItem(BrowseScreen));
			screenNavigator.addScreen(SKETCH_SCREEN, new ScreenNavigatorItem(SketchScreen));
			screenTransitionManager = new ScreenFadeTransitionManager(screenNavigator);
		}
		
		private function completeLayout():void
		{
			navigationBar.validate();
			
			navHeight = Math.round(navigationBar.height);
			
			screenNavigator.y = navHeight;
			screenNavigator.width = stage.stageWidth;
			screenNavigator.height = stage.stageHeight-navHeight;
			addChild(screenNavigator);
			
			
		}
		
		public function goBrowse():void {
			navigationBar.selectedIndex = 0;
		}
		
		
		
		
		
	}
}