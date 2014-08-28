package quicksketch.screens
{
	import feathers.controls.Screen;
	import feathers.controls.ImageLoader;
	import feathers.controls.Label;
	import feathers.controls.ScrollContainer;
	import feathers.controls.List;
	import feathers.layout.VerticalLayout;
	import feathers.data.ListCollection;
	
	import flash.filesystem.File;
	
	import starling.events.Event;
	import feathers.layout.TiledRowsLayout;
	import starling.display.Quad;
	
	
	public class BrowseScreen extends Screen
	{
		
		private var scrollContainer:ScrollContainer;
		private var verticalLayout:VerticalLayout;
		private var tiledRowsLayout : TiledRowsLayout;
		private var imagesList:List;
		private var noImagesText:Label;
		private var imageLoader:ImageLoader;
		
		override protected function initialize():void {
			buildContainer();
			buildControls();
			loadImages();
		}
		
		private function loadImages():void
		{
			var imagesDirectory:File = File.documentsDirectory.resolvePath("PutTogetherToy");
			if(imagesDirectory.exists){
				var imagesArray:Array = imagesDirectory.getDirectoryListing();
				var listCollection:ListCollection = new ListCollection();
				
				for(var i:int = 0; i<imagesArray.length; i++){
					if(imagesArray[i].extension == "png"){
						listCollection.push({title:imagesArray[i].name, image:imagesArray[i].url});
					}
				}
				
				if(listCollection.length == 0){
					showMessage();
				}else{
					imagesList.dataProvider = listCollection;
					imagesList.addEventListener(Event.CHANGE, imageSelected);
					imagesList.selectedIndex = listCollection.length-1;
					imagesList.itemRendererProperties.labelField = "title";
					scrollContainer.addChild(imagesList);
				}
				
			}
		}
		
		private function imageSelected():void
		{
			imageLoader.source = imagesList.dataProvider.data[imagesList.selectedIndex].image;
		}
		
		private function showMessage():void
		{
			scrollContainer.removeChildren();
			scrollContainer.addChild(noImagesText);
		}
		
		override protected function draw():void {
			var canvasDimension:int = this.actualWidth - (verticalLayout.padding*2);
			imageLoader.width = canvasDimension;
			imageLoader.height = canvasDimension;
			imagesList.width = canvasDimension;
			imagesList.height = actualHeight - actualWidth - verticalLayout.padding;
		}
		
		private function buildContainer():void {
			verticalLayout = new VerticalLayout();
			verticalLayout.verticalAlign = VerticalLayout.VERTICAL_ALIGN_TOP;
			verticalLayout.horizontalAlign = VerticalLayout.HORIZONTAL_ALIGN_CENTER;
			verticalLayout.gap = 25;
			verticalLayout.padding = 25;
			
			tiledRowsLayout = new TiledRowsLayout(); 
			
			tiledRowsLayout.padding = 10;
			tiledRowsLayout.gap = 5;
			tiledRowsLayout.useSquareTiles = false;

			scrollContainer = new ScrollContainer();
			scrollContainer.layout = tiledRowsLayout;
			scrollContainer.width = this.stage.stageWidth;
			scrollContainer.height = this.stage.stageHeight;
			
			var xPosition:Number = 0;
			for(var i:int = 0; i < 5; i++)
			{
				var quad:Quad = new Quad( 40, 40, 0xff0000 );
				quad.x = xPosition;
				
				scrollContainer.addChild( quad );
				xPosition += quad.width + 10;
			}
			
			addChild(scrollContainer);
		}
		
		private function buildControls():void {
			imageLoader = new ImageLoader();
			scrollContainer.addChild(imageLoader);
			
			noImagesText = new Label();
			noImagesText.text = "No Images Yet!";
			
			imagesList = new List();
			scrollContainer.addChild(imagesList);
		}
		
		
		
		
		
	}
}