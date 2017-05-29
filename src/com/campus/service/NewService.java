package com.campus.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Test;

import com.campus.dao.NewsCommentDao;
import com.campus.dao.NewsDao;
import com.campus.dao.NewsTypeDao;
import com.campus.dao.UserInfoDao;
import com.campus.entity.News;
import com.campus.entity.NewsComment;
import com.campus.entity.NewsType;
import com.campus.entity.UserInfo;
import com.campus.utils.PageBean;
import com.campus.utils.StringUtils;

public class NewService {

	private NewsDao newsDao = new NewsDao();
	private NewsTypeDao newsTypeDao = new NewsTypeDao();
	private NewsCommentDao newsCommentDao = new NewsCommentDao();
	private UserInfoDao userInfoDao = new UserInfoDao();

	public List<News> findByTypeId(int id) {
		return newsDao.findByTypeId(id);
	}

	public News findById(int id) throws Exception {

		News news = newsDao.findById(id);
		
		UserInfo userInfo = userInfoDao.findById(news.getUserId());
		news.setUserInfo(userInfo);
		String publishDate = news.getPublishDate();
		news.setPublishDate(StringUtils.dateFormat(publishDate));
		NewsType newsType = newsTypeDao.findById(news.getNewsTypeId());
		news.setNewsType(newsType);
		news.setNewsComment(newsCommentDao.findByNewsId(news.getId()));

		List<NewsComment> newsComments = news.getNewsComment();


		for (NewsComment comment : newsComments) {
			
			comment.setUserInfo(userInfoDao.findById(comment.getUserId()));
		}
	
		return news;
	}

	public List<NewsType> getAllNewsType() {
		List<NewsType> data = newsTypeDao.getData();
		return data;
	}

	public void page(PageBean<News> pageBean) {
		newsDao.page(pageBean);
		
		List<News> pageData = pageBean.getPageData();		
		
		for (News news : pageData) {
			Integer newsTypeId = news.getNewsTypeId();
			news.setNewsType(newsTypeDao.findById(newsTypeId));
		}
	}

	public void addNews(News news) {
		newsDao.addNews(news);
		
	}

}
