package com.campus.service;

import com.campus.dao.AdminInfoDao;
import com.campus.entity.AdminInfo;

public class AdminService {
	private AdminInfoDao adminInfoDao=new AdminInfoDao();
	
	public AdminInfo login(AdminInfo adminInfo){
		return adminInfoDao.login(adminInfo);
	}
	
	
}
