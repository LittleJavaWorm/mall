package pers.liyonghong.mall.service.impl;

import java.sql.SQLException;

import pers.liyonghong.mall.beans.User;
import pers.liyonghong.mall.dao.UserDao;
import pers.liyonghong.mall.dao.impl.UserDaoImpl;
import pers.liyonghong.mall.service.UserService;

/**
 * 用户业务层实现类
 * @author Administrator
 *
 */
public class UserServiceImpl implements UserService {
	
	private UserDao userDao = new UserDaoImpl();
	
	@Override
	public int addUser(User user) throws SQLException {
		return userDao.addUser(user);
	}

}
