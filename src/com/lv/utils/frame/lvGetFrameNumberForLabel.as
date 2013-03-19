package com.lv.utils.frame {
	import flash.display.MovieClip;

	/**
	 * @author stevenlv
	 * 检测字符串@label是否为当前影片剪辑@target帧标签名称
	 * @param target: 目标影片剪辑
	 * @param label:帧标签
	 */
	public function lvGetFrameNumberForLabel(target : MovieClip, label : String) : int {
		//返回由当前场景的 FrameLabel 对象组成的数组。 如果 MovieClip 实例不使用场景，数组会包括整个 MovieClip 实例的所有帧标签。
		var labels : Array = target.currentLabels;
		var l : int = labels.length;

		while (l--)
			if (labels[l].name == label)
				return labels[l].frame;

		return -1;
	}
}
