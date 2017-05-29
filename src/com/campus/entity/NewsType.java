package com.campus.entity;


public class NewsType {
	private Integer id;
	private String newsType;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNewsType() {
		return newsType;
	}
	public void setNewsType(String newsType) {
		this.newsType = newsType;
	}
	public NewsType(Integer id, String newsType) {
		super();
		this.id = id;
		this.newsType = newsType;
	}
	public NewsType() {
		super();
	}
	
	

}
