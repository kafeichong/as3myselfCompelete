package com.lv.utils.align {
	import flash.display.DisplayObject;
	import flash.geom.Point;
	import flash.geom.Rectangle;

	/**
	 * @author kafeichong
	 */
	public class lvAlign {
		public static function xAlignCenter(item : DisplayObject, target : DisplayObject) : void {
			// item.x = int(target.width / 2 - item.width / 2);

			var b : Rectangle = item.transform.pixelBounds;
			var bp : Point = target.globalToLocal(new Point(b.x, b.y));
			b.x = bp.x;
			b.y = bp.y;
			item.x = int((target.width - b.width) / 2 + item.x - b.x);
		}
	}
}
