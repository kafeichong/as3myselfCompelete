package com.lv.color {
	/**
	 * @author kafeichong@gmail.com
	 */
	public function lvStringToColor(str : String) : uint {
		if (str.substr(0, 2) == '0x') {
			str = str.substr(2);
		} else if (str.substr(0, 1) == '#') {
			str = str.substr(1);
		}
		return parseInt(str, 16);
	}
}