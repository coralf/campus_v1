package com.campus.entity;
/**
 活动类型表
 * */
public class ActivitieType {
	
	private Integer id ;
	private String activitytype;//活动类型
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getActivitytype() {
		return activitytype;
	}
	public void setActivitytype(String activitytype) {
		this.activitytype = activitytype;
	}
	public ActivitieType(Integer id, String activitytype) {
		super();
		this.id = id;
		this.activitytype = activitytype;
	}
	public ActivitieType() {
		super();
	}
	
	
	
}
