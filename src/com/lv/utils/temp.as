package com.lv.utils {
	import flash.display.Sprite;
	/**
	 * @author kafeichong
	 */
	public function temp() : void {
		var rectWidth : uint = 200;
			var rectHeight : uint = 100;
			// Assign registration point (TL, TC, TR, CL, C, CR, BL, BC, BR = top, center, bottom, left, right)
			var registration : String = "C"
			// Assign rect's X and Y properties
			var rectX : int;
			var rectY : int;
			switch (registration) {
				case "TL":
					rectX = 0;
					rectY = 0;
					break;
				case "TC":
					rectX = -rectWidth / 2;
					rectY = 0;
					break;
				case "TR":
					rectX = -rectWidth;
					rectY = 0;
					break;
				case "CL":
					rectX = 0;
					rectY = -rectHeight / 2;
					break;
				case "C":
					rectX = -rectWidth / 2;
					rectY = -rectHeight / 2;
					break;
				case "CR":
					rectX = -rectWidth;
					rectY = -rectHeight / 2;
					break;
				case "BL":
					rectX = 0;
					rectY = -rectHeight;
					break;
				case "BC":
					rectX = -rectWidth / 2;
					rectY = -rectHeight;
					break;
				case "BR":
					rectX = -rectWidth;
					rectY = -rectHeight;
			}
			// Draw the rect
			var rect : Sprite = new Sprite();
			rect.graphics.beginFill(0xFF0000);
			rect.graphics.drawRect(rectX, rectY, rectWidth, rectHeight);
			rect.graphics.endFill();
	}
}
