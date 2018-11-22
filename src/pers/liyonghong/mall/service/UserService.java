package pers.liyonghong.mall.service;

import java.sql.SQLException;

import pers.liyonghong.mall.beans.User;

/**
 * 用户业务层接口
 * @author Administrator
 *
 */
public interface UserService {
	
	int addUser(User user) throws SQLException; 
}
