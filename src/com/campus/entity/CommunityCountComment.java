package com.campus.entity;



public class CommunityCountComment {

	private Integer id;
	private Integer commid;
	private Integer userId;
	private String content;
	private String addtime;
	private UserInfo userInfo;
	
	
	
	
	
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
	public Integer getCommid() {
		return commid;
	}
	public void setCommid(Integer commid) {
		this.commid = commid;
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
	public CommunityCountComment(Integer id, Integer commid, Integer userId,
			String content, String addtime) {
		super();
		this.id = id;
		this.commid = commid;
		this.userId = userId;
		this.content = content;
		this.addtime = addtime;
	}
	public CommunityCountComment() {
		super();
	}
	
	
	
}
