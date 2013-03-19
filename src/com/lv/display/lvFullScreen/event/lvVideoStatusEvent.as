package com.lv.display.lvFullScreen.event {
	import flash.events.Event;

	/**
	 * @author kafeichong
	 * 视频播放状态事件
	 */
	public class lvVideoStatusEvent extends Event {
		public static const ON_STATUS : String = "on_status";
		private var _status : String;

		public function lvVideoStatusEvent(type : String, status : String, bubbles : Boolean = false, cancelable : Boolean = false) {
			super(type, bubbles, cancelable);
			_status = status;
		}

		public override function clone() : Event {
			return new lvVideoStatusEvent(type, _status, bubbles, cancelable);
		}

		public override function toString() : String {
			return formatToString("VideoStatusEvent", "type", "status", "bubbles", "cancelable", "eventPhase");
		}

		public function get status() : String {
			return _status;
		}
	}
}
