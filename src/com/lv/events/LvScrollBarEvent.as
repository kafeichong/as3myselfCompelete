package com.lv.events {
	import flash.events.Event;

	/**
	 * @author kafeichong
	 */
	public class LvScrollBarEvent extends Event {
		//--------------------------------------------------------------------------
		// CLASS CONSTANTS
		//--------------------------------------------------------------------------
		
		/**
		 * 滚动条开始滚动
		 */
		static public const SCROLL_START:String = "onScrollStart";
		
		/**
		 * 滚动条滚动中
		 */
		static public const SCROLL_PROGRESS:String = "onScrollProgress";
		
		/**
		 * 滚动条滚动停止
		 */
		static public const SCROLL_COMPLETE:String = "onScrollComplete";
		public function LvScrollBarEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false) {
			super(type, bubbles, cancelable);
		}
		//--------------------------------------------------------------------------
		// METHODS
		//--------------------------------------------------------------------------
		
		/**
		 * 复制事件
		 * @return
		 */
		override public function clone():Event {
			return new LvScrollBarEvent(type, bubbles, cancelable);
		}
		//--------------------------------------------------------------------------
		// EVENT HANDLER
		//--------------------------------------------------------------------------
		
	}
}
