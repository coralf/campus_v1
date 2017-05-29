package com.campus.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.swing.text.html.HTMLDocument.HTMLReader.PreAction;

import com.campus.entity.NewsComment;
import com.campus.utils.JdbcUtils;

/*
 * 新闻评论表
 * */
public class NewsCommentDao {

	public List<NewsComment> findByNewsId(int id) {
		String sql = "select *from newsComment where newsId=?";
		List<NewsComment> data = new ArrayList<NewsComment>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = JdbcUtils.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, id);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {

				data.add(new NewsComment(resultSet.getInt(1), resultSet
						.getInt(2), resultSet.getInt(3),
						resultSet.getString(4), resultSet.getString(5)));
			}

		} catch (Exception e) {
			throw new RuntimeException(e);

		} finally {
			JdbcUtils.close(connection, preparedStatement, resultSet);
		}
		return data;

	}
}
