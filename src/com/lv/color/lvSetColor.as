package com.lv.color {
	import flash.display.DisplayObject;
	import flash.geom.ColorTransform;

	/**
	 * @author steven lv
	 */
	public function lvSetColor(src : DisplayObject, hex : uint) : void {
		var ct : ColorTransform = src.transform.colorTransform;
		ct.color = hex;
		src.transform.colorTransform = ct;
		
	}
}
