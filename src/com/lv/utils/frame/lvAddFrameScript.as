package com.lv.utils.frame {
	import flash.display.MovieClip;

	/**
	 * 给帧添加代码
	 * @author stevenlv
	 * @param target: 目标影片剪辑
	 * @param frame: 要添加的帧的帧标签或者帧数
	 * @param notify: 要添加当前帧的函数
	 * @throws 帧数不是正整数抛出错误
	 */
	public function lvAddFrameScript(target : MovieClip, frame : *, notify : Function) : Boolean {
		if (frame is String)
			frame = lvGetFrameNumberForLabel(target, frame);
		else if (!(frame is uint))
			throw new Error('frame');

		if (frame == -1 || frame == 0 || frame > target.totalFrames)
			return false;

		target.addFrameScript(frame - 1, notify);

		return true;
	}
}
