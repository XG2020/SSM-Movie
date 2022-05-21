package com.util;

import java.util.UUID;
/**
 * 唯一标识符
 */
public class UUIDUtil {

	public static String getUUID() {
		String str = UUID.randomUUID().toString();
		str = str.replace("-", "");
		return str;
	}
}
