package quicksketch.screens
{
	import quicksketch.Main;
	
	import flash.display.BitmapData;
	import flash.display.PNGEncoderOptions;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;
	
	import feathers.controls.Button;
	import feathers.controls.Screen;
	import feathers.controls.ScrollContainer;
	import feathers.controls.Slider;
	import feathers.layout.VerticalLayout;
	
	import starling.display.Shape;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.filters.BlurFilter;
	
	
	public class SketchScreen extends Screen
	{
		
		private var scrollContainer:ScrollContainer;
		private var verticalLayout:VerticalLayout;
		private var canvasSprite:Sprite;
		private var slider:Slider;
		private var saveButton:Button;
		private var canvasDimension:int;
		private var canvas:Shape;
		private var canvasBackground:Shape;
		private var byteArray:ByteArray;
		
		override protected function initialize():void {
			buildContainer();
			buildControls();
		}
		
		override protected function draw():void {
			canvasDimension = actualWidth - (verticalLayout.padding*2);
			saveButton.width = canvasDimension;
			slider.width = canvasDimension;
			
			canvas.width = canvasDimension;
			canvas.height = canvasDimension;
			canvas.graphics.beginFill(0xCCCCCC, 1);
			canvas.graphics.drawRect(0,0,canvasDimension,canvasDimension);
			canvas.graphics.endFill();
			canvas.graphics.lineStyle(10, 0x000000, 0.6);
			
			canvasBackground.width = canvasDimension;
			canvasBackground.height = canvasDimension;
			canvasBackground.graphics.beginFill(0xCCCCCC, 1);
			canvasBackground.graphics.drawRect(0,0,canvasDimension,canvasDimension);
			canvasBackground.graphics.endFill();
			
			var filter:BlurFilter = new BlurFilter(1,1,1);
			canvas.filter = filter;
			
			canvasSprite.clipRect = new Rectangle(0,0,canvasDimension,canvasDimension);
		}

		private function buildContainer():void {
			verticalLayout = new VerticalLayout();
			verticalLayout.verticalAlign = VerticalLayout.VERTICAL_ALIGN_TOP;
			verticalLayout.horizontalAlign = VerticalLayout.HORIZONTAL_ALIGN_CENTER;
			verticalLayout.gap = 25;
			verticalLayout.padding = 25;
			
			scrollContainer = new ScrollContainer();
			scrollContainer.layout = verticalLayout;
			addChild(scrollContainer);
		}
		
		private function buildControls():void {
			canvasSprite = new Sprite();
			canvasSprite.addEventListener(TouchEvent.TOUCH, onCanvasTouch);
			scrollContainer.addChild(canvasSprite);
			
			canvasBackground = new Shape();
			canvasSprite.addChild(canvasBackground);
			
			canvas = new Shape();
			canvasSprite.addChild(canvas);
			
			slider = new Slider();
			slider.minimum = 1;
			slider.maximum = 50;
			slider.value = 10;
			slider.addEventListener(Event.CHANGE, switchLineStyle);
			scrollContainer.addChild(slider);
			
			saveButton = new Button();
			saveButton.addEventListener(Event.TRIGGERED, doSave);
			saveButton.label = "save";
			scrollContainer.addChild(saveButton);
		}
		
		private function doSave():void
		{
			renderCanvas();
			saveImage();
			browseImage();
		}
		
		private function saveImage():void
		{
			var today:Date = new Date();
			var pngName:String = "qs_" + today.getFullYear() + "" + today.getMonth() + "" + today.getDate() + "-" + today.getHours() + "" + today.getMinutes() + "" + today.getSeconds();
			var pngFile:File = File.documentsDirectory.resolvePath("PutTogetherToy/" + pngName + ".png");  
			var fs:FileStream = new FileStream();  
			fs.open(pngFile, FileMode.WRITE);  
			fs.writeBytes(byteArray);
			fs.close();
		}
		
		private function browseImage():void
		{
			var r:Main = this.root as Main;
			r.goBrowse();
		}
		
		private function renderCanvas():void
		{
			var canvasData:BitmapData = new BitmapData(this.width, this.height);
			canvasData = stage.drawToBitmapData(canvasData);
			byteArray = new ByteArray();
			
			//remove "owner.y + " when publishing for mobile
			canvasData.encode(new Rectangle(verticalLayout.padding, owner.y + verticalLayout.padding, canvasSprite.width, canvasSprite.height), new flash.display.PNGEncoderOptions(), byteArray);	
		}
		
		private function switchLineStyle(event:Event):void
		{
			canvas.graphics.lineStyle(slider.value, 0x000000, 0.6);
		}
		
		protected function onCanvasTouch(e:TouchEvent):void {
			var touch:Touch = e.getTouch(canvas);
			if(touch) {
				var currentPoint:Point = touch.getLocation(canvas);
				if(touch.phase == TouchPhase.BEGAN){
					canvas.graphics.moveTo(currentPoint.x, currentPoint.y);
				} else if(touch.phase == TouchPhase.MOVED) {
					canvas.graphics.lineTo(currentPoint.x, currentPoint.y);
				}
			}
		}
		
	}
}