package com.lv.utils.library {
	import flash.display.BitmapData;
	/**
	 * @author stevenlv
	 * 从影片剪辑库中新建一个BitmapData
	 */
	public function getBitmapDataFromLibrary(className:String) : BitmapData {
		var clazz:Class = getClassFromLibrary(className);
		if(!clazz) {
			return null;
		}
		try {
			// Need to pass a width and height, but they are ignored
			return new clazz(0, 0);
		}
		catch (err:ArgumentError) {
			return null;
		}
		return null;
	}
}
