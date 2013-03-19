package com.lv.components.form {
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.display.MovieClip;

	/**
	 * @author steven.lv
	 * @QQ:55147022
	 * @EMIAL:kafeichong@gmail.com
	 * @DATE:2012-10-13
	 */
	public class lvCheckBox extends MovieClip {
		public var isCheck : Boolean = false;

		public function lvCheckBox() {
			if (stage) init();
			else addEventListener(Event.ADDED, init);
		}

		protected function init(e : Event = null) : void {
			this.mouseChildren = false;
			this.buttonMode = true;
			this.addEventListener(MouseEvent.CLICK, mouseDownHander);
		}

		private function mouseDownHander(event : MouseEvent) : void {
			isCheck = !isCheck;
			if (isCheck) {
				this.gotoAndStop(2);
			} else {
				this.gotoAndStop(1);
			}
		}

		public function desmouseDownHander() : void {
			this.removeEventListener(MouseEvent.CLICK, mouseDownHander);
		}
	}
}
