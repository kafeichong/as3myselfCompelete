package com.lv.utils.library {
	import flash.display.MovieClip;

	/**
	 * 从影片剪辑库中得到一个硬盘剪辑的实例
	 * @author stevenlv
	 * @param 剪辑的类名称
	 * 
	 */
	public function getClipFromLibrary(className : String) : MovieClip {
		var clazz : Class = getClassFromLibrary(className);
		if (!clazz) {
			return null;
		}
		try {
			return new clazz();
		} catch (err : ArgumentError) {
			return null;
		}
		return null;
	}
}
