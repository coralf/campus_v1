package com.campus.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.campus.entity.AdminInfo;
import com.campus.service.AdminService;
import com.campus.utils.CheckCode;

public class AdminServlet extends HttpServlet {

	private AdminService adminService = new AdminService();

	private String randcode;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String method = request.getParameter("method");

		if (method.equals("checkCode")) {
			checkCode(request, response);
		} else if (method.equals("login")) {
			login(request, response);
		} else if (method.equals("exit")) {

			exit(request, response);

		}
	}

	public void exit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().removeAttribute("adminInfo");
		response.sendRedirect(request.getContextPath()+"/Admin/login.jsp");
	}

	public void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter writer = response.getWriter();
		String name = request.getParameter("username");
		String password = request.getParameter("password");
		String code = request.getParameter("codetext");

		if (code == null || !code.equalsIgnoreCase(randcode)) {
			writer.write("验证码不正确");
			writer.flush();
			writer.close();
			return;
		}

		AdminInfo adminInfo = new AdminInfo();
		adminInfo.setName(name);
		adminInfo.setPwd(password);

		AdminInfo adminInfo2 = null;
		try {
			adminInfo2 = adminService.login(adminInfo);
			if (adminInfo2 == null) {
				writer.write("账号或密码不正确");
				writer.flush();
				writer.close();
				return;
			}
		} catch (Exception e) {
			e.printStackTrace();
			writer.write("账号或密码不正确");
			writer.flush();
			writer.close();
			return;
		}

		request.getSession().setAttribute("adminInfo", adminInfo2);
		writer.write("1");
		writer.flush();
		writer.close();
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

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
