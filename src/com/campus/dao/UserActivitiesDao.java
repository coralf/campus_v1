package com.campus.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.campus.entity.CommunityCountComment;
import com.campus.entity.UserActivities;
import com.campus.utils.JdbcUtils;

/**
 * 用户参加活动的信息记录表
 * */
public class UserActivitiesDao {

	public ArrayList<UserActivities> findByUserId(int id) {
		String sql = "select * from UserActivities where userId = ?";
		ArrayList<UserActivities> data = new ArrayList<UserActivities>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = JdbcUtils.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, id);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				data.add(new UserActivities(resultSet.getInt(1), resultSet
						.getInt(2), resultSet.getInt(3), resultSet.getString(4)));
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtils.close(connection, preparedStatement, resultSet);
		}

		return data;

	}

	public UserActivities findByUserIdActivitiesId(int userId, int acId) {

		String sql = "select * from UserActivities where userId = ? and activitiesId = ?";
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = JdbcUtils.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, userId);
			preparedStatement.setInt(2, acId);
			resultSet = preparedStatement.executeQuery();
			resultSet.next();
			return new UserActivities(resultSet.getInt(1), resultSet.getInt(2),
					resultSet.getInt(3), resultSet.getString(4));

		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtils.close(connection, preparedStatement, resultSet);
		}
	}
	
	public void insert(UserActivities ua){
		String sql = "INSERT INTO UserActivities VALUES(?,?,default)";
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = JdbcUtils.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, ua.getUserId());
			preparedStatement.setInt(2, ua.getActivitiesId());
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtils.close(connection, preparedStatement, resultSet);
		}
	}
	

}
