package com.lv.display.lvFullScreen {
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.HTTPStatusEvent;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	import flash.system.LoaderContext;

	/**
	 * @author kafeichong
	 */
	public class lvFullScreenImage extends Sprite {
		private var _bitmapSmoothing : Boolean;
		private var _contentHolder : Sprite;
		// 是否加入场景
		private var _initStage : Boolean = false;
		// 是否加载完成
		private var _initLoad : Boolean = false;
		private var _align : String;
		private var _loader : Loader;
		private var _loaderContext : LoaderContext;

		public function lvFullScreenImage(align : String = "TL", bitmapSmoothing : Boolean = false) {
			_align = align;
			_bitmapSmoothing = bitmapSmoothing;

			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this.addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
		}

		public function load(url : String) : void {
			_loader = new Loader();
			_loaderContext = new LoaderContext(_bitmapSmoothing);
			configureListeners(_loader.contentLoaderInfo);
			_loader.load(new URLRequest(url), _loaderContext);
		}

		private function onAddedToStage(e : Event) : void {
			_initStage = true;

			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			// 监听场景变化
			stage.addEventListener(Event.RESIZE, onStageResize);

			// 初始化场景
			if (_initLoad && _initStage) {
				onStageResize(null);
			}
		}

		private function onRemovedFromStage(e : Event) : void {
			// 卸载监听场景变化侦听.
			stage.removeEventListener(Event.RESIZE, onStageResize);
		}

		private function onStageResize(e : Event) : void {
			if (  _contentHolder is Sprite) {
				var sH : Number = stage.stageHeight;
				var sW : Number = stage.stageWidth;
				var image : DisplayObject = _contentHolder.getChildAt(0);

				switch(_align) {
					case "TL":
						_contentHolder.width = sW;
						_contentHolder.scaleY = _contentHolder.scaleX;
						if (_contentHolder.height < sH) {
							_contentHolder.height = sH;
							_contentHolder.scaleX = _contentHolder.scaleY;
						}
						break;
					case "T":
						// 一半
						image.x = -(image.width >> 1);
						_contentHolder.x = sW >> 1;
						_contentHolder.width = sW;
						_contentHolder.scaleY = _contentHolder.scaleX;
						if (_contentHolder.height < sH) {
							_contentHolder.height = sH;
							_contentHolder.scaleX = _contentHolder.scaleY;
						}
						break;
					case "TR":
						image.x = -(image.width);
						_contentHolder.x = sW;
						_contentHolder.width = sW;
						_contentHolder.scaleY = _contentHolder.scaleX;
						if (_contentHolder.height < sH) {
							_contentHolder.height = sH;
							_contentHolder.scaleX = _contentHolder.scaleY;
						}
						break;
					case "CL":
						image = _contentHolder.getChildAt(0);
						image.y = -(image.height >> 1);
						_contentHolder.y = sH >> 1;
						_contentHolder.width = sW;
						_contentHolder.scaleY = _contentHolder.scaleX;
						if (_contentHolder.height < sH) {
							_contentHolder.height = sH;
							_contentHolder.scaleX = _contentHolder.scaleY;
						}
						break;
					case "C":
						image.y = -(image.height >> 1);
						image.x = -(image.width >> 1);
						_contentHolder.y = sH >> 1;
						_contentHolder.x = sW >> 1;
						_contentHolder.width = sW;
						_contentHolder.scaleY = _contentHolder.scaleX;
						if (_contentHolder.height < sH) {
							_contentHolder.height = sH;
							_contentHolder.scaleX = _contentHolder.scaleY;
						}
						break;
					case "CR":
						image.y = -(image.height >> 1);
						image.x = -(image.width);
						_contentHolder.y = sH >> 1;
						_contentHolder.x = sW;
						_contentHolder.width = sW;
						_contentHolder.scaleY = _contentHolder.scaleX;
						if (_contentHolder.height < sH) {
							_contentHolder.height = sH;
							_contentHolder.scaleX = _contentHolder.scaleY;
						}
						break;
					case "BL":
						image.y = -(image.height);
						_contentHolder.y = sH;
						_contentHolder.width = sW;
						_contentHolder.scaleY = _contentHolder.scaleX;
						if (_contentHolder.height < sH) {
							_contentHolder.height = sH;
							_contentHolder.scaleX = _contentHolder.scaleY;
						}
						break;
					case "B":
						image.y = -(image.height);
						image.x = -(image.width >> 1);
						_contentHolder.y = sH;
						_contentHolder.x = sW >> 1;
						_contentHolder.width = sW;
						_contentHolder.scaleY = _contentHolder.scaleX;
						if (_contentHolder.height < sH) {
							_contentHolder.height = sH;
							_contentHolder.scaleX = _contentHolder.scaleY;
						}
						break;
					case "BR":
						image.y = -(image.height);
						image.x = -(image.width);
						_contentHolder.y = sH;
						_contentHolder.x = sW;
						_contentHolder.width = sW;
						_contentHolder.scaleY = _contentHolder.scaleX;
						if (_contentHolder.height < sH) {
							_contentHolder.height = sH;
							_contentHolder.scaleX = _contentHolder.scaleY;
						}
						break;
				}
			}
		}

		private function configureListeners(dispatcher : IEventDispatcher) : void {
			dispatcher.addEventListener(Event.COMPLETE, onLoadComplete);
			dispatcher.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
			dispatcher.addEventListener(Event.INIT, initHandler);
			dispatcher.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			dispatcher.addEventListener(Event.OPEN, openHandler);
			dispatcher.addEventListener(ProgressEvent.PROGRESS, progressHandler);
		}

		private function deconfigureListeners(dispatcher : IEventDispatcher) : void {
			dispatcher.removeEventListener(Event.COMPLETE, onLoadComplete);
			dispatcher.removeEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
			dispatcher.removeEventListener(Event.INIT, initHandler);
			dispatcher.removeEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			dispatcher.removeEventListener(Event.OPEN, openHandler);
			dispatcher.removeEventListener(ProgressEvent.PROGRESS, progressHandler);
		}

		private function onLoadComplete(e : Event) : void {
			this.dispatchEvent(e);
			_initLoad = true;
			_contentHolder = new Sprite();

			addChild(_contentHolder);

			if (_bitmapSmoothing) {
				var bitmap : Bitmap = e.target.loader.content as Bitmap;
				bitmap.smoothing = _bitmapSmoothing;
				_contentHolder.addChild(bitmap);
			} else {
				_contentHolder.addChild(e.target.loader as Loader);
			}

			if (_initLoad && _initStage) {
				onStageResize(null);
			}

			deconfigureListeners(_loader.contentLoaderInfo);
			_loader = null;
		}

		private function progressHandler(e : ProgressEvent) : void {
			this.dispatchEvent(e);
		}

		private function httpStatusHandler(e : HTTPStatusEvent) : void {
			this.dispatchEvent(e);
		}

		private function initHandler(e : Event) : void {
			this.dispatchEvent(e);
		}

		private function ioErrorHandler(e : IOErrorEvent) : void {
			this.dispatchEvent(e);
		}

		private function openHandler(e : Event) : void {
			this.dispatchEvent(e);
		}

		public function get align() : String {
			return _align;
		}

		public function set align(value : String) : void {
			_align = value;
		}
	}
}
/*
 package 
{
	import com.lv.display.lvFullScreen.events.VideoStatusEvent;
	import com.lv.display.lvFullScreen.lvFullScreenImage;
	import com.greensock.TweenLite;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.ProgressEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	
	public class ImageMain extends Sprite 
	{
		private var imagesURL:Array = new Array();
		
		private var i:int = 0;
		
		private var imageHolder:MovieClip;
		
		private var timer:Timer;
		
		private var fullScreenImages:Array = new Array();
		
		public function ImageMain():void 
		{
			imagesURL.push("http://farm3.static.flickr.com/2573/4151019457_bc67d3db3f_b.jpg");
			imagesURL.push("http://farm3.static.flickr.com/2523/3766693063_e2513f7501_o.jpg");
			imagesURL.push("http://farm3.static.flickr.com/2577/3766692609_1955c3472e_o.jpg");	
			imagesURL.push("http://farm3.static.flickr.com/2517/3935147835_fcb530847e_o.png");
			imagesURL.push("http://farm3.static.flickr.com/2427/3941999596_d32c700ba5_o.png");
			
			// Created the time to slide the images. 
			timer = new Timer(5000);
			timer.addEventListener(TimerEvent.TIMER, onTick);
			
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			// Remove stage add event. 
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			// Create holder for the fullscreen images
			imageHolder = new MovieClip();
			addChildAt(imageHolder, 0);
			
			// Make an instance per url 			
			for (var i:int = 0; i < imagesURL.length; i++) {
				var image:FullScreenImage = new FullScreenImage(FullScreenAlign.CENTER , true);
				image.addEventListener(Event.COMPLETE, onComplete);
				image.addEventListener(ProgressEvent.PROGRESS, onProgress);					
				
				fullScreenImages.push({image:image, init:false});
			}
		
			// init timer tick
			onTick();
			
			
		}
		
		private function onTick(e:TimerEvent = null):void 
		{
			// Hold timer till image loads
			timer.stop();
						
			// Get the fullscreen instance from the list and check if it's been loaded. 
			if (fullScreenImages[i].init) {	
				
				// restart timer
				timer.start();
				
				fullScreenImages[i].image.alpha = 0;
				TweenLite.to(fullScreenImages[i].image, 3, { alpha:1 } );
				
			}else{ // if the image has not been loaded, load the image. 	
							
				// Set init to true to show that it has been loaded. 
				fullScreenImages[i].init = true;			
				
				// Load image in to fullscreen instance
				fullScreenImages[i].image.load(imagesURL[i]);
				
				// show preloader
				preloader_txt.visible = true;
				preloader_txt.text = "loading";				
							
				// Set to alpha 0 so that the image can be faded in. 
				fullScreenImages[i].image.alpha = 0;	
			}
			
			// Place on top level in image holder.
			imageHolder.addChild(fullScreenImages[i].image);
		
			
			// Only have 2 images at once in the holder. 
			if (imageHolder.numChildren == 3) {
				imageHolder.removeChildAt(0);
			}
			
			// Change the "i" index to point to the next image in the lest or point to the first image if the list is at the end. 
			i++;
			if (i == imagesURL.length) {
				i = 0;
			}
		}
		
		private function onProgress(e:ProgressEvent):void 
		{
			var percent:Number = e.bytesLoaded / e.bytesTotal;
			preloader_txt.text = "loading " + String(Math.round((percent * 100)));
		}
		
		private function onComplete(e:Event):void 
		{
			// restart timer
			timer.start();
			
			// tween alpha back to 1
			TweenLite.to(e.currentTarget, 3, { alpha:1 } );		
			
			// Hide preloader. 
			preloader_txt.visible = false;
			
			// Remove listeners once loaded. 
			e.currentTarget.removeEventListener(Event.COMPLETE, onComplete);
			e.currentTarget.removeEventListener(ProgressEvent.PROGRESS, onProgress);
		}
		
	}
	
}
 */
