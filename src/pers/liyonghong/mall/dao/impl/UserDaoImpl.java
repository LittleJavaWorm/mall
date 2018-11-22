package pers.liyonghong.mall.dao.impl;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;

import pers.liyonghong.mall.beans.User;
import pers.liyonghong.mall.dao.UserDao;
import pers.liyonghong.mall.utils.JdbcC3P0Utils;
import pers.liyonghong.mall.utils.TxQueryRunner;

/**
 * 用户Dao层实现类
 * @author Administrator
 */
public class UserDaoImpl implements UserDao {

	private QueryRunner qr = new TxQueryRunner(JdbcC3P0Utils.getDataSource());
	
	@Override
	public int addUser(User user) throws SQLException {
		
		String sql = "INSERT INTO T_USER(id, name, gender, password,nickName,email,address,cellPhoneNumber,birthday,activationCode,isActivated,regTime,headPortraitId," + 
				"lastLoginTime,memberLevel) VALUES(?, ?, ?, ?,?,?, ?, ?, ?,?,?, ?, ?, ?,?)";
		
		//不允许为空的参数：name  password nickName email (建议放在Controller)
//		if(user == null || StringUtils.isEmpty(user.getUsername()) || StringUtils.isEmpty(user.getPassword()) ||
//				StringUtils.isEmpty(user.getNickName()) || StringUtils.isEmpty(user.getEmail())) {
//			return 0;
//		}
		Object[] params = {user.getId(),user.getUsername(),user.getGender(),user.getPassword(),user.getNickName(),
				user.getEmail(),user.getAddress(),user.getCellPhoneNumber(),user.getBirthday(),user.getActivationCode(),
				user.getIsActivated(),user.getRegTime(),user.getHeadPortraitId(),user.getLastLoginTime(),user.getMemberLevel()}; 
		
		int num = qr.update(sql, params);
		return num;
	}
}
