package pers.liyonghong.mall.utils;

import java.util.UUID;

/**
 * 32位UUID生成类
 * @author Administrator
 *
 */
public class UUIDGenerater {

	public static String getUUID() {
		return UUID.randomUUID().toString().replace("-", "");
	}
}
