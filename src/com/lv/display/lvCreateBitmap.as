package com.lv.display {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;

	/**
	 * @author kafeichong@gmail.com
	 *  @2012-8-4
	 
	 */
	public function lvCreateBitmap(source:DisplayObject, useSmoothing:Boolean = true):Bitmap
	{
		const bitmapData:BitmapData = new BitmapData(source.width, source.height, true, 0xffffff);
		bitmapData.draw(source);

		const bitmap:Bitmap = new Bitmap(bitmapData);
		bitmap.smoothing = useSmoothing;

		return bitmap;
	}
}