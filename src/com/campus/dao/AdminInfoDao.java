package com.campus.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.campus.entity.AdminInfo;
import com.campus.utils.JdbcUtils;

/*
 * 管理员信息表
 * */
public class AdminInfoDao {

	public AdminInfo findById(int id) {
		String sql = "select *from  AdminInfo where id = ?";

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {

			connection = JdbcUtils.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, id);
			resultSet = preparedStatement.executeQuery();
			resultSet.next();
			return new AdminInfo(resultSet.getInt(1), resultSet.getString(2),
					resultSet.getString(3));
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtils.close(connection, preparedStatement, resultSet);
		}

	}

	public AdminInfo login(AdminInfo adminInfo) {
		String sql="select *from AdminInfo where name=?  and pwd = ?";
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {

			connection = JdbcUtils.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, adminInfo.getName());
			preparedStatement.setString(2, adminInfo.getPwd());
			resultSet = preparedStatement.executeQuery();
			resultSet.next();
			return new AdminInfo(resultSet.getInt(1), resultSet.getString(2),
					resultSet.getString(3));
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtils.close(connection, preparedStatement, resultSet);
		}
		
	}
}
