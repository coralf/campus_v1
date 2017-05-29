package com.campus.servlet;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.rpc.ServiceException;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.junit.Test;

import com.campus.entity.UserInfo;
import com.campus.service.UserService;
import com.campus.utils.CheckCode;
import com.campus.utils.MD5Util;
import com.campus.utils.PageBean;
import com.campus.utils.SendEmail;

public class UserServlet extends HttpServlet {
	private UserService userService = new UserService();
	private String randcode;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String method = request.getParameter("method");
		if (method.equals("register")) {
			register(request, response);
		} else if (method.equals("checkCode")) {
			checkCode(request, response);
		} else if (method.equals("activate")) {

			activate(request, response);
		} else if (method.equals("login")) {
			login(request, response);

		} else if (method.equals("upload")) {

			upload(request, response);

		} else if (method.equals("update")) {
			update(request, response);
		} else if (method.equals("userList")) {
			userList(request, response);
		} else if (method.equals("activeUser")) {
			activeUser(request, response);
		} else if (method.equals("forbidUser")) {
			forbidUser(request, response);
		}else if(method.equals("exit")){
			exit(request,response);
		}

	}
	
	private void exit(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		
		UserInfo userInfo = (UserInfo) request.getSession().getAttribute("userInfo");
		if(userInfo!=null){
			request.getSession().removeAttribute("userInfo");
		}
		
		response.sendRedirect(request.getContextPath()+"/IndexServlet");
	}

	private void forbidUser(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		userService.forbidUser(Integer.parseInt(request.getParameter("id")));
		userList(request, response);
	}

	private void activeUser(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		userService.activeUser(Integer.parseInt(id));
		userList(request, response);
	}

	private void userList(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String currPage = request.getParameter("currPage");
		if (currPage == null || "".equals(currPage)) {
			currPage = "1";
		}
		PageBean<UserInfo> pageBean = new PageBean<UserInfo>();
		pageBean.setCurrentPage(Integer.parseInt(currPage));
		userService.page(pageBean);
		request.setAttribute("pageBean", pageBean);
		request.getRequestDispatcher("/Admin/private/userManager.jsp").forward(
				request, response);
	}

	private void update(HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		String username = request.getParameter("username");
		String pwd = request.getParameter("pwd");
		String sex = request.getParameter("sex");
		String content = request.getParameter("contents");
		UserInfo userInfo = new UserInfo();
		userInfo.setUsername(username);
		userInfo.setPwd(pwd);
		userInfo.setSex(sex);
		userInfo.setUserDes(content);
		UserInfo userInfoSesson = (UserInfo) request.getSession().getAttribute(
				"userInfo");
		userInfo.setId(userInfoSesson.getId());
		userService.changeUesrInfo(userInfo);
		userInfoSesson = userService.finById(userInfoSesson.getId());
		request.getSession().setAttribute("userInfo", userInfoSesson);
		response.sendRedirect(request.getContextPath() + "/WebApp/userInfo.jsp");

	}

	private void upload(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter writer = response.getWriter();
		/********* 文件上传组件： 处理文件上传 ************/

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
						// 普通文本数据
						String fieldName = item.getFieldName(); // 表单元素名称
						String content = item.getString(); // 表单元素名称， 对应的数据
						// item.getString("UTF-8"); 指定编码
						System.out.println(fieldName + " " + content);
					}
					// 上传文件(文件流) ----> 上传到upload目录下
					else {
						// 普通文本数据
						// String fieldName = item.getFieldName(); // 表单元素名称
						String name = item.getName(); // 文件名
						// String content = item.getString(); // 表单元素名称， 对应的数据
						// String type = item.getContentType(); // 文件类型
						// InputStream in = item.getInputStream(); // 上传文件流

						/*
						 * 四、文件名重名 对于不同用户readme.txt文件，不希望覆盖！ 后台处理： 给用户添加一个唯一标记!
						 */
						// a. 随机生成一个唯一标记
						String id = UUID.randomUUID().toString();
						// b. 与文件名拼接
						name = id + "_" + name;
						// 获取上传基路径
						String path = getServletContext().getRealPath(
								"/WebApp/img/user");
						// 创建目标文件
						File file = new File(path, name);
						// 工具类，文件上传
						item.write(file);
						item.delete(); // 删除系统产生的临时文件

						UserInfo userInfo = (UserInfo) request.getSession()
								.getAttribute("userInfo");
						if (userInfo != null) {
							UserInfo usi2 = userService.finById(userInfo
									.getId());
							String userIcon = usi2.getUserIcon();
							String named = userIcon.substring(userIcon
									.lastIndexOf("/") + 1);
							File file2 = new File(path, named);
							if (file2.exists()) {
								file2.delete();
							}
							userInfo.setUserIcon(request.getContextPath()
									+ "/WebApp/img/user/" + name);
							userService.changeIcon(userInfo);
							writer.write(userInfo.getUserIcon());
						}
					}
				}
			} else {
				System.out.println("当前表单不是文件上传表单，处理失败！");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		writer.flush();
		writer.close();
	}

	private void login(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter writer = response.getWriter();
		String userName = request.getParameter("username");
		String pwd = request.getParameter("pwd");
		UserInfo userInfo = new UserInfo();
		userInfo.setUsername(userName);
		userInfo.setPwd(pwd);
		try {
			UserInfo userInfoD = userService.login(userInfo);
			if (userInfoD != null) {
				request.getSession().setAttribute("userInfo", userInfoD);
				String url = request.getParameter("url");
		//		System.out.println(url);
				writer.write(url==null ? "1":url);
			}
		} catch (Exception e) {
			writer.write("0");
			e.printStackTrace();
		}
		writer.flush();
		writer.close();
	}

	private void activate(HttpServletRequest request,
			HttpServletResponse response) {
		// 激活
		String email = request.getParameter("email");// 获取email
		String validateCode = request.getParameter("validateCode");// 激活码

		try {
			userService.processActivate(email, validateCode);
		} catch (Exception e) {
			request.setAttribute("message", e.getMessage());
		}

	}

	public void checkCode(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("image/jpeg");// 设置相应类型,告诉浏览器输出的内容为图片
		response.setHeader("Pragma", "No-cache");// 设置响应头信息，告诉浏览器不要缓存此内容
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expire", 0);
		CheckCode CheckCode = new CheckCode();
		try {
			randcode = CheckCode.getRandcode(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void register(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter writer = response.getWriter();
		String username = request.getParameter("username");
		String email = request.getParameter("eml");
		String pwd = request.getParameter("pwd");
		String checkC = request.getParameter("checkC");

		if (!checkC.equalsIgnoreCase(randcode)) {
			writer.write("验证码不正确");
			return;
		}
		UserInfo userInfo = new UserInfo();
		userInfo.setEmail(email);
		userInfo.setUsername(username);
		userInfo.setPwd(pwd);
		userInfo.setValidateCode(MD5Util.encode2hex(email));
		userInfo.setRegDate(new Date());

		if (userService.register(userInfo)) {
			writer.write("用户名已存在");
			return;
		}

		// /邮件的内容
		/*
		 * StringBuffer sb = new StringBuffer(
		 * "点击下面链接激活账号，48小时生效，否则重新注册账号，链接只能使用一次，请尽快激活！</br>"); sb.append(
		 * "<a href=\"http://localhost:8080/campus_v1/UserServlet?method=activate&email="
		 * ); sb.append(email); sb.append("&validateCode=");
		 * sb.append(userInfo.getValidateCode()); sb.append(
		 * "\">http://localhost:8080/campus_v1/UserServlet?method=activate&email="
		 * ); sb.append(email); sb.append("&validateCode=");
		 * sb.append(userInfo.getValidateCode()); sb.append("</a>"); // 发送邮件
		 * SendEmail.send(email, sb.toString());
		 */

		writer.flush();
		writer.close();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}
}
