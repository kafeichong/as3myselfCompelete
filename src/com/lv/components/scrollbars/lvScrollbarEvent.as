package com.lv.components.scrollbars {
	import flash.events.Event;

	/**
	 * @author kafeichong
	 */
	public class lvScrollbarEvent extends Event {
		//滚动开始触发事件
		static public const SCROLL_START:String = "onScrollStart";
		//滚动过程中触发事件
		static public const SCROLL_PROGRESS:String = "onScrollProgress";
		//滚动结束触发事件
		static public const SCROLL_COMPLETE:String = "onScrollComplete";
		public function lvScrollbarEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false) {
			super(type, bubbles, cancelable);
		}
		override public function clone():Event {
			return new lvScrollbarEvent(type, bubbles, cancelable);
		}
	}
}
