package com.lv.utils {
	/**
	 * @author kafeichong
	 */
	public class lvString {
		public static function toHexString(hex : uint) : String {
			return "0x" + (hex.toString(16)).toUpperCase();
		}

		// 小于10的数字加"0"
		public static function addLeadingZero(n : Number) : String {
			var out : String = String(n);

			if (n < 10 && n > -1) {
				out = "0" + out;
			}

			return out;
		}

		/**
		 *	比较两个字符串是否相等
		 *   caseSensitive：是否按区分大小写比较
		 */
		public static function stringsAreEqual(s1 : String, s2 : String, caseSensitive : Boolean) : Boolean {
			if (caseSensitive) {
				return (s1 == s2);
			} else {
				return (s1.toUpperCase() == s2.toUpperCase());
			}
		}

		public static function trim(input : String) : String {
			return lvString.ltrim(lvString.rtrim(input));
		}

		/*
		 * 去掉左空格
		 */
		public static function ltrim(input : String) : String {
			var size : Number = input.length;
			for (var i : Number = 0; i < size; i++) {
				if (input.charCodeAt(i) > 32) {
					return input.substring(i);
				}
			}
			return "";
		}

		/*
		 * 去掉右空格
		 */
		public static function rtrim(input : String) : String {
			var size : Number = input.length;
			for (var i : Number = size; i > 0; i--) {
				if (input.charCodeAt(i - 1) > 32) {
					return input.substring(0, i);
				}
			}

			return "";
		}
		/*
		 * 比较字符串前缀是否相同
		 */
		public static function beginsWith(input:String, prefix:String):Boolean
		{			
			return (prefix == input.substring(0, prefix.length));
		}
		/*
		 * 比较字符串后缀是否相同
		 */	
		public static function endsWith(input:String, suffix:String):Boolean
		{
			return (suffix == input.substring(input.length - suffix.length));
		}	
		public static function replace(input:String, replace:String, replaceWith:String):String
		{
			return input.split(replace).join(replaceWith);
		}
	}
}
