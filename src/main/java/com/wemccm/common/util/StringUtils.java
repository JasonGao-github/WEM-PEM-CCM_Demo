package com.wemccm.common.util;

public class StringUtils {

	public static boolean isNull(String s) {

		if (null == s) {
			return true;
		}
		if (0 == s.length()) {
			return true;
		}

		return false;

	}

}
