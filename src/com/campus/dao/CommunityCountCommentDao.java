package com.campus.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.campus.entity.CommunityCountComment;
import com.campus.utils.JdbcUtils;

/*
 * 社区内容评论表
 * */
public class CommunityCountCommentDao {

	public List<CommunityCountComment> findByCommId(int commId) {

		List<CommunityCountComment> comments = new ArrayList<CommunityCountComment>();
		String sql = "select *from CommunityCountComment where commid = ?";
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = JdbcUtils.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, commId);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {

				comments.add(new CommunityCountComment(resultSet.getInt(1),
						resultSet.getInt(2), resultSet.getInt(3), resultSet
								.getString(4), resultSet.getString(5)));
			}

		} catch (Exception e) {
			throw new RuntimeException(e);

		} finally {
			JdbcUtils.close(connection, preparedStatement, resultSet);
		}
		return comments;
	}
	
	
	public void insert(CommunityCountComment ccc){
		String sql = "INSERT INTO CommunityCountComment VALUES(?,?,?,default)";
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = JdbcUtils.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, ccc.getCommid());
			preparedStatement.setInt(2, ccc.getUserId());
			preparedStatement.setString(3, ccc.getContent());
			preparedStatement.executeUpdate();
			
		} catch (Exception e) {
			throw new RuntimeException(e);

		} finally {
			JdbcUtils.close(connection, preparedStatement, resultSet);
		}
		
	}
	
}
