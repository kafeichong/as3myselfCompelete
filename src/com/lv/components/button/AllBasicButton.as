package com.lv.components.button {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 * @author janelv
	 */
	public class AllBasicButton extends MovieClip {
		public var url : String = "";
		// 超链接地址,不传入就不会link
		public var way : String = "_blank";
		// 窗口打开方式
		public var id : Number = 0;
		public var isExceed : Boolean = false;

		public function AllBasicButton() {
			if (stage) init();
			else addEventListener(Event.ADDED, init);
		}

		protected function init(e : Event = null) : void {
			removeEventListener(Event.ADDED, init);
			stop();
			this.buttonMode = true;
			this.mouseChildren = false;
			addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
			addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
			addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
		}

		private function mouseUpHandler(event : MouseEvent) : void {
			if (isExceed) {
				this.gotoAndStop("exceed");
				this.removeEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
				this.removeEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
				this.removeEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			} else {
				this.gotoAndStop("over");
				this.addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
				this.addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
				this.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
				
			}
		}

		private function mouseDownHandler(event : MouseEvent) : void {
			if (isExceed) {
				this.gotoAndStop("exceed");
			} else {
				this.gotoAndStop("down");
			}
		}

		private function mouseOverHandler(event : MouseEvent) : void {
			this.gotoAndStop("over");
		}

		private function mouseOutHandler(event : MouseEvent) : void {
			this.gotoAndStop("out");
		}
	}
}
