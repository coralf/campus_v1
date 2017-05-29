package com.campus.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.campus.entity.News;
import com.campus.service.NewService;

public class NewReadServlet extends HttpServlet {
	private NewService newService=new NewService();
	
	
	
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// /NewReadServlet?method=dInfo&newsId=${news.id}
		String method = request.getParameter("method");
		if (method.equals("dInfo")) {
			dInfo(request, response);
		}

	}

	
	/**
	 *method: read detailed newsInfo 
	 * */
	private void dInfo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String newsId = request.getParameter("newsId");
		News news=null;
		try {
			news = newService.findById(Integer.parseInt(newsId));
			request.setAttribute("news", news);
			request.getRequestDispatcher("/WebApp/readNews.jsp").forward(request, response);
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
