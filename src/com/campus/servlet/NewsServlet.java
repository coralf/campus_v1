package com.campus.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.campus.dao.NewsTypeDao;
import com.campus.entity.AdminInfo;
import com.campus.entity.Community;
import com.campus.entity.News;
import com.campus.entity.NewsType;
import com.campus.entity.UserInfo;
import com.campus.service.NewService;
import com.campus.utils.PageBean;

public class NewsServlet extends HttpServlet {

	private NewService newService=new NewService();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String method= request.getParameter("method");
		if(method.equals("newsList")){
			newsList(request,response);
		}else if(method.equals("newsInfoList")){
			newsInfoList(request,response);
		}else if(method.equals("publish")){
			publish(request,response);
		}
		
	}
	
	public void publish(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		AdminInfo adminInfo = (AdminInfo) request.getSession().getAttribute("adminInfo");
		News news = new News();
		news.setUserId(adminInfo.getId());
		try {
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setFileSizeMax(2 * 1024 * 1024);
			upload.setSizeMax(80 * 1024 * 1024);
			upload.setHeaderEncoding("UTF-8");
			if (upload.isMultipartContent(request)) {
				List<FileItem> list = upload.parseRequest(request);
				for (FileItem item : list) {
					if (item.isFormField()) {
						String fieldName = item.getFieldName(); // 表单元素名称
						String content = item.getString("UTF-8"); // 表单元素名称， 对应的数据
						if(fieldName.equals("title")){
							news.setNewsTitle(content);
						}else if(fieldName.equals("cid")){
							news.setNewsTypeId(Integer.parseInt(content));
						}else if(fieldName.equals("content")){
							news.setNewsContent(content);
						}
					}else {
						String name = item.getName(); // 文件名
						String id = UUID.randomUUID().toString();
						name = id + "_" + name;
						String path =getServletContext().getRealPath("/WebApp/img/news");
						File file = new File(path, name);
						item.write(file);
						item.delete(); 
						news.setNewsImg(request.getContextPath()+"/WebApp/img/news/"+name);
					}
				}

			} else {
				System.out.println("当前表单不是文件上传表单，处理失败！");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		newService.addNews(news);
		newsInfoList(request,response);
	}	
	public void newsInfoList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String currPage = request.getParameter("currPage");
		if(currPage==null || "".equals(currPage)){
			currPage="1";
		}
		
		try{
			
			PageBean<News> pageBean = new PageBean<News>();
			pageBean.setCurrentPage(Integer.parseInt(currPage));
			newService.page(pageBean);
			request.setAttribute("pageBean", pageBean);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			
			request.getRequestDispatcher("/Admin/private/newsManager.jsp").forward(request, response);
			
		}
		
		
	
	
		
		
	}
	
	public void newsList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<NewsType> allNewsType = newService.getAllNewsType();
		request.setAttribute("allNewsType", allNewsType);
		request.getRequestDispatcher("/Admin/private/newTypeManager.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
