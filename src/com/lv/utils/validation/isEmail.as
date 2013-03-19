package com.lv.utils.validation {
	/**
	 * @author stevenlv
	 * 验证@email:String是否是一个有效的电子邮件地址。
	 */
	public function isEmail(email:String) : Boolean {
		var pattern:RegExp = /^[A-Z0-9._%+-]+@(?:[A-Z0-9-]+\.)+[A-Z]{2,4}$/i;
		return email.match(pattern) != null;
	}
}
