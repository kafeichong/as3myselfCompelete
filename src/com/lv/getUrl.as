package com.lv {
	import flash.display.Sprite;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	/**
	 * @author :  kafeichong@gmail.com
	 * @Date : 2011-3-7
	 */
	public function getUrl(url:String, target:String = null) : void {
		try {
			navigateToURL(new URLRequest(url), target);
		}catch(error:Error){
			trace("[getURL] "+error);
		}
	}
}
