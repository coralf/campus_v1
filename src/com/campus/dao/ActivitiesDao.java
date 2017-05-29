package com.campus.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.swing.text.html.HTMLDocument.HTMLReader.PreAction;

import com.campus.entity.Activities;
import com.campus.entity.News;
import com.campus.utils.JdbcUtils;
import com.campus.utils.PageBean;
import com.campus.utils.StringUtils;

public class ActivitiesDao {

	public List<Activities> findByActivitiesId(int id) {
		List<Activities> activities = new ArrayList<Activities>();
		String sql = "SELECT * FROM Activities where activitiesId = ?";

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = JdbcUtils.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, id);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {

				activities.add(new Activities(resultSet.getInt(1), resultSet
						.getInt(2), resultSet.getInt(3),
						resultSet.getString(4), resultSet.getString(5),

						resultSet.getString(6), resultSet.getString(7),
						resultSet.getInt(8), resultSet.getString(9),
						StringUtils.dateFormat(resultSet.getString(10)),
						resultSet.getInt(11), resultSet.getInt(12), resultSet
								.getInt(13)));
			}

		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtils.close(connection, preparedStatement, resultSet);
		}
		return activities;
	}

	public Activities findById(int id) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM Activities where id = ? ";

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = JdbcUtils.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, id);
			resultSet = preparedStatement.executeQuery();

			resultSet.next();

			return new Activities(resultSet.getInt(1), resultSet.getInt(2),
					resultSet.getInt(3), resultSet.getString(4),
					resultSet.getString(5),

					resultSet.getString(6), resultSet.getString(7),
					resultSet.getInt(8), resultSet.getString(9),
					StringUtils.dateFormat(resultSet.getString(10)),
					resultSet.getInt(11), resultSet.getInt(12),
					resultSet.getInt(13));

		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtils.close(connection, preparedStatement, resultSet);

		}

	}

	public void page(PageBean<Activities> pageBean) {
		pageBean.setTotalCount(getCount());
		int pageCount = pageBean.getPageCount();
		int currentPage = pageBean.getCurrentPage();
		if(currentPage>pageBean.getTotalPage()){
			currentPage=pageBean.getTotalPage();
		}
		int count= pageCount*currentPage;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		String sql="select top "+count+"  * from Activities where id>5 order by starttime desc";
		ArrayList<Activities> activities = new ArrayList<Activities>();
		try {
			connection = JdbcUtils.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				activities.add(new Activities(resultSet.getInt(1), resultSet
						.getInt(2), resultSet.getInt(3),
						resultSet.getString(4), resultSet.getString(5),
						StringUtils.dateFormat(resultSet.getString(6)),
						StringUtils.dateFormat(resultSet.getString(7)),
						resultSet.getInt(8), resultSet.getString(9),
						StringUtils.dateFormat(resultSet.getString(10)),
						resultSet.getInt(11), resultSet.getInt(12), resultSet
								.getInt(13)));

			}
			pageBean.setPageData(activities);
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtils.close(connection, preparedStatement, resultSet);
		}
	}

	private int getCount() {

		String sql = "select count(*) from Activities";
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

	public void insert(Activities activities) {
		if(activities.getActivitieType()==null){
			activities.setActivitieType(1);
		}
		
		String sql="insert into Activities values(?,?,?,?,GETDATE(),default,0,?,default,default,default,default)";
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		ResultSet resultSet=null;
		try{
			connection=JdbcUtils.getConnection();
			preparedStatement= connection.prepareStatement(sql);
			preparedStatement.setInt(1, activities.getActivitiesId());
			preparedStatement.setInt(2, activities.getActivitieType());
			preparedStatement.setString(3, activities.getActivitiesTitle());
			preparedStatement.setString(4, activities.getActivitiesContent());
			preparedStatement.setString(5, activities.getActImg());
			preparedStatement.executeUpdate();
			
		}catch (Exception e) {
			// TODO: handle exception
		}finally{
			JdbcUtils.close(connection, preparedStatement, resultSet);
		}
	}
	

}
