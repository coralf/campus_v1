package com.campus.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.campus.entity.ActivityComment;
import com.campus.utils.JdbcUtils;
import com.campus.utils.StringUtils;

/*
 * 活动评论表
 * */
public class ActivityCommentDao {

	public List<ActivityComment> findByActId(int id) {

		String sql = "SELECT * FROM activityComment where id = ?";
		List<ActivityComment> activityComments = new ArrayList<ActivityComment>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = JdbcUtils.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, id);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				activityComments.add(new ActivityComment(resultSet.getInt(1),
						resultSet.getInt(2), resultSet.getString(3), StringUtils.dateFormat(resultSet
								.getString(4))));
			}

		} catch (Exception e) {
			throw new RuntimeException(e);

		} finally {
			JdbcUtils.close(connection, preparedStatement, resultSet);

		}
		return activityComments;

	}

	public List<ActivityComment> findByActIdLater(int id) {
		String sql = "SELECT * FROM activityComment where id = ? order by addtime desc";
		List<ActivityComment> activityComments = new ArrayList<ActivityComment>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = JdbcUtils.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, id);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				activityComments.add(new ActivityComment(resultSet.getInt(1),
						resultSet.getInt(2), resultSet.getString(3), StringUtils.dateFormat(resultSet
								.getString(4))));
			}

		} catch (Exception e) {
			throw new RuntimeException(e);

		} finally {
			JdbcUtils.close(connection, preparedStatement, resultSet);

		}
		return activityComments;
	}

}
