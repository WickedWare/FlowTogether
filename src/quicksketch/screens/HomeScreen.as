package quicksketch.screens
{
	import feathers.controls.Screen;
	import feathers.controls.ImageLoader;
	import feathers.controls.Label;
	import feathers.controls.ScrollContainer;
	import feathers.layout.VerticalLayout;
	
	import starling.textures.Texture;
	
	public class HomeScreen extends Screen
	{
		[Embed(source="/../assets/images/TitleImage.png")]
		private static const TitleImage:Class;
		
		private var scrollContainer:ScrollContainer;
		private var verticalLayout:VerticalLayout;
		private var titleLoader:ImageLoader;
		private var subText:Label;
		
		override protected function initialize():void {
			buildContainer();
			loadTitles();
		}
		
		override protected function draw():void {
			titleLoader.validate();
			titleLoader.width = actualWidth;
		}
		
		private function buildContainer():void {
			verticalLayout = new VerticalLayout();
			verticalLayout.verticalAlign = VerticalLayout.VERTICAL_ALIGN_TOP;
			verticalLayout.horizontalAlign = VerticalLayout.HORIZONTAL_ALIGN_CENTER;
			verticalLayout.gap = 25;
			
			scrollContainer = new ScrollContainer();
			scrollContainer.layout = verticalLayout;
			scrollContainer.width = this.stage.stageWidth;
			scrollContainer.height = this.stage.stageHeight;
			addChild(scrollContainer);
		}
		
		private function loadTitles():void {
			titleLoader = new ImageLoader();
			titleLoader.maintainAspectRatio = true;
			titleLoader.source = Texture.fromEmbeddedAsset(TitleImage);
			scrollContainer.addChild(titleLoader);
			
			subText = new Label();
			subText.text = "Quickly sketch out your ideas on the go.";
			scrollContainer.addChild(subText);	
		}
		
	}
}