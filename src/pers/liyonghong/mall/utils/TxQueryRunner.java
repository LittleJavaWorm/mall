package pers.liyonghong.mall.utils;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.junit.Test;

/**
 * 重写dbUtils QueryRunner类的方法
 * 
 * 添加代码： 1、建立连接 2、最后释放连接
 * 
 * @author Administrator
 *
 */
public class TxQueryRunner extends QueryRunner {

	/*
	 * 增删改查
	 * 
	 * 增： String sql = "insert into user value(?,?,?)"; Object [] ob =
	 * {"abc","ddd","rrrr"}; int update = qr.update(sql, ob);//插入成功返回1
	 * 
	 * 删： String sql = "delete from  user  where id=?"; Object [] ob = {39}; int
	 * update = rq.update(sql, ob);
	 * 
	 * 改： String sql = "update user set upsw=? where id=?"; Object [] ob =
	 * {"123",39}; int update = rq.update(sql, ob);
	 * 
	 * 查：
	 * 
	 * 普通查询： String sql = "select * from user"; List<User> query = rq.query(sql, new
	 * BeanListHandler<User>(User.class));
	 * 
	 * 条件查询： String sql = "select * from user where uid=?"; User query =
	 * rq.query(sql, new BeanHandler<User>(User.class), ob);
	 * 
	 * 数量查询： String sql = "select count(*) from user where upsw=?"; Object ob[]
	 * ={123}; Long count = (Long) rq.query(sql, new ScalarHandler(), ob);
	 * 
	 * Map映射查询： List<Map<String, Object>> query = rq.query(sql, new
	 * MapListHandler(), ob);
	 * 
	 * 要哪行就要返回哪里的结果集： List<Object> query = rq.query(sql, new
	 * ColumnListHandler("uname", ob);
	 * 
	 * 
	 */
	
	public TxQueryRunner() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TxQueryRunner(boolean pmdKnownBroken) {
		super(pmdKnownBroken);
		// TODO Auto-generated constructor stub
	}

	public TxQueryRunner(DataSource ds, boolean pmdKnownBroken) {
		super(ds, pmdKnownBroken);
		// TODO Auto-generated constructor stub
	}

	public TxQueryRunner(DataSource ds) {
		super(ds);
		// TODO Auto-generated constructor stub
	}


	/**
	 * 批处理操作 Connection 从 构造函数中的 DataSource 参数中获取 该 Connection 必须处于自动提交模式，否则更新将不会被保存
	 */
	@Override
	public int[] batch(String sql, Object[][] params) throws SQLException {
		Connection conn = JdbcC3P0Utils.getConnection();
		int[] result = super.batch(sql, params);
		JdbcC3P0Utils.release(conn);
		return result;
	}



	/**
	 * 执行一个带有替换参数的SQL SELECT查询 调用者负责关闭连接 T：处理器返回对象的类型 conn：自己写代码实现 sql：执行的查询语句
	 * rsh：将ResultSet 转换为其他对象的处理器 params：可变参数列表，用于替换sql语句中的占位符 由 ResultSetHandler
	 * 负责返回相应对象 数据库访问出错则抛出 SQLException 异常
	 */
	@Override
	public <T> T query(String sql, ResultSetHandler<T> rsh, Object... params) throws SQLException {
		Connection conn = JdbcC3P0Utils.getConnection();
		T result = super.query(sql, rsh, params);
		JdbcC3P0Utils.release(conn);
		return result;
	}

	@Override
	public <T> T query(String sql, ResultSetHandler<T> rsh) throws SQLException {
		Connection conn = JdbcC3P0Utils.getConnection();
		T result = super.query(sql, rsh);
		JdbcC3P0Utils.release(conn);
		return result;
	}

	/**
	 * 执行 SQL INSERT, UPDATE, 或者 DELETE 操作 返回更新的行数
	 */
	@Override
	public int update(String sql) throws SQLException {
		Connection conn = JdbcC3P0Utils.getConnection();
		int result = super.update(sql);
		JdbcC3P0Utils.release(conn);
		return result;
	}

	@Override
	public int update(String sql, Object param) throws SQLException {
		Connection conn = JdbcC3P0Utils.getConnection();
		int result = super.update(sql, param);
		JdbcC3P0Utils.release(conn);
		return result;
	}

	@Override
	public int update(Connection conn, String sql, Object... params) throws SQLException {

		int result = super.update(sql, params);
		JdbcC3P0Utils.release(conn);
		return result;
	}

	/**
	 * 执行给定的SQL插入语句
	 */
	@Override
	public <T> T insert(String sql, ResultSetHandler<T> rsh) throws SQLException {
		Connection conn = JdbcC3P0Utils.getConnection();
		T result = super.insert(sql, rsh);
		JdbcC3P0Utils.release(conn);
		return result;
	}

	@Override
	public <T> T insert(String sql, ResultSetHandler<T> rsh, Object... params) throws SQLException {
		Connection conn = JdbcC3P0Utils.getConnection();
		T result = super.insert(sql, rsh, params);
		JdbcC3P0Utils.release(conn);
		return result;
	}

	/**
	 * 测试 QueryRunner 类的 insert 方法
	 */
	@Test
	public void testQueryRunnerInsert() {
		Connection connection = null;
		String sql = "INSERT INTO persons(name, age, birth, email) VALUES(?, ?, ?, ?)";

		try {
			connection = JdbcC3P0Utils.getConnection();
			Object[] args = { "测试", 99, new java.sql.Date(new Date().getTime()), "tmd@qq.com" };
			// 返回插入数据的主键
			Long id = insert(connection, sql, new ScalarHandler<Long>(), args);
			System.out.println(id);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbUtils.closeQuietly(connection);
		}
	}

	/**
	 * 执行给定的多个插入SQL语句
	 */
	@Override
	public <T> T insertBatch(String sql, ResultSetHandler<T> rsh, Object[][] params) throws SQLException {
		Connection conn = JdbcC3P0Utils.getConnection();
		T result = super.insertBatch(sql, rsh, params);
		JdbcC3P0Utils.release(conn);
		return result;
	}

}
