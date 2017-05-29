package com.campus.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.campus.entity.News;
import com.campus.service.NewService;

public class IndexServlet extends HttpServlet {

	private NewService newService=new NewService();
	private List<News> newsData14;
	private List<News> newsData15;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		newsData14 = newService.findByTypeId(14);
		newsData15 = newService.findByTypeId(15);
		
		String url="/WebApp/index.jsp";
		request.setAttribute("newsData14", newsData14);
		request.setAttribute("newsData15", newsData15);
		request.getRequestDispatcher(url).forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
		
	}

}
