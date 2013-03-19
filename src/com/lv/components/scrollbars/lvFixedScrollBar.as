package com.lv.components.scrollbars {
	import flash.events.Event;
	import flash.display.MovieClip;

	/**
	 * @author kafeichong
	 */
	public class lvFixedScrollBar extends MovieClip {
		private var _scrollbar : lvScrollbar;
		// ==========================================================================
		// STAGE INSTANCES
		// ==========================================================================
		// 上按钮
		public var arrowUp : MovieClip;
		// 下按钮
		public var arrowDown : MovieClip;
		// 滚动条
		public var scrollBox : MovieClip;
		// 内容
		public var content : MovieClip;

		public function lvFixedScrollBar() {
			this.addEventListener(Event.ADDED_TO_STAGE, _initialize)
		}

		private function _initialize(e : Event) : void {
			removeEventListener(Event.ADDED_TO_STAGE, _initialize);
			var body : MovieClip = content.contentBody;
			var mask : MovieClip = content.contentMask;
			var slider : MovieClip = scrollBox.slider;
			var base : MovieClip = scrollBox.base;
			// 内容上限値, 下限値
			var upperBound : Number = body.y;
			var lowerBound : Number = body.y - (content.height - mask.height);

			var target : Object = body;
			var key : String = "y";

			_scrollbar = new lvScrollbar(stage);
			// 可以通过属性传递
			// _scrollbar.stage = stage;
			// _scrollbar.up     = arrowUp;
			// _scrollbar.down   = arrowDown;
			_scrollbar.base = base;
			_scrollbar.slider = slider;
			_scrollbar.setup(target,   // 移动对象 
			key,      // 移动方向属性 
			body.height,// 被移动对象高 
			mask.height, // mask高 
			upperBound,  // 最大值 
			lowerBound// 最小值
			);
			// 通过属性更改值
			// _scrollbar.upperBound;
			// _scrollbar.lowerBound;
			// _scrollbar.contentSize;
			// _scrollbar.maskSize;
			// 判断内容是否大于遮罩区域
			if (_scrollbar.isUnderFlow) {
				// _scrollbar.up.visible     = false;
				// _scrollbar.down.visible   = false;
				_scrollbar.slider.visible = false;
				_scrollbar.base.visible = false;
				_scrollbar.baseEnabled = false;
			}
			// 是否缓动
			// _scrollbar.useSmoothScroll = false;
			// 1以上の数値を設定
			// _scrollbar.smoothScrollEasing = 6;
			// 是否设定滑块可变
			// _scrollbar.useFlexibleSlider = false;

			// 如果您使用滑块以舒展的内容量而定，设置滑块像素的最小尺寸。
			// _scrollbar.minSliderHeight = 10;
			// 设置是否始终为0滑块的高度对待。
			_scrollbar.useIgnoreSliderHeight = true;
			// 滑块是否被吸附到整数像素
			_scrollbar.usePixelFittingSlider = true;
			// 滚动时的财产是否被吸附到一个整型值完成套。
			// _scrollbar.usePixelFittingContent = true;
			// 滚动条内原件是否设置为鼠标触发

			// _scrollbar.buttonEnabled = true;
			// _scrollbar.upEnabled     = true;
			// _scrollbar.downEnabled   = true;
			// _scrollbar.sliderEnabled = true;
			// _scrollbar.baseEnabled   = true;
			
			//_scrollbar.scrollUp();
			
			//上下箭头移动
			//_scrollbar.scrollDown();
			//_scrollbar.scrollDown();
			//滚动到指定的滚动位置。
			
			// 是否使用鼠标滚轮

			// _scrollbar.useMouseWheel = false;
			// 自动滚动
			// _scrollbar.startAutoScroll();

			// 停止自动滚动
			// _scrollbar.stopAutoScroll();
			// 侦听事件
			// _scrollbar.addEventListener(JPPScrollbarEvent.SCROLL_START   , function(e:JPPScrollbarEvent):void { trace("scroll start");    } );
			// _scrollbar.addEventListener(JPPScrollbarEvent.SCROLL_PROGRESS, function(e:JPPScrollbarEvent):void { trace("scroll progress"); } );
			// _scrollbar.addEventListener(JPPScrollbarEvent.SCROLL_COMPLETE, function(e:JPPScrollbarEvent):void { trace("scroll complete"); } );
		}
	}
}
