package com.campus.service;

import java.util.ArrayList;
import java.util.List;

import com.campus.dao.ActivitiesDao;
import com.campus.dao.ActivityCommentDao;
import com.campus.dao.AdminInfoDao;
import com.campus.dao.UserActivitiesDao;
import com.campus.dao.UserInfoDao;
import com.campus.entity.Activities;
import com.campus.entity.ActivityComment;
import com.campus.entity.UserActivities;
import com.campus.entity.UserInfo;
import com.campus.utils.PageBean;

public class ActivitiService {

	private ActivitiesDao activitiesDao = new ActivitiesDao();
	private ActivityCommentDao activityCommentDao = new ActivityCommentDao();
	private UserInfoDao userInfoDao = new UserInfoDao();
	
	
	
	private UserActivitiesDao userActivitiesDao=new UserActivitiesDao();
	
	public List<Activities> findByActivitiesId(int id) {
		return activitiesDao.findByActivitiesId(id);
	}

	public Activities findById(int id) {

		Activities activities = activitiesDao.findById(id);

		activities.setActivityComment(activityCommentDao.findByActId(activities
				.getId()));

		List<ActivityComment> activityComments = activities
				.getActivityComment();

		for (ActivityComment activityComment : activityComments) {

			activityComment.setUserInfo(userInfoDao.findById(activityComment
					.getUserId()));
		}
		activities.setUserInfo(userInfoDao.findById(activities
				.getActivitiesId()));

		return activities;
	}
	public void tpi(UserActivities ua){
		userActivitiesDao.insert(ua);
	}
	
	
	public UserActivities isTpi(int acId,int uId){
		return  userActivitiesDao.findByUserIdActivitiesId(uId, acId);
	}

	public List<ActivityComment> laterComment(int id) {
		
		List<ActivityComment> activityComments = activityCommentDao.findByActIdLater(id);
		
		for (ActivityComment activityComment : activityComments) {
			activityComment.setUserInfo(userInfoDao.findById(activityComment
					.getUserId()));
		}
		
		
		return activityComments;
		
		
	}

	public void page(PageBean<Activities> pageBean) {
		activitiesDao.page(pageBean);
		List<Activities> pageData = pageBean.getPageData();
		for (Activities activities : pageData) {
			Integer activitiesId = activities.getActivitiesId();
			activities.setUserInfo(userInfoDao.findById(activitiesId));
		}
		
	}

	public void insert(Activities activities) {
		activitiesDao.insert(activities);
	}
	
	public List<Activities> findMyJoinAct(UserInfo userInfo){
		List<UserActivities> userActivities = userActivitiesDao.findByUserId(userInfo.getId());
		ArrayList<Activities> userJoinAct = new ArrayList<Activities>();
		for (UserActivities ua : userActivities) {
			userJoinAct.add(activitiesDao.findById(ua.getActivitiesId()));
		}
		return  userJoinAct;
	}
	
}
