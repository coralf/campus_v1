package com.campus.entity;

import java.util.List;



public class NewsComment {
	

	private Integer id;
	private Integer newsId;
	private Integer userId;
	private UserInfo userInfo;
	
	private String content;
	private String addtime;
	
	
	
	
	
	
	public UserInfo getUserInfo() {
		return userInfo;
	}
	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getNewsId() {
		return newsId;
	}
	public void setNewsId(Integer newsId) {
		this.newsId = newsId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAddtime() {
		return addtime;
	}
	public void setAddtime(String addtime) {
		this.addtime = addtime;
	}
	public NewsComment(Integer id, Integer newsId, Integer userId,
			String content, String addtime) {
		super();
		this.id = id;
		this.newsId = newsId;
		this.userId = userId;
		this.content = content;
		this.addtime = addtime;
	}
	public NewsComment() {
		super();
	}
	
	

}
