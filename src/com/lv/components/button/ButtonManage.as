/*
  Copyright (c) 2009
  All rights reserved.
 */
package com.lv.components.button {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 *
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9.0
	 * @tiptext
	 *
	 */
	public class ButtonManage {
		public static const BASIC : String = "basic";
		public static const SERIES : String = "series";
		

		public function ButtonManage() {
			throw(new Error("这是静态类无法被实例化!"));
		}

		/*
		 * 设置按钮操作
		 * 
		 * @param		$type		        String		        	* btn对象
		 * @param		$btn		        *		        		* url超链接地址
		 * @param		$group		        String		        	* 打开方式
		 */
		static public function make($type : String, $btn : *, $group : String = "AssociativeButton") : void {
			if (!(($btn is Array) || ($btn is MovieClip)))
				throw(new Error("请传入正确类型!"));

			var array : Array;
			array = $btn is Array ? $btn : [$btn];
			for (var i : uint = 0; i < array.length; i++ ) {
				makeing($type, array[i]);
			}
		}

		/*
		 * btn的url超链接操作
		 * 
		 * @param		$btn		        MovieClip		        * btn对象
		 * @param		$url		        String		        	* url超链接地址
		 * @param		$way		        String		        	* 打开方式
		 */
		static public function link($btn : MovieClip, $url : String, $way : String = "_blank") : void {
			$btn.addEventListener(MouseEvent.CLICK, clickHandler);

			function clickHandler(e : MouseEvent) : void {
			//	var request = new URLRequest($url);
			//	navigateToURL(request, $way);
			}
		}

		// -----------------------------------------------------------------
		static private function makeing($type : String, $btn : *) : void {
			switch($type) {
				case BASIC:
					makeBaseBtn($btn);
					break;
				case SERIES:
					makeSeriesBtn($btn);
					break;
			}
		}

		// 串联按钮-初始化
		static private function makeSeriesBtn($btn : MovieClip) : void {
			$btn.stop();
			$btn.buttonMode = true;
			$btn.mouseChildren=false;
			$btn.addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
			$btn.addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
			$btn.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
		}

		// 基本按钮-初始化
		static private function makeBaseBtn($btn : MovieClip) : void {
			$btn.stop();
			$btn.buttonMode = true;
			$btn.addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
			$btn.addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
		}

		static private function mouseDownHandler(e : MouseEvent = null) : void {
			e.currentTarget.clicked = true;
			e.currentTarget.initTotalButton(e.target.parent);
			//clicked = true;
			//
			//initTotalButton(parent);
			e.currentTarget.removeEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
			e.currentTarget.removeEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
			e.currentTarget.removeEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
		}

		// ----------------------------------------------------------
		static private function mouseOverHandler(e : MouseEvent) : void {
			e.currentTarget.removeEventListener(Event.ENTER_FRAME, prevFrameHandler);
			e.currentTarget.addEventListener(Event.ENTER_FRAME, nextFrameHandler);
		}

		static private function mouseOutHandler(e : MouseEvent) : void {
			e.currentTarget.removeEventListener(Event.ENTER_FRAME, nextFrameHandler);
			e.currentTarget.addEventListener(Event.ENTER_FRAME, prevFrameHandler);
		}

		static private function nextFrameHandler(e : Event) : void {
			if (e.currentTarget.currentFrame != e.currentTarget.totalFrames)
				e.currentTarget.nextFrame();
			else
				e.currentTarget.removeEventListener(Event.ENTER_FRAME, nextFrameHandler);
		}

		static private function prevFrameHandler(e : Event) : void {
			if (e.currentTarget.currentFrame != 1)
				e.currentTarget.prevFrame();
			else
				e.currentTarget.removeEventListener(Event.ENTER_FRAME, prevFrameHandler);
		}
	}
}