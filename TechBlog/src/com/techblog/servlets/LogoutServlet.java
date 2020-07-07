package com.techblog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.techblog.entities.Message;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try (PrintWriter out = response.getWriter()) {

			HttpSession s = request.getSession();

			s.removeAttribute("currentUser");

			Message m = new Message("Logout Successfully", "success", "alert-success");

			s.setAttribute("msg", m);

			response.sendRedirect("login_page.jsp");
			
			out.println("Logged out");
		}
	}
}
