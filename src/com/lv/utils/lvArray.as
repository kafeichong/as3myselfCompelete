package com.lv.utils {
	import flash.utils.ByteArray;
	/**
	 * @author kafeichong
	 */
public class lvArray {
		/**
		clone(ob:Object):*
		 * 克隆对象
		 * @param source 要克隆的源对象
		 * @return 克隆的新对象
		 */
		public static function clone(source : Object) : * {
			var myBA : ByteArray = new ByteArray();
			myBA.writeObject(source);
			myBA.position = 0;
			return (myBA.readObject());
		}

		/**
		clearSameOne(ar:Array):void
		 * 清除数组里面相同的元素
		 * @param ar 数组源对象
		 * @return 无
		 */
		public static function clearSameOne(ar : Array) : void {
			for (var i : uint = 0; i < ar.length; i++) {
				var ob : Object = ar[i];
				for (var j : uint = 0; j < ar.length; j++) {
					var ob_c : Object = ar[j];
					if (i != j && ob == ob_c) {
						ar.splice(j, 1);
					}
				}
			}
		}

		/**
		getRandomOne(ar:Array):*
		 * 从数组中随机抽取一个元素
		 * @param ar 数组源对象
		 * @return   取出的元素
		 */
		public static function getRandomOne(ar : Array) : * {
			return ar.splice(Math.floor(Math.random() * ar.length), 1)[0];
		}

		/**
		upset(ar:Array):Array
		 * 打乱数组
		 * @param ar 数组源对象
		 * @return 打乱后的数组
		 */
		public static function upset(ar : Array) : Array {
			var re : Array = [];
			while (ar.length > 0) {
				re.push(getRandomOne(ar));
			}
			return re;
		}

		/**
		remove(ar:Array,item:*):int
		 * 清除指定对象
		 * @param ar 数组源对象
		 * @param item 指定对象
		 * @return 清除指定对象的id
		 */
		public static function remove(ar : Array, item : *) : int {
			for (var i : int = 0; i < ar.length; i++) {
				if (ar[i] === item) {
					ar.splice(i, 1);
					return i;
				}
			}
			return -1;
		}
	/**
		randomArrLength(ary : Array, chance : int): Array
		 * 从给定数组中取出chance长度的数组
		 * @param ary 数组源对象
		 * @param chance 要取得的长度
		 * @return 新的数组
		 */
		public static function randomArrLength(ary : Array, chance : int) : Array {
			var _loc_3 : Array = [];
			var tempAry : Array = ary;

			var curSwfNumAry : Array = [];
			for (var j : int = 0; j < chance; j++) {
				curSwfNumAry.push(lvArray.getRandomOne(tempAry));
			}
			return curSwfNumAry;
		}
		// end function
	}
}