package com.lv.utils.conversion.times {
	/**
	 * @author steven.lv
	 * @QQ:55147022
	 * @EMIAL:kafeichong@gmail.com
	 * @DATE:2012-10-11
	 */
	public function lvMinutesToMilliseconds(minutes:Number):Number
	{
		return lvSecondsToMilliseconds(lvMinutesToSeconds(minutes));
	}
}
