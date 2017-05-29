package com.campus.service;

import java.util.Date;
import java.util.List;

import com.campus.dao.UserInfoDao;
import com.campus.entity.Activities;
import com.campus.entity.UserInfo;
import com.campus.utils.PageBean;

public class UserService {

	private UserInfoDao userInfoDao = new UserInfoDao();

	public UserInfo login(UserInfo userInfo) {
		return  userInfoDao.login(userInfo);
	}
	
	
	
	public boolean register(UserInfo userInfo) {

		if (userInfoDao.findByName(userInfo.getUsername()) <= 0) {
			userInfoDao.insert(userInfo);
			return false;
		} else {
			return true;
		}
	}

	public void processActivate(String email, String validateCode)
			throws Exception {
		// 数据访问层，通过email获取用户信息
		UserInfo user = userInfoDao.findByEmail(email);
		// 验证用户是否存在
		if (user != null) {
			// 验证用户激活状态
			if (user.getState() == 0) {
				// /没激活
				Date currentTime = new Date();// 获取当前时间
				// 验证链接是否过期
				currentTime.before(user.getRegDate());
				if (currentTime.before(user.getLastActivateTime())) {
					// 验证激活码是否正确
					if (validateCode.equals(user.getValidateCode())) {
						// 激活成功， //并更新用户的激活状态，为已激活
						user.setState(1);// 把状态改为激活
						userInfoDao.updateState(user);
					} else {
						throw new Exception("激活码不正确");
					}
				} else {
					throw new Exception("激活码已过期！");
				}
			} else {
				throw new Exception("邮箱已激活，请登录！");
			}
		} else {
			throw new Exception("该邮箱未注册（邮箱地址不存在）！");
		}
	}

	public void changeIcon(UserInfo userInfo) {
		
		
		
		
		userInfoDao.changeIcon(userInfo);
		
	}
	
	public UserInfo finById(int id) {	
		return userInfoDao.findById(id);
	}

	public void changeUesrInfo(UserInfo userInfo) {

		userInfoDao.changeUesrInfo(userInfo);
	}

	public void page(PageBean<UserInfo> pageBean) {
		
		
		userInfoDao.page(pageBean);
	}

	public void activeUser(int id) {
		userInfoDao.activeUser(id);
	}
	
	public void  forbidUser(int id){
		userInfoDao.forbidUser(id);
	}
	

	
	
	
}
