package com.lv.utils.validation {
	/**
	 * @author stevenlv
	 */
	public function isValidEmailAddress(str:String) : Boolean {
		var emailExpression:RegExp = /^[a-z][\w.-]+@\w[\w.-]+\.[\w.-]*[a-z][a-z]$/i;
		return emailExpression.test(str);
	}
}
