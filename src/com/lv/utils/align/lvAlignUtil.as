package com.lv.utils.align {
	import flash.text.TextField;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.display.DisplayObject;

	/**
	 *  (c) 2012 finsishing 
	 * @author kafeichong
	 */
	public class lvAlignUtil {
		// 水平对齐
		public static const H_LEFT : String = "horiziontalLeft";
		public static const H_CENTER : String = "horiziontalCenter";
		public static const H_RIGHT : String = "horiziontalRigth";
		// 垂直对齐
		public static const V_TOP : String = "verticalLeft";
		public static const V_MIDDLE : String = "verticalCenter";
		public static const V_BOTTOM : String = "verticalRigth";

		public static function setAlgin(align : String, target : DisplayObject, parentContainer : DisplayObject, parentalRelation : Boolean = true) {
			var _align : String = align;
			var _target : DisplayObject = target;
			var _parentContainer : DisplayObject = parentContainer;
			var _targetRect : Rectangle = _target.transform.pixelBounds;
			var _targetPoint : Point = new Point();
			var _parentPoint : Point;
			if (target is TextField) {
				// 返回一个矩形，该矩形定义相对于 targetCoordinateSpace 对象坐标系的显示对象区域。
				_targetRect = _target.getBounds(_target.parent)
			}
			if (parentalRelation) {
				//求出父对象相对坐标
				_parentPoint = _parentContainer.globalToLocal(new Point(_targetRect.x, _targetRect.y));
				_targetRect.x = _parentPoint.x;
				_targetRect.y = _parentPoint.y;
			} else {
				_targetPoint = new Point(_parentContainer.transform.pixelBounds.x, _parentContainer.transform.pixelBounds.y);
			}
			if (_align == H_LEFT) _target.x = (_target.x >_targetRect.x) ? _targetPoint.x + _target.x - _targetRect.x : _targetPoint.x;
			// if (_align == H_CENTER) _target.x = tp.x + int((p.width - b.width) / 2 + t.x - b.x);
			// if (_align == H_RIGHT) _target.x = (_target.x > b.x + b.width) ? tp.x + p.width : tp.x + p.width - (b.x + b.width - _target.x);
			// if (_align == V_TOP) _target.y = (_target.y > b.y) ? tp.y + t.y - b.y : tp.y;
			// if (_align == V_MIDDLE) _target.y = tp.y + int((p.height - b.height) / 2 + _target.y - b.y);
			// if (_align == V_BOTTOM) _target.y = (_target.y > b.y + b.height) ? tp.y + p.height : tp.y + p.height - (b.y + b.height - _target.y);
		}
	}
}
