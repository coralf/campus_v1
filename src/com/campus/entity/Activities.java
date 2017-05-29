package com.campus.entity;

import java.util.List;

/**
 * 
 * 活动信息表
 * */
public class Activities {

	private Integer id;
	private Integer activitiesId;// 关联管理员表ID
	private UserInfo userInfo;
	private Integer activitieType;// 关联活动类型表ID
	private String activitiesTitle;// 活动标题
	private String activitiesContent;//活动的具体内容
	private String starttime;// 活动开始时间
	private String endtime;// 活动结束时间
	private Integer activitynumber;// 该活动参与人数
	private String actImg;// 举办该活动的宣传图片路径
	private String actIssueTime;// 发布该活动的时间
	private Integer readCount;// 该活动点击量
	private Integer praiseCount;// 活动赞同次数
	private Integer isEnd;
	private List< ActivityComment> activityComment;
	
	
	

	
	

	public UserInfo getUserInfo() {
		return userInfo;
	}
	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}
	public List<ActivityComment> getActivityComment() {
		return activityComment;
	}
	public void setActivityComment(List<ActivityComment> activityComment) {
		this.activityComment = activityComment;
	}
	public Integer getIsEnd() {
		return isEnd;
	}
	public void setIsEnd(Integer isEnd) {
		this.isEnd = isEnd;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getActivitiesId() {
		return activitiesId;
	}
	public void setActivitiesId(Integer activitiesId) {
		this.activitiesId = activitiesId;
	}
	public Integer getActivitieType() {
		return activitieType;
	}
	public void setActivitieType(Integer activitieType) {
		this.activitieType = activitieType;
	}
	public String getActivitiesTitle() {
		return activitiesTitle;
	}
	public void setActivitiesTitle(String activitiesTitle) {
		this.activitiesTitle = activitiesTitle;
	}
	public String getActivitiesContent() {
		return activitiesContent;
	}
	public void setActivitiesContent(String activitiesContent) {
		this.activitiesContent = activitiesContent;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public Integer getActivitynumber() {
		return activitynumber;
	}
	public void setActivitynumber(Integer activitynumber) {
		this.activitynumber = activitynumber;
	}
	public String getActImg() {
		return actImg;
	}
	public void setActImg(String actImg) {
		this.actImg = actImg;
	}
	public String getActIssueTime() {
		return actIssueTime;
	}
	public void setActIssueTime(String actIssueTime) {
		this.actIssueTime = actIssueTime;
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
	public Activities(Integer id, Integer activitiesId, Integer activitieType,
			String activitiesTitle, String activitiesContent, String starttime,
			String endtime, Integer activitynumber, String actImg,
			String actIssueTime, Integer readCount, Integer praiseCount,Integer isEnd) {
		super();
		this.id = id;
		this.activitiesId = activitiesId;
		this.activitieType = activitieType;
		this.activitiesTitle = activitiesTitle;
		this.activitiesContent = activitiesContent;
		this.starttime = starttime;
		this.endtime = endtime;
		this.activitynumber = activitynumber;
		this.actImg = actImg;
		this.actIssueTime = actIssueTime;
		this.readCount = readCount;
		this.praiseCount = praiseCount;
		this.isEnd=isEnd;
	}
	public Activities() {
		super();
	}
	
	
	
	
}
