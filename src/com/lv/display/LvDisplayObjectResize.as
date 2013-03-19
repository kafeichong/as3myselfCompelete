package com.lv.display {
	import flash.display.DisplayObject;
	import flash.geom.Rectangle;

	/**
	 * @author kafeichong
	 * @Contact :
	 *              Email: kafeichong@gmail.com 
	 *              QQ:55147022
	 * @date:2012-2-8
	 */
	public class LvDisplayObjectResize {
		public static function resizeFillRectangle(dob : DisplayObject, rect : Rectangle) : void {
			trace(rect)
			var erect : Rectangle = resizeFillRectangleSize(new Rectangle(0, 0, dob.width, dob.height), rect);
			dob.width = erect.width;
			dob.height = erect.height;
		}

		public static function resizeInRectangle(dob : DisplayObject, rect : Rectangle) : void {
			var erect : Rectangle = resizeInRectangleSize(new Rectangle(0, 0, dob.width, dob.height), rect);
			dob.width = erect.width;
			dob.height = erect.height;
		}

		// 等比例非全屏缩放
		public static function resizeInRectangleSize(srect : Rectangle, rect : Rectangle) : Rectangle {
			var scale : Number;
			if (srect.width / srect.height > rect.width / rect.height) {
				scale = rect.width / srect.width;
			} else {
				scale = rect.height / srect.height;
			}

			var erect : Rectangle = new Rectangle();

			erect.width = srect.width * scale;
			erect.height = srect.height * scale;

			return erect;
		}

		// 等比例全屏缩放
		public static function resizeFillRectangleSize(srect : Rectangle, rect : Rectangle) : Rectangle {
			var scale : Number;
			if (srect.width / srect.height > rect.width / rect.height) {
				scale = rect.height / srect.height;
			} else {
				scale = rect.width / srect.width;
			}

			var erect : Rectangle = new Rectangle();

			erect.width = srect.width * scale;
			erect.height = srect.height * scale;

			return erect;
		}

		public static function scaleInRectangle(dob : DisplayObject, bigrect : Rectangle, currect : Rectangle, oldPicRect : Rectangle) : void {
			var erect : Rectangle = scaleInRectangleSize(oldPicRect, bigrect, currect);
			dob.width = erect.width;
			dob.height = erect.height;
		}

		//
		public static function scaleInRectangleSize(curImgrect : Rectangle, bigrect : Rectangle, currect : Rectangle) : Rectangle {
			var erect : Rectangle = new Rectangle();
			var scale : Number;
			if (bigrect.width > currect.width || bigrect.height > currect.height) {
				if (bigrect.width / bigrect.height > currect.width / currect.height) {
					scale = currect.width / bigrect.width;
				} else {
					scale = currect.height / bigrect.height;
				}
			} else {
				scale = 1;
			}

			erect.width = curImgrect.width * scale;
			erect.height = curImgrect.height * scale;
			// trace("scale:" + scale);

			return erect;
		}
	}
}
