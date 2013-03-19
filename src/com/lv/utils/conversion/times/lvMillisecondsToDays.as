package com.lv.utils.conversion.times {
	/**
	 * @author stevenlv
	 */
	 /***********描述*************************
	    转换毫秒为天；

	   @param milliseconds: 毫秒数.
	   @return ：天数.
	 */
	public function lvMillisecondsToDays(milliseconds:Number):Number
	{
		return lvHoursToDays(lvMillisecondsToHours(milliseconds));
	}
}
