package com.lv.utils {
	/**
	 * @author kafeichong
	 */
	public class lvRandom {
		/*
		 * 随机Boolean值
		 */
		public static function boolean(chance : Number = 0.5) : Boolean {
			return (Math.random() < chance);
		}

		/*
		 * 随机0-1 (包含0)
		 */
		public static function random() : Number {
			return Math.random();
		}

		/*
		 * 一定范围的随机浮点数，包括min和max
		 */
		public static function randomFloat(min : Number, max : Number) : Number {
			return Math.random() * (max - min) + min;
		}

		// 随机符号
		public static function sign(chance : Number = 0.5) : int {
			return (Math.random() < chance) ? 1 : -1;
		}

		// 随机二进制
		public static function bit(chance : Number = 0.5) : int {
			return (Math.random() < chance) ? 1 : 0;
		}

		/*
		 * 一定范围的随机浮整数，包括min和max
		 */
		public static function randomInt(min : int, max : int) : int {
			return Math.floor(randomFloat(min, (max + 1)));
		}
	}
}
