package com.lv.display {
	import flash.display.DisplayObject;
	import flash.geom.Rectangle;
	import flash.system.Capabilities;

	/**
	 * copy @http://www.senocular.com/
	 * @author kafeichong
	 * 复制显示对象
	 * @target：复制的目标对象
	 * @autoAdd:是否自动添加
	 */
	public function lvduplicateDisplayObject(target : DisplayObject, autoAdd : Boolean = false) : DisplayObject {
		var targetClass : Class = Object(target).constructor as Class;
		var duplicate : DisplayObject = new targetClass() as DisplayObject;

		// duplicate properties
		duplicate.transform = target.transform;
		duplicate.filters = target.filters;
		duplicate.cacheAsBitmap = target.cacheAsBitmap;
		duplicate.opaqueBackground = target.opaqueBackground;
		if (target.scale9Grid) {
			var rect : Rectangle = target.scale9Grid;
			// 判断播放器版本
			if (Capabilities.version.split(" ")[1] == "9,0,16,0") {
				// Flash 9 bug where returned scale9Grid as twips
				rect.x /= 20
				,
				rect.y /= 20
				,
				rect.width /= 20
				,
				rect.height /= 20;
			}

			duplicate.scale9Grid = rect;
		}

		// Flash 10 only
		// duplicate.graphics.copyFrom(target.graphics);

		// add to target parent's display list
		// if autoAdd was provided as true
		if (autoAdd && target.parent) {
			target.parent.addChild(duplicate);
		}
		return duplicate;
	}
}