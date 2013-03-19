package com.lv.utils.library {
	/**
	 * @author stevenlv
	 *   从影片剪辑库中得到影片剪辑绑定的类
	 *   @param 得到影片剪辑的名称
	 *   @return 给定的类名称不存在或类为空
	 */
	public function getClassFromLibrary(className:String) : Class {
		try {
			return Class(this.loaderInfo.applicationDomain.getDefinition(className));
		}
		catch (refErr:ReferenceError) {
			return null;
		}
		catch (typeErr:TypeError) {
			return null;
		}

		return null;
	}
}
