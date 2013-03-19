package com.lv.utils.draw {
	import flash.display.Graphics;
	import flash.display.Shape;

	/**
	 * @author kafeichong
	 */
	public function lvCreateCircleShape (r:Number, color:uint = 0, alpha:Number = 1, x:Number = 0, y:Number = 0) : Shape {
		var circle : Shape = new Shape();
		var g : Graphics = circle.graphics;
		g.beginFill(color, alpha);
		g.drawCircle(0, 0, r);
		g.endFill();
		circle.x = 2*r;
		circle.y = 2*r;
		trace("circle.x :"+circle.x )
		return circle;
	}
}
