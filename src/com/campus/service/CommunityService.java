package com.campus.service;

import java.util.List;

import com.campus.dao.CommunityCountCommentDao;
import com.campus.dao.CommunityDao;
import com.campus.dao.UserInfoDao;
import com.campus.entity.Community;
import com.campus.entity.CommunityCountComment;
import com.campus.utils.PageBean;

public class CommunityService {
	private CommunityDao communityDao = new CommunityDao();
	private UserInfoDao userInfoDao = new UserInfoDao();
	private CommunityCountCommentDao communityCountCommentDao = new CommunityCountCommentDao();

	public List<Community> getCommunities() {

		List<Community> communities = communityDao.getCommunities();
		for (Community community : communities) {
			community.setUserInfo(userInfoDao.findById(community.getUserId()));
			community.setCommunityCountComments(communityCountCommentDao
					.findByCommId(community.getId()));
			for (CommunityCountComment communityCountComment : community
					.getCommunityCountComments()) {
				communityCountComment.setUserInfo(userInfoDao
						.findById(communityCountComment.getUserId()));
			}
		}

		return communities;
	}
	
	public PageBean<Community> getPageBeanData(PageBean<Community> pageBean){
		
		List<Community> communities = communityDao.getPageBean(pageBean).getPageData();
		for (Community community : communities) {
			community.setUserInfo(userInfoDao.findById(community.getUserId()));
			community.setCommunityCountComments(communityCountCommentDao
					.findByCommId(community.getId()));
			for (CommunityCountComment communityCountComment : community
					.getCommunityCountComments()) {
				communityCountComment.setUserInfo(userInfoDao
						.findById(communityCountComment.getUserId()));
			}
		}
		return pageBean;
	}

	public void insertCommunity(Community community) {
		communityDao.insertCommunity(community);
	}
	
	public void comment(CommunityCountComment ccc){
		communityCountCommentDao.insert(ccc);
	}
	
	

}
