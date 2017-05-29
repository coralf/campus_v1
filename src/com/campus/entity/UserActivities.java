package com.campus.entity;

/**
 * 用户参加活动的信息记录表
 * */
public class UserActivities {
	
	
	private Integer id;// INT PRIMARY KEY IDENTITY,--主键自增
	private Integer userId;// INT REFERENCES userInfo(id),--关联用户表ID
	private Integer activitiesId;// INT REFERENCES Activities(id),--关联活动表ID
	private String addtiem;// DATETIME DEFAULT GETDATE()--参加活动的时间
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
	public Integer getActivitiesId() {
		return activitiesId;
	}
	public void setActivitiesId(Integer activitiesId) {
		this.activitiesId = activitiesId;
	}
	public String getAddtiem() {
		return addtiem;
	}
	public void setAddtiem(String addtiem) {
		this.addtiem = addtiem;
	}
	public UserActivities() {
		super();
	}
	public UserActivities(Integer id, Integer userId, Integer activitiesId,
			String addtiem) {
		super();
		this.id = id;
		this.userId = userId;
		this.activitiesId = activitiesId;
		this.addtiem = addtiem;
	}

	
	
}
