package com.lv.utils  {
	import flash.geom.Point;
	/**
	 * @author kafeichong
	 */
	public class lvMath {
		public static function getFloatNumber(num : Number, precise : int = 2) : Number {
			var m : String = '1';
			while (precise > 0) {
				m += '0';
				precise--;
			}
			return(Math.floor(num * int(m)) / int(m));
		}

		public static const ZERO : Point = new Point;
		// public static const PI:Number=3.14159265
		// Math.PI的二倍
		public static  const TWOPI : Number = Math.PI * 2;
		// Math.PI的一半
		public static  const HALFPI : Number = Math.PI / 2;
		// 弧度到角度
		public static  const H_J : Number = 180 / Math.PI;
		// 角度到弧度
		public static  const J_H : Number = Math.PI / 180;

		// 弧度转成角度
		public static function toDegree(h : Number) : Number {

			return h * H_J;
		}

		// 角度转成弧度
		public static function toRadian(j : Number) : Number {
			return j * J_H;
		}

		// 整数求绝对值
		public static function intAbs(x : int) : int {
			return (x ^ (x >> 31)) - (x >> 31);
		}

		// Number求绝对值
		public static function numberAbs(x : Number) : Number {
			return  (x < 0 ? -x : x);
		}

		// 计算3D空间两点的距离
		public static function getDistance3D(x1 : Number, x2 : Number, y1 : Number, y2 : Number, z1 : Number, z2 : Number) : Number {
			return Math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2) + (z1 - z2) * (z1 - z2));
		}

		// sin低精度计算
		public static function sinLow(x : Number) : Number {
			while (x < -3.14159265) {
				x += 6.28318531;
			}
			while (x > 3.14159265) {
				x -= 6.28318531;
			}
			var sin : Number;
			if (x < 0) {
				sin = 1.27323954 * x + .405284735 * x * x;
			} else {
				sin = 1.27323954 * x - 0.405284735 * x * x;
			}
			return sin;
		}

		// cos低精度计算
		public static function cosLow(x : Number) : Number {
			while (x < -3.14159265) {
				x += 6.28318531;
			}
			while (x > 3.14159265) {
				x -= 6.28318531;
			}
			x += 1.57079632;
			if (x > 3.14159265) {
				x -= 6.28318531;
			}
			var cos : Number;
			if (x < 0) {
				cos = 1.27323954 * x + 0.405284735 * x * x;
			} else {
				cos = 1.27323954 * x - 0.405284735 * x * x;
			}
			return cos;
		}

		// sin高精度计算
		public static function sinHigh(x : Number) : Number {
			while (x < -3.14159265) {
				x += 6.28318531;
			}
			while (x > 3.14159265) {
				x -= 6.28318531;
			}
			var sin : Number;

			if (x < 0) {
				sin = 1.27323954 * x + .405284735 * x * x;
				if (sin < 0)
					sin = .225 * (sin * -sin - sin) + sin;
				else
					sin = .225 * (sin * sin - sin) + sin;
			} else {
				sin = 1.27323954 * x - 0.405284735 * x * x;
				if (sin < 0)
					sin = .225 * (sin * -sin - sin) + sin;
				else
					sin = .225 * (sin * sin - sin) + sin;
			}
			return sin;
		}

		// cos高精度计算
		public static function cosHigh(x : Number) : Number {
			while (x < -3.14159265) {
				x += 6.28318531;
			}
			while (x > 3.14159265) {
				x -= 6.28318531;
			}
			x += 1.57079632;
			if (x > 3.14159265) {
				x -= 6.28318531;
				
			}
			var cos : Number;
			if (x < 0) {
				cos = 1.27323954 * x + 0.405284735 * x * x;
				if (cos < 0)
					cos = .225 * (cos * -cos - cos) + cos;
				else
					cos = .225 * (cos * cos - cos) + cos;
			} else {
				cos = 1.27323954 * x - 0.405284735 * x * x;
				if (cos < 0)
					cos = .225 * (cos * -cos - cos) + cos;
				else
					cos = .225 * (cos * cos - cos) + cos;
			}
			return cos;
		}

		public static function sinBest(v : Number) : Number {
			return Math.sin(v);
		}

		public static function cosBest(v : Number) : Number {
			return Math.cos(v);
		}

		// Number直接转换成整数 丢掉小数部分
		public static function getInt(x : Number) : int {
			return x >> 0;
		}

		// 获取a/b的余数，相当于a%b 注意b必须为2的次方数如，2,4,8,16,32,64,128
		public static function getLast(a : int, b : int) : int {
			return a & (b - 1);
		}

		// 获取a/b的余数是否为0，相当于a%b==0 注意b必须为2的次方数如，2,4,8,16,32,64,128
		public static function isEven(a : int, b : int) : Boolean {
			return (a & (b - 1)) == 0;
		}

		// 四舍五入取整
		public static function getNearInt(x : Number) : int {
			var i : int = getInt(x);
			if (x - i >= 0.5) {
				i += 1;
			}
			return i;
		}

		// 向上取整
		public static function maxInt(v : Number) : int {
			var rint : int = getInt(v);
			return (rint == v ? rint : (rint + 1));
		}
	}
}
