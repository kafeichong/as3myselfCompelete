package com.lv.utils.validation {
	/**
	 * @author stevenlv
	 */
	public function isURL( str:String):Boolean
	{
		return (str.substring(0, 7) == "http://" || str.substring(0, 8) == "https://");
	}
}
