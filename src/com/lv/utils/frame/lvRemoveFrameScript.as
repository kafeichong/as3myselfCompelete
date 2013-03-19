package com.lv.utils.frame {
	import flash.display.MovieClip;

	/**
	 * 移除帧上面的代码
	 * @author stevenlv
	 * @param target: 目标影片剪辑
	 * @param frame: 要删除的帧的帧标签或者帧数
	 * @throws 帧数不是正整数抛出错误
	 */
	public function lvRemoveFrameScript(target : MovieClip, frame : *) : void {
		if (frame is String)
			frame = lvGetFrameNumberForLabel(target, frame);
		else if (!(frame is uint))
			throw new Error('frame');

		if (frame == -1 || frame == 0 || frame > target.totalFrames)
			return;

		target.addFrameScript(frame - 1, null);
	}
}
