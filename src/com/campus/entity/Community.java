package com.campus.entity;

import java.util.List;


public class Community {
	
	private Integer id;
	private List<CommunityCountComment> communityCountComments;
	private Integer userId;
	private UserInfo userInfo;
	private String title;
	private String content;
	private String imgs;
	private String addtime;
	private Integer readCount;
	private Integer praiseCount;
	
	
	
	
	
	
	
	public List<CommunityCountComment> getCommunityCountComments() {
		return communityCountComments;
	}
	public void setCommunityCountComments(
			List<CommunityCountComment> communityCountComments) {
		this.communityCountComments = communityCountComments;
	}
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
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImgs() {
		return imgs;
	}
	public void setImgs(String imgs) {
		this.imgs = imgs;
	}
	public String getAddtime() {
		return addtime;
	}
	public void setAddtime(String addtime) {
		this.addtime = addtime;
	}
	public Integer getReadCount() {
		return readCount;
	}
	public void setReadCount(Integer readCount) {
		this.readCount = readCount;
	}
	public Integer getPraiseCount() {
		return praiseCount;
	}
	public void setPraiseCount(Integer praiseCount) {
		this.praiseCount = praiseCount;
	}
	public Community(Integer id, Integer userId, String title, String content,
			String imgs, String addtime, Integer readCount, Integer praiseCount) {
		super();
		this.id = id;
		this.userId = userId;
		this.title = title;
		this.content = content;
		this.imgs = imgs;
		this.addtime = addtime;
		this.readCount = readCount;
		this.praiseCount = praiseCount;
	}
	public Community() {
		super();
	}

	
	
	
	
}
