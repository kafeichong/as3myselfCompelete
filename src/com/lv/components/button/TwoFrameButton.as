package com.lv.components.button {
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 * @author steven.lv
	 */
	public class TwoFrameButton extends BasicButton {
		public var clicked : Boolean = false;
		private var _type = "TwoFrameButton";

		public function TwoFrameButton() {
		}

		public function get type() : String {
			return _type;
		}

		override public function mouseDownHandler(e : MouseEvent = null) : void {
			clicked = true;
			super.mouseOverHandler(e);
			initTotalButton(parent);
			removeEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
		}

		override protected function mouseOverHandler(e : MouseEvent = null) : void {
		}

		override protected function mouseOutHandler(e : MouseEvent = null) : void {
		}

		private function initTotalButton($target : DisplayObjectContainer) {
			for (var i : uint = 0; i < $target.numChildren; i++ ) {
				var _target = $target.getChildAt(i);
				try {
					if (_target.type == "TwoFrameButton") {
						if (_target != this && _target.clicked == true)
							_target.initThis();
					}
				} catch (e : *) {
				}
			}
		}

		public function initThis() {
			addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			super.mouseOutHandler();
			clicked = false;
		}
	}
}
