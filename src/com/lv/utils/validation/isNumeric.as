package com.lv.utils.validation {
	/**
	 * @author stevenlv
	 */
	public function isNumeric(str:String) : Boolean {
		if (str == null)
		{
			return false;
		}
		var regx:RegExp = /^[-+]?\d*\.?\d+(?:[eE][-+]?\d+)?$/;
		return regx.test(str);
	}
}
