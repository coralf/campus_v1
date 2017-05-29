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

import com.campus.dao.CommunityDao;
import com.campus.entity.Community;
import com.campus.entity.CommunityCountComment;
import com.campus.entity.UserInfo;
import com.campus.service.CommunityService;
import com.campus.utils.PageBean;

public class CommunityServlet extends HttpServlet {

	private CommunityService communityService = new CommunityService();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		
		String method = request.getParameter("method");

		if (method.equals("communities")) {
			communities(request, response);
		}else if(method.equals("posting")){
			
			posting(request,response);
		}else if(method.equals("comment")){
			comment(request,response);
		}else if(method.equals("act")){
			findByUserId(request,response);
		}

	}
	

	private void findByUserId(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		UserInfo user=(UserInfo) request.getSession().getAttribute("userInfo");
		int id=user.getId();
		CommunityDao com=new CommunityDao();
		List<Community>list= com.findByUserId(id);
		request.setAttribute("list",list);
		request.getRequestDispatcher("/WebApp/userInfo_com.jsp").forward(request, response);
	}


	private void comment(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String content = request.getParameter("content");
		UserInfo userInfo = (UserInfo) request.getSession().getAttribute("userInfo");
		CommunityCountComment ccc = new CommunityCountComment();
		ccc.setCommid(Integer.parseInt(id));
		ccc.setUserId(userInfo.getId());
		ccc.setContent(content);
		communityService.comment(ccc);
		response.sendRedirect(request.getContextPath()+"/CommunityServlet?method=communities");
	}


	public void posting(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		Community community = new Community();
		
		try {
			// 1. 文件上传工厂
			FileItemFactory factory = new DiskFileItemFactory();
			// 2. 创建文件上传核心工具类
			ServletFileUpload upload = new ServletFileUpload(factory);

			// 一、设置单个文件允许的最大的大小： 30M
			upload.setFileSizeMax(2 * 1024 * 1024);
			// 二、设置文件上传表单允许的总大小: 80M
			upload.setSizeMax(80 * 1024 * 1024);
			// 三、 设置上传表单文件名的编码
			// 相当于：request.setCharacterEncoding("UTF-8");
			upload.setHeaderEncoding("UTF-8");

			// 3. 判断： 当前表单是否为文件上传表单
			if (upload.isMultipartContent(request)) {
				// 4. 把请求数据转换为一个个FileItem对象，再用集合封装
				List<FileItem> list = upload.parseRequest(request);
				// 遍历： 得到每一个上传的数据
				for (FileItem item : list) {
					// 判断：普通文本数据
					if (item.isFormField()) {
						//item.getString("UTF-8"); //指定编码
						// 普通文本数据
						String fieldName = item.getFieldName(); // 表单元素名称
						String content = item.getString("UTF-8"); // 表单元素名称， 对应的数据
						if(fieldName.equals("title")){
							community.setTitle(content);
						}else if(fieldName.equals("content")){
							community.setContent(content);
						}
					//	System.out.println(fieldName + " " + content);
					}
					// 上传文件(文件流) ----> 上传到upload目录下
					else {
						// 普通文本数据
//						String fieldName = item.getFieldName(); // 表单元素名称
						String name = item.getName(); // 文件名
//						String content = item.getString(); // 表单元素名称， 对应的数据
//						String type = item.getContentType(); // 文件类型
//						InputStream in = item.getInputStream(); // 上传文件流

						/*
						 * 四、文件名重名 对于不同用户readme.txt文件，不希望覆盖！ 后台处理： 给用户添加一个唯一标记!
						 */
						// a. 随机生成一个唯一标记
						String id = UUID.randomUUID().toString();
						// b. 与文件名拼接
						name = id + "_" + name;
						// 获取上传基路径
						String path =getServletContext().getRealPath("/WebApp/img/community");
						// 创建目标文件
						File file = new File(path, name);
						// 工具类，文件上传
						item.write(file);
						item.delete(); // 删除系统产生的临时文件
						community.setImgs(request.getContextPath()+"/WebApp/img/community/"+name);
					}
				}

			} else {
				System.out.println("当前表单不是文件上传表单，处理失败！");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		UserInfo userInfo = (UserInfo)request.getSession().getAttribute("userInfo");
		if(userInfo!=null){
			community.setUserId(userInfo.getId());
			communityService.insertCommunity(community);
			response.sendRedirect(request.getContextPath()+"/CommunityServlet?method=communities");
		}
	}

	public void communities(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String currentPage = request.getParameter("currentPage");
		if(currentPage==null||"".equals(currentPage)){
			currentPage="1";
		}
		PageBean<Community> pageBean = new PageBean<Community>();
		pageBean.setCurrentPage(Integer.parseInt(currentPage));
		
		communityService.getPageBeanData(pageBean);
		request.setAttribute("pageBean", pageBean);
		request.getRequestDispatcher("/WebApp/community.jsp").forward(request,
					response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);

	}

}
