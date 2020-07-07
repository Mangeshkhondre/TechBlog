package com.techblog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.techblog.dao.UserDao;
import com.techblog.entities.User;
import com.techblog.helpers.ConnectionProvider;

@WebServlet("/RegisterServlet") @MultipartConfig
public class RegisterServlet extends HttpServlet 
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try (PrintWriter out = response.getWriter()) 
		{
            String check = request.getParameter("check");
            if (check == null) 
            {
                out.println("Please accept terms and conditions.");
            }
            else
            {
                String name = request.getParameter("user_name");
                String email = request.getParameter("user_email");
                String password = request.getParameter("user_password");
                String gender = request.getParameter("gender");
           
            
                //create user object and set all data to that object..
                User user = new User(name, email, password, gender);

                //create a user dao object..
                UserDao dao = new UserDao(ConnectionProvider.getConnection());
                boolean isUserSavedInDB = dao.saveUser(user);
                if (isUserSavedInDB)
                {
                	//save..
                    out.println("done");
                } 
                else
                {
                    out.println("error");
                }
            }
         }
	}

}
