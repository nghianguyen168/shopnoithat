package com.doan.noithat.utils;

import com.doan.noithat.constants.GlobalsConstant;

public class PaginationUtil {

	public static int getOffset(int currentPage) {
		return (currentPage -1 ) * GlobalsConstant.LIMIT_PAGE;
	}
	
	public static int getOffset(int currentPage ,int limit) {
		return (currentPage -1 ) * limit;
	}
}
 