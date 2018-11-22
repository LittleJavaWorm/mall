package pers.liyonghong.mall.service;

import java.sql.SQLException;

import org.junit.Test;

import pers.liyonghong.mall.beans.User;
import pers.liyonghong.mall.service.impl.UserServiceImpl;
import pers.liyonghong.mall.utils.UUIDGenerater;

/**
 * 用户service层测试类
 * @author Administrator
 *
 */
public class UserServiceTest {

	private UserService userService = new UserServiceImpl();
	
	@Test
	public void addUser() {
		try {
			User user = new User();
			user.setId(UUIDGenerater.getUUID());
			user.setUsername("李永宏"+System.currentTimeMillis());
			user.setGender(0);
			user.setPassword("dsgeagegegsg");
			user.setNickName("小李1989");
			user.setEmail("liyonghong9@huawwei.com");
			user.setAddress("dgesghehg");
			user.setCellPhoneNumber("sghedfhefhe");
			user.setBirthday("2018-12-4 12:11:34");
			user.setActivationCode("sgsgeyg");
			user.setIsActivated(0);
			user.setRegTime("2018-12-4 12:11:34");
			user.setHeadPortraitId("sdgsdg");
			user.setLastLoginTime("2018-12-4 12:11:34");
			user.setMemberLevel(1);
			
			int num= userService.addUser(user);
			System.out.println("num="+num);
			if(num != 1) {
				System.out.println("添加用户失败");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
