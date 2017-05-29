package com.campus.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.swing.text.html.HTMLDocument.HTMLReader.PreAction;

import org.junit.Test;

import com.campus.entity.Community;
import com.campus.utils.JdbcUtils;
import com.campus.utils.PageBean;
import com.campus.utils.StringUtils;

/*
 * 社区
 * */
public class CommunityDao {

	
	public List<Community> getCommunities(){
		String sql="select *from Community";
		List<Community> communities=new ArrayList<Community>();
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		ResultSet resultSet=null;
		try{
			connection=JdbcUtils.getConnection();
			preparedStatement=connection.prepareStatement(sql);
			resultSet=preparedStatement.executeQuery();
			while(resultSet.next()){
				Community community = new Community(resultSet.getInt(1), resultSet.getInt(2), 
						resultSet.getString(3), resultSet.getString(4), 
						resultSet.getString(5), StringUtils.dateFormat(resultSet.getString(6)),
						resultSet.getInt(7), resultSet.getInt(8));
				communities.add(community);
			}
		}catch(Exception e){
			throw new RuntimeException(e);
			
		}finally{
			JdbcUtils.close(connection, preparedStatement, resultSet);
		}
		
		return communities;
	}
	public PageBean<Community> getPageBean(PageBean<Community> pageBean){
		
		pageBean.setTotalCount(getCount());
		int pageCount = pageBean.getPageCount();
		int currentPage = pageBean.getCurrentPage();
		int count= pageCount*currentPage;
		
		
		String sql="select top "+count+"  * from Community order by addtime desc ";
		List<Community> communities=new ArrayList<Community>();
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		ResultSet resultSet=null;
		try{
			connection=JdbcUtils.getConnection();
			preparedStatement=connection.prepareStatement(sql);
			resultSet=preparedStatement.executeQuery();
			while(resultSet.next()){
				Community community = new Community(resultSet.getInt(1), resultSet.getInt(2), 
						resultSet.getString(3), resultSet.getString(4), 
						resultSet.getString(5), StringUtils.dateFormat(resultSet.getString(6)),
						resultSet.getInt(7), resultSet.getInt(8));
				communities.add(community);
			}
		}catch(Exception e){
			throw new RuntimeException(e);
			
		}finally{
			JdbcUtils.close(connection, preparedStatement, resultSet);
		}
		
		pageBean.setPageData(communities);
		return  pageBean;
		
		
		
		
		
		
	}
	
	
	public int getCount(){
		String sql="select count(*)from Community";
		
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		ResultSet resultSet=null;
		
		try{
			connection=JdbcUtils.getConnection();
			preparedStatement=connection.prepareStatement(sql);
			resultSet=preparedStatement.executeQuery();
			resultSet.next();
			return resultSet.getInt(1);
		}catch(Exception e){
			throw new RuntimeException(e);
		}finally{
			JdbcUtils.close(connection, preparedStatement, resultSet);
		}
	}
	public void insertCommunity(Community community) {
		String sql="insert into Community values(?,?,?,?,DEFAULT,DEFAULT,DEFAULT)";
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		ResultSet resultSet=null;
		try{
			connection=JdbcUtils.getConnection();
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setInt(1, community.getUserId());
			preparedStatement.setString(2, community.getTitle());
			preparedStatement.setString(3, community.getContent());
			preparedStatement.setString(4, community.getImgs());
			preparedStatement.executeUpdate();
		}catch(Exception e){
			throw new RuntimeException(e);
		}finally{
			JdbcUtils.close(connection, preparedStatement, resultSet);
		}
	}
	
	

	/**
	 * 通过用户ID查询在闲换社区的动态
	 * @param id
	 * @return 
	 */
	public List<Community> findByUserId(int id){
		String sql="SELECT * FROM Community where userId ="+id;
		List<Community> list=new ArrayList<Community>();
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		ResultSet resultSet=null;
		try{
			
			connection=JdbcUtils.getConnection();
			preparedStatement=connection.prepareStatement(sql);
			resultSet=preparedStatement.executeQuery();
			
			while(resultSet.next()){
				Community community = new Community(resultSet.getInt(1), resultSet.getInt(2), 
						resultSet.getString(3), resultSet.getString(4), 
						resultSet.getString(5), StringUtils.dateFormat(resultSet.getString(6)),
						resultSet.getInt(7), resultSet.getInt(8));
				list.add(community);
			}
		}catch(Exception e){
			throw new RuntimeException(e);
			
		}finally{
			JdbcUtils.close(connection, preparedStatement, resultSet);
		}
		return list;
	}
}
