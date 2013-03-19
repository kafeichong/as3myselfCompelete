package com.lv.components.button {
	import flash.display.DisplayObjectContainer;
	import flash.events.MouseEvent;

	/**
	 * @author steven.lv
	 */
	public class SwitchButton extends BasicButton {
		public var clicked : Boolean = false;
		// AssociativeButton实例的点击状态；
		private var _type = "SwitchButton";

		public function SwitchButton() {
			super();
		}

		public function get type() : String {
			return _type;
		}

		override public function mouseDownHandler(e : MouseEvent = null) : void {
			if (clicked == false) {
				clicked = true;
				super.mouseOverHandler(e);
				super.mouseDownHandler(e);
				removeEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
				removeEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
			} else {
				initThis();
			}

			// removeEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
		}

		public function initThis() {
			addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
			addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
			addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			super.mouseOutHandler();
			clicked = false;
		}
	}
}
