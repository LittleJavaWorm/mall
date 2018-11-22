package pers.liyonghong.mall.dao;

import java.sql.SQLException;

import pers.liyonghong.mall.beans.User;

/**
 * 用户Dao层
 * @author Administrator
 *
 */
public interface UserDao {

	/**
	 * 新增用户
	 * @param user 用户对象
	 * @return 1-成功
	 * @throws SQLException 
	 */
	int addUser(User user) throws SQLException;
	
}
