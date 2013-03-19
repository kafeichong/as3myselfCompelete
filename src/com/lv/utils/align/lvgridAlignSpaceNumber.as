package com.lv.utils.align {
	/**
	 * @author kafeichong
	 * 把数组中元素按照等间距排列网格
	 * @param items：排列数组
	 * @param rows:行数
	 * @param cols:列数
	 * @param spacing：间距
	 * @example：lvgridAlignSpaceNumber( [ clip0, clip1, clip2], 10 );
	 * 
	 */
	public function lvgridAlignSpaceNumber(items : Array, rows : Number, cols : Number, spacing : Number = 0) : void {
		//记录当前添加数
		var col : Number = 0;
		var row : Number = 1;
		var yPos : Number = 0;
		var xPos : Number = 0;
		var maxHeightCurrentRow : Number = 0;
		var maxHeightPreviousRow : Number = 0;
		var n : int = items.length;

		for (var i : Number = 0; i < n; i++) {
			if (row <= rows) {
				items[i].x = xPos;
				trace(items[i].x )

				if (col == (cols - 1)) {
					xPos = 0;
					//当前行加一
					row++;
				} else {
					
					xPos += items[(i)].width + spacing;
					trace("xPos:"+xPos)
					trace("items[(i)].width:"+items[(i)].width)
				}

				if (col == cols) {
					col = 0;

					/*
					 * Get the max item height from previous row
					 */
					maxHeightPreviousRow = maxHeightCurrentRow;
					maxHeightCurrentRow = items[(i)].height;

					yPos += maxHeightPreviousRow + spacing;
				} else {
					/*
					 * Calculate the max item height from previous row
					 */
					maxHeightCurrentRow = Math.max(maxHeightCurrentRow, items[(i)].height);
				}
				items[i].y = yPos;

				col++;
			} else {
				break;
			}
		}
	}
}