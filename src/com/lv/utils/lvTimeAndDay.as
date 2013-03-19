package com.lv.utils {
	/**
	 * @author kafeichong
	 */
	public class lvTimeAndDay {
	/*
		 * 说明：通过给定字符串 返回 Date
		 * 使用实例： 
		 *     1.lvTimeAndDay.getDateWithString("2012-03-04 14:57:27 ");
		 *     2.返回：Sun Mar 4 14:57:27 GMT+0800 2012
		 */
		public static function getDateWithString(str : String, split1 : String = ' ', split2 : String = '-', split3 : String = ':') : Date {
			var datestr : String = str;
			var date_Arry : Array = datestr.split(split1);
			date_Arry[0] = String(date_Arry[0]).split(split2);
			date_Arry[1] = String(date_Arry[1]).split(split3);
			var d : Date = new Date(int(date_Arry[0][0]), int(date_Arry[0][1] - 1), date_Arry[0][2], date_Arry[1][0], date_Arry[1][1], date_Arry[1][2]);
			return d;
			/*
			 * trace("date_ar[0]:"+date_Arry[0]); 
			 * trace("date_ar:"+date_Arry)
			 * trace("date_ar[1] :"+date_Arry[1] );
			 */
		}

		/*
		 * 说明：通过给定字符串 返回相应的毫秒  返回 Number
		 * 使用实例： 
		 *     1.var myday:Number= lvTimeAndDay.getTimeWithString("2012-03-04 14:57:27 ");
		 *     2. 返回：1330844247000
		 */
		public static function getTimeWithString(str : String, split1 : String = ' ', split2 : String = '-', split3 : String = ':') : Number {
			return getDateWithString(str, split1, split2, split3).getTime();
		}

		/*
		 * 说明：通过给定time返回相应的字符串  如返回String 
		 * 使用实例： 
		 *     1.var myday:String= lvTimeAndDay.getStringWithTime(1330844247000);
		 *     2.返回：2012-03-04 14:57:27
		 */
		public static function getStringWithTimeNumber(time : Number, split1 : String = ' ', split2 : String = '-', split3 : String = ':') : String {
			var d : Date = new Date(time);
			return d.getFullYear() + split2 + formatNumber(d.getMonth() + 1) + split2 + formatNumber(d.getDate()) + split1 + formatNumber(d.getHours()) + split3 + formatNumber(d.getMinutes()) + split3 + formatNumber(d.getSeconds());
		}

		/*
		 * 说明：格式化显示时间 time 毫秒  如返回String 
		 * 使用实例： 
		 *     1.var myday:String= lvTimeAndDay.getTimeFormat(1330844247000);
		 *     2.返回：6:57:27
		 */
		public static function getTimeFormat(time : Number, text : String = '[h]:[m]:[s]') : String {
			var d : Date = new Date();
			d.setTime(time);
			text = text.replace('[h]', d.getUTCHours());
			text = text.replace('[m]', formatNumber(d.getUTCMinutes()));
			text = text.replace('[s]', formatNumber(d.getUTCSeconds()));
			return text;
		}

		/*
		 * 说明：格式化显示时间 time 毫秒  如返回String 
		 * 使用实例： 
		 *     1.var myday:String= lvTimeAndDay.getDateFormat(1330844247000);
		 *     2.返回：2012-03-04 14:57:27
		 */
		public static function getDateFormat(time : Number, text : String = '[Y]-[M]-[D] [h]:[m]:[s]') : String {
			var d : Date = new Date();
			d.setTime(time);
			text = text.replace('[Y]', d.getFullYear());
			text = text.replace('[M]', formatNumber(d.getMonth() + 1));
			text = text.replace('[D]', formatNumber(d.getDate()));
			text = text.replace('[h]', formatNumber(d.getHours()));
			text = text.replace('[m]', formatNumber(d.getMinutes()));
			text = text.replace('[s]', formatNumber(d.getSeconds()));
			return text;
		}

		/*
		 * 说明：判断数字是否为一位或两位数字，小于10，加“0”   返回 String
		 */
		private static function formatNumber(time : Number) : String {
			var str : String = time.toString();
			if (time < 10) {
				str = '0' + str;
			}
			return str;
		}
	}
}
