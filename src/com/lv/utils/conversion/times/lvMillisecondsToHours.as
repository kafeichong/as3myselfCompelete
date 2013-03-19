package com.lv.utils.conversion.times {
	/**
	 * @author stevenlv
	 */
	  /***********描述*************************
	    分钟转化为小时；

	   @param milliseconds: 毫秒数.
	   @return ：天数.
	 */
	public function lvMillisecondsToHours(milliseconds:Number):Number
	{
		return lvMinutesToHours(lvMillisecondsToMinutes(milliseconds));
	}
}
