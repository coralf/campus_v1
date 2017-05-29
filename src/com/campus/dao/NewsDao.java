package com.campus.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import com.campus.entity.News;
import com.campus.entity.NewsType;
import com.campus.entity.UserInfo;
import com.campus.utils.JdbcUtils;
import com.campus.utils.PageBean;
import com.campus.utils.StringUtils;

/**
 * 
 * 新闻
 * 
 * */
public class NewsDao {

	public List<News> getData() {
		List<News> data = new ArrayList<News>();
		String sql = "select * from News";
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = JdbcUtils.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				data.add(new News(resultSet.getInt(1), resultSet.getInt(2),
						resultSet.getInt(3), resultSet.getString(4), resultSet
								.getString(5), resultSet.getString(6),
						resultSet.getString(7), resultSet.getInt(8), resultSet
								.getInt(9)));
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return data;
	}

	public List<News> findByTypeId(int id) {

		List<News> data = new ArrayList<News>();
		String sql = "select * from News where newsTypeId = ?";
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = JdbcUtils.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, id);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				data.add(new News(resultSet.getInt(1), resultSet.getInt(2),
						resultSet.getInt(3), resultSet.getString(4), resultSet
								.getString(5), resultSet.getString(6),
						resultSet.getString(7), resultSet.getInt(8), resultSet
								.getInt(9)));
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return data;
	}


	public News findById(int id) {
		String sql = "select * from News where id = ?";
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = JdbcUtils.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, id);
			resultSet = preparedStatement.executeQuery();
			resultSet.next();
			return new News(resultSet.getInt(1), resultSet.getInt(2),
					resultSet.getInt(3), resultSet.getString(4),
					resultSet.getString(5), resultSet.getString(6),
					resultSet.getString(7), resultSet.getInt(8),
					resultSet.getInt(9));
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public void page(PageBean<News> pageBean) {

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
				+ "* from News where id not in (select top " + index2
				+ " id from News order by id  ) order by id ";

		ArrayList<News> news = new ArrayList<News>();
		try {
			connection = JdbcUtils.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				news.add(new News(resultSet.getInt(1), resultSet.getInt(2),
						resultSet.getInt(3), resultSet.getString(4), resultSet
						.getString(5), resultSet.getString(6),StringUtils.dateFormat(
				resultSet.getString(7)), resultSet.getInt(8), resultSet
						.getInt(9)));
				
			}
			
			pageBean.setPageData(news);
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtils.close(connection, preparedStatement, resultSet);
		}
	}

	private int getCount() {
		String sql = "select count(*) from News";
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

	public void addNews(News news) {
		String sql = "insert into  News values(?,?,?,?,?,DEFAULT,DEFAULT,DEFAULT)";
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = JdbcUtils.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, news.getNewsTypeId());
			preparedStatement.setInt(2, news.getUserId());
			preparedStatement.setString(3, news.getNewsTitle());
			preparedStatement.setString(4, news.getNewsContent());
			preparedStatement.setString(5, news.getNewsImg());
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtils.close(connection, preparedStatement, resultSet);
		}
	}

}
