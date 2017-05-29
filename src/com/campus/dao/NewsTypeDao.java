package com.campus.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.junit.Test;

import com.campus.entity.NewsType;
import com.campus.utils.JdbcUtils;

/*
 * 新闻类型
 * */
public class NewsTypeDao {

	public int getCount() {
		String sql = "select count(*) from NewsType";
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
		}

	}

	@Test
	public void testGetCount() throws Exception {
		System.out.println(getCount());
	}

	public List<NewsType> getData() {
		List<NewsType> data = new ArrayList<NewsType>();
		String sql = "select * from NewsType";
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = JdbcUtils.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				data.add(new NewsType(resultSet.getInt(1), resultSet
						.getString(2)));
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return data;
	}

	public NewsType findById(int id) {
		String sql = "select * from NewsType where id=?";
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = JdbcUtils.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, id);
			resultSet = preparedStatement.executeQuery();
			resultSet.next();
			return new NewsType(resultSet.getInt(1), resultSet.getString(2));
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

	}

}
