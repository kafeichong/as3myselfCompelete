package com.lv.components.form {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 * @author stevenlv
	 */
	public class lvRadioButton extends MovieClip {
		public var isCheck : Boolean = false;

		public function lvRadioButton() {
			if (stage) init();
			else addEventListener(Event.ADDED, init);
		}

		protected function init(e : Event = null) : void {
			this.mouseChildren = false;
			this.buttonMode = true;
		}
	}
}
