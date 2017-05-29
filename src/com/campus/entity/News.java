package com.campus.entity;

import java.util.List;



public class News {
	
	private Integer id;
    private Integer	newsTypeId;
	private Integer userId ;
	private UserInfo userInfo;
	private String newsTitle;
	private String newsContent;
	private String newsImg;
	private String publishDate ;
	private Integer readCount;
	private Integer praiseCount;
	private NewsType newsType;
	private List< NewsComment> newsComment;
	
	private Integer newsCommentSize;
	

	public Integer getNewsCommentSize() {
		return newsComment!=null?newsComment.size():0;
	}
	public void setNewsCommentSize(Integer newsCommentSize) {
		this.newsCommentSize = newsCommentSize;
	}
	public UserInfo getUserInfo() {
		return userInfo;
	}
	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public List<NewsComment> getNewsComment() {
		return newsComment;
	}
	public void setNewsComment(List<NewsComment> newsComment) {
		this.newsComment = newsComment;
	}
	public NewsType getNewsType() {
		return newsType;
	}
	public void setNewsType(NewsType newsType) {
		this.newsType = newsType;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getNewsTypeId() {
		return newsTypeId;
	}
	public void setNewsTypeId(Integer newsTypeId) {
		this.newsTypeId = newsTypeId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getNewsTitle() {
		return newsTitle;
	}
	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}
	public String getNewsContent() {
		return newsContent;
	}
	public void setNewsContent(String newsContent) {
		this.newsContent = newsContent;
	}
	public String getNewsImg() {
		return newsImg;
	}
	public void setNewsImg(String newsImg) {
		this.newsImg = newsImg;
	}
	public String getPublishDate() {
		return publishDate;
	}
	public void setPublishDate(String publishDate) {
		this.publishDate = publishDate;
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
	public News(Integer id, Integer newsTypeId, Integer userId,
			String newsTitle, String newsContent, String newsImg,
			String publishDate, Integer readCount, Integer praiseCount) {
		super();
		this.id = id;
		this.newsTypeId = newsTypeId;
		this.userId = userId;
		this.newsTitle = newsTitle;
		this.newsContent = newsContent;
		this.newsImg = newsImg;
		this.publishDate = publishDate;
		this.readCount = readCount;
		this.praiseCount = praiseCount;
	}
	public News() {
		super();
	}
	
	
	
	

}
