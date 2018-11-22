package pers.liyonghong.mall.utils;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;


/**
 * JDBC工具类，采用c3p0实现数据库连接池
 * @author Administrator
 *
 */
public class JdbcC3P0Utils {
	
	//如果c3p0配置文件不是放在classpath根目录下 可以通过以下方法声明
	//System.setProperty("com.mchange.v2.c3p0.cfg.xml", this.getClass().getClassLoader().getResource("").getPath() + "/package/c3p0-config.xml");
	//数据源
	private static DataSource ds = new ComboPooledDataSource();
	
	//本地线程,解决线程安全问题
	private static ThreadLocal<Connection> tl = new ThreadLocal<>();
	
	/**
	 *采用 饿汉式获取 DataSource对象
	 */
	public static DataSource getDataSource() {
		return ds;
	}
	
	/**
	 * 获取Connection对象
	 * 如果有事务(即当前线程有Connection对象)，返回当前事务的con
     * 如果没有事务，通过连接池返回新的con
	 * @return
	 * @throws SQLException 
	 */
	public static Connection getConnection() throws SQLException {
		
		//获取当前线程的事务连接
		Connection conn = tl.get();
		if(conn == null) {
			conn = ds.getConnection();
		}
		return conn;
	}
	
	/**
	 * 释放当前线程连接
	 * @throws SQLException 
	 */
	public static void release(Connection conn) throws SQLException {
		//获取当前事务连接
		Connection connection = tl.get();
		//如果入参连接不是当前事务连接，则可以关闭入参连接
		if(conn != connection) {
			if(conn != null && !conn.isClosed()) {
				conn.close();
			}
		}
	}
	
	/**
	 * 开启事务（将Connention对象放入本地线程）
	 * @throws SQLException 
	 */
	public static void beginTransaction() throws SQLException {
		
		Connection conn = tl.get();
		if(conn != null) {
			throw new SQLException("事务已开启，不能重复开启事务。");
		}
		//给con赋值，表示开启了事务
		conn = ds.getConnection();
		
		//设置为手动提交	
		conn.setAutoCommit(false);	
		
		//把当前事务连接放到本地线程中
		tl.set(conn);
	}
	
	/**
	 * 提交事务（将sql执行结果提交到数据库，让变动生效，并将当前事务连接关闭、本地线程置空）
	 * @throws SQLException 
	 */
	public static void commitTransaction() throws SQLException {
		Connection conn = tl.get();
		if(conn == null) {
			throw new SQLException("本地事务连接为空，不能进行事务提交操作。");
		}
		//提交事务
		conn.commit();
		//关闭当前事务连接
		conn.close();
		conn = null;
		//将本地线程置空
		tl.remove();
	}
	
	/**
	 * 回滚事务（目的：保证数据库数据一致性）
	 * 同时将当前线程连接关闭，当前线程置空
	 * @throws SQLException 
	 */
	public static void rollBackTransaction() throws SQLException {
		Connection conn = tl.get();
		if(conn == null) {
			throw new SQLException("当前连接为空，不能进行事务回滚。");
		}
		conn.rollback();
		conn.close();
		conn = null;
		tl.remove();
	}
	

}
