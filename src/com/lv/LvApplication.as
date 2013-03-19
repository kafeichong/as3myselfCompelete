package com.lv {
	import flash.display.DisplayObject;
	import flash.display.LoaderInfo;
	import flash.display.MovieClip;
	import flash.display.StageAlign;
	import flash.display.StageDisplayState;
	import flash.display.StageQuality;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.system.Security;

	/**
	 * @author steven.lv
	 * @Contact 
	 *              Email: kafeichong@gmail.com 
	 *              QQ:55147022
	 *               reference: Johnny Chen
	 */
	public class LvApplication extends MovieClip {
		private var __min_width : int;
		private var __min_height : int;
		private var __max_height : int;
		private var __max_width : int;
		private var _appAlign : String;
		private static var MINWIDTH : uint = 1000;
		private static var MINHEIGHT : uint = 625;
		private static var MAXWIDTH : uint = 2560;
		private static var MAXHEIGHT : uint = 1440;

		public function LvApplication() {
			if (stage) {
				initApplication();
			} else {
				addEventListener(Event.ADDED_TO_STAGE, initApplication, false, 0, true);
			}
		}

		public function initApplication(event : Event = null) : void {
			// this.removeEventListener(Event.ADDED_TO_STAGE, initApplication);
			var domain : String = LoaderInfo(this.root.loaderInfo).parameters.domain;
			stage.focus = stage;
			
			Security.allowDomain(domain);
			Security.allowInsecureDomain(domain);
			initApplicationViewType();
			setMinSize(MINWIDTH, MINHEIGHT, MAXWIDTH, MAXHEIGHT);
			init();
			stage.addEventListener(Event.RESIZE, onResize, false, 0, true);
		}

		public function initApplicationViewType(appAlign : String = 'top_left') : void {
			_appAlign = appAlign;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.showDefaultContextMenu = false;
		}

		protected function onResize(event : Event = null) : void {
		}

		protected function init() : void {
			
			// 子类覆盖此函数
		}

		// 设置是否全屏
		public function fullScreen() : void {
			stage.displayState = StageDisplayState.FULL_SCREEN;
		}

		public function get isFullScreen() : Boolean {
			return stage.displayState == StageDisplayState.FULL_SCREEN;
		}

		public function normalScreen() : void {
			stage.displayState = StageDisplayState.NORMAL;
		}

		public function setMinSize(minWidth : int, minHeight : int, maxWidth : int = 999999, maxHeight : int = 999999) : void {
			// 设置窗口最小宽度和高度
			__min_height = minHeight;
			__min_width = minWidth;
			__max_height = maxHeight;
			__max_width = maxWidth;
		}

		/**
		 *获取传入flash的参数对象
		 * @return flash的参数对象
		 */
		public function getFlashVars() : Object {
			return stage.loaderInfo.parameters;
		}

		public function get appWidth() : int {
			// 应用程序的宽度
			return Math.min(Math.max(__min_width, stage.stageWidth), __max_width);
		}

		public function get appHeight() : int {
			// 应用的宽度
			return Math.min(Math.max(__min_height, stage.stageHeight), __max_height);
		}

		/*
		 * 设置原件等比例缩放
		 * _appWidth:原件的宽；_appHeight:原件的高
		 * _allowMaxWidth：场景的原始宽，_allowMaxHeight：场景的原始高
		 */
		public function setAppWidth(_appWidth : Number, _appHeight : Number, _allowMaxWidth : Number, _allowMaxHeight : Number) : Object {
			var curObject : Object = {a:800, b:600};
			var my_appWidth : Number = appWidth;
			var my_appHeight : Number = appHeight;
			if (my_appWidth > my_appHeight) {
				curObject.a = _appWidth * (my_appHeight / _allowMaxHeight);
				curObject.b = _appHeight * (my_appHeight / _allowMaxHeight);
			} else {
				curObject.a = _appWidth * (my_appWidth / _allowMaxWidth);
				curObject.b = _appHeight * (my_appWidth / _allowMaxWidth);
			}

			return curObject;
		}

		public function setAllMid(_obj : DisplayObject) : void {
			var obj : DisplayObject = _obj as DisplayObject;
			obj.x = (stage.stageWidth - obj.width) / 2;
			obj.y = (stage.stageHeight - obj.height) / 2;
		}

		public function setLow() : String {
			var str : String = stage.quality;
			stage.quality = StageQuality.LOW;
			return str;
		}

		public function setMedium() : String {
			var str : String = stage.quality;
			stage.quality = StageQuality.MEDIUM;
			return str;
		}

		public function setHigh() : String {
			var str : String = stage.quality;
			stage.quality = StageQuality.HIGH;
			return str;
		}

		public function setBest() : String {
			var str : String = stage.quality;
			stage.quality = StageQuality.BEST;
			return str;
		}

		public function setView(str : String) : void {
			stage.quality = str;
		}
	}
}
