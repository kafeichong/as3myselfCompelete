package com.lv.components.button {
	import flash.display.MovieClip;
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 * @author @steven.lv( lvjianbo)
	 */
	public class ThreeFaceButton extends BasicButton {
		public var clicked : Boolean = false;
		private var _type = "ThreeFaceButton";
		public var bgMc : MovieClip;

		public function ThreeFaceButton() {
		}

		public function get type() : String {
			return _type;
		}

		override public function mouseDownHandler(e : MouseEvent = null) : void {
			clicked = true;
			trace("parent:" + parent);
			this.gotoAndStop(3);
			initTotalButton(parent);
			removeEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
		}

		override protected function mouseOverHandler(e : MouseEvent = null) : void {
			if (!clicked) {
				this.gotoAndStop(2);
			}
		}

		override protected function mouseOutHandler(e : MouseEvent = null) : void {
			if (!clicked) {
				e.target.gotoAndStop(1);
			}
		}

		private function initTotalButton($target : DisplayObjectContainer) {
			for (var i : uint = 0; i < $target.numChildren; i++ ) {
				var _target = $target.getChildAt(i);
				try {
					if (_target.type == "ThreeFaceButton") {
						if (_target != this && _target.clicked == true)
							_target.initThis();
					}
				} catch (e : *) {
				}
			}
		}

		public function initThis() {
			trace("initThis");
			addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			this.gotoAndStop(1);
			clicked = false;
		}
	}
}
