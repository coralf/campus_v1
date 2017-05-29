package com.campus.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.campus.entity.UserInfo;
import com.campus.utils.JdbcUtils;
import com.campus.utils.PageBean;
import com.campus.utils.StringUtils;

/*
 * 用户信息表
 * */
public class UserInfoDao {

	public UserInfo findById(int id) {
		String sql = "SELECT * FROM userInfo where id=?";
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = JdbcUtils.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, id);
			resultSet = preparedStatement.executeQuery();
			resultSet.next();
			return new UserInfo(resultSet.getInt(1), resultSet.getString(2),
					resultSet.getString(3), resultSet.getString(4),
					resultSet.getString(5), resultSet.getInt(6),
					resultSet.getString(7), resultSet.getString(8),
					resultSet.getString(9), resultSet.getInt(10),
					resultSet.getInt(11), resultSet.getInt(12),
					resultSet.getString(13));

		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtils.close(connection, preparedStatement, resultSet);

		}

	}

	public int findByName(String username) {
		String sql = "SELECT count(*) FROM userInfo where userName = ?";
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = JdbcUtils.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, username);
			resultSet = preparedStatement.executeQuery();
			resultSet.next();
			return resultSet.getInt(1);
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtils.close(connection, preparedStatement, resultSet);

		}
	}

	public void insert(UserInfo userInfo) {
		String sql = "insert into UserInfo values(?,?,?,null,null,null,null,DEFAULT,null,null,0)";
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = JdbcUtils.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, userInfo.getUsername());
			preparedStatement.setString(2, userInfo.getPwd());
			preparedStatement.setString(3, userInfo.getEmail());
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtils.close(connection, preparedStatement, resultSet);

		}
	}

	public UserInfo findByEmail(String email) {
		// TODO Auto-generated method stub
		return null;
	}

	public void updateState(UserInfo user) {

	}

	public UserInfo login(UserInfo userInfo) {
		String sql = "SELECT * FROM userInfo where username = ? and pwd = ?";
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = JdbcUtils.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, userInfo.getUsername());
			preparedStatement.setString(2, userInfo.getPwd());
			resultSet = preparedStatement.executeQuery();
			resultSet.next();
			return new UserInfo(resultSet.getInt(1), resultSet.getString(2),
					resultSet.getString(3), resultSet.getString(4),
					resultSet.getString(5), resultSet.getInt(6),
					resultSet.getString(7), resultSet.getString(8),
					resultSet.getString(9), resultSet.getInt(10),
					resultSet.getInt(11), resultSet.getInt(12),
					resultSet.getString(13));

		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtils.close(connection, preparedStatement, resultSet);
		}
	}

	public void changeIcon(UserInfo userInfo) {
		String sql = "update UserInfo set UserIcon = ? where id =?";
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = JdbcUtils.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, userInfo.getUserIcon());
			preparedStatement.setInt(2, userInfo.getId());
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtils.close(connection, preparedStatement, resultSet);
		}
	}

	public void changeUesrInfo(UserInfo userInfo) {
		String sql = "update UserInfo set username = ? ,pwd = ? , sex = ? ,UserDes = ? where id = ?";
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = JdbcUtils.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, userInfo.getUsername());
			preparedStatement.setString(2, userInfo.getPwd());
			preparedStatement.setString(3, userInfo.getSex());
			preparedStatement.setString(4, userInfo.getUserDes());
			preparedStatement.setInt(5, userInfo.getId());
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtils.close(connection, preparedStatement, resultSet);
		}
	}

	public void page(PageBean<UserInfo> pageBean) {
		int currentPage = pageBean.getCurrentPage();
		pageBean.setTotalCount(getCount());
		int pageCount = pageBean.getPageCount();
		if(currentPage<1){
			currentPage=1;
			
		}
		if(currentPage>pageBean.getTotalPage()){
			currentPage=pageBean.getTotalPage();
		}
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		int index1 = pageCount;

		int index2 = pageCount * (currentPage - 1);

		String sql = "select top " + index1
				+ "* from UserInfo where id not in (select top " + index2
				+ " id from UserInfo order by id  ) order by id ";

		ArrayList<UserInfo> users = new ArrayList<UserInfo>();
		try {
			connection = JdbcUtils.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				users.add(new UserInfo(resultSet.getInt(1), resultSet
						.getString(2), resultSet.getString(3), resultSet
						.getString(4), resultSet.getString(5), resultSet
						.getInt(6), resultSet.getString(7), resultSet
						.getString(8),StringUtils.dateFormat(resultSet
						.getString(9)), resultSet.getInt(10), resultSet
						.getInt(11), resultSet.getInt(12), resultSet
						.getString(13)));
				
			}
			
			pageBean.setPageData(users);
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtils.close(connection, preparedStatement, resultSet);
		}

	}

	public int getCount() {
		String sql = "select count(*) from UserInfo";
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = JdbcUtils.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			resultSet.next();
			return resultSet.getInt(1);
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtils.close(connection, preparedStatement, resultSet);
		}
	}

	public void activeUser(int id) {
		String sql = "update UserInfo set state=1 where id = ?";
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = JdbcUtils.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, id);
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtils.close(connection, preparedStatement, resultSet);
		}
	}
	
	
	public void forbidUser(int id) {
		String sql = "update UserInfo set state=0 where id = ?";
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = JdbcUtils.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, id);
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtils.close(connection, preparedStatement, resultSet);
		}
	}

}
