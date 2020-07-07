package com.techblog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.techblog.dao.UserDao;
import com.techblog.entities.Message;
import com.techblog.entities.User;
import com.techblog.helpers.ConnectionProvider;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try (PrintWriter out = response.getWriter()) 
		{
			String userEmail = request.getParameter("email");
	        String userPassword = request.getParameter("password");
	
	        UserDao dao = new UserDao(ConnectionProvider.getConnection());
	
	        User u = dao.getUserByEmailAndPassword(userEmail, userPassword);
	
	        if (u == null) 
	        {
	        	// if login is not successful. Or user not exist.
	        	Message msg = new Message("Invalid Details! Try Again.", "error", "alert-danger");
				HttpSession s = request.getSession();
				s.setAttribute("msg", msg);
				response.sendRedirect("login_page.jsp");
	        }
	        else 
	        {
	        	// login success
	            HttpSession s = request.getSession();
	            s.setAttribute("currentUser", u);
	            response.sendRedirect("profile.jsp");
	
	        }
		}
	}
}
