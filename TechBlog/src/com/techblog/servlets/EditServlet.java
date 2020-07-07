package com.techblog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.techblog.dao.UserDao;
import com.techblog.entities.Message;
import com.techblog.entities.User;
import com.techblog.helpers.ConnectionProvider;
import com.techblog.helpers.ImageUpdationHelper;

@WebServlet("/EditServlet") @MultipartConfig
public class EditServlet extends HttpServlet 
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException,ServletException 
	{
	
		try (PrintWriter out = response.getWriter()) 
		{
//            fetch all data
            String userEmail = request.getParameter("user_email");
            String userName = request.getParameter("user_name");
            String userPassword = request.getParameter("user_password");
            String userGender = request.getParameter("user_gender");
            Part part = request.getPart("image");

            String imageName = part.getSubmittedFileName();

            //get the user from the session...
            HttpSession s = request.getSession();
            User user = (User) s.getAttribute("currentUser");
            user.setEmail(userEmail);
            user.setName(userName);
            user.setPassword(userPassword);
            user.setGender(userGender);
            String oldFile = user.getProfile();

            user.setProfile(imageName);

            //update database....
            UserDao userDao = new UserDao(ConnectionProvider.getConnection());

            boolean ans = userDao.updateUser(user);
            if (ans) 
            {
                String path = request.getRealPath("/") + "pics" + File.separator + user.getProfile();
                //start of photo work
                //delete code
                String pathOldFile = request.getRealPath("/") + "pics" + File.separator + oldFile;

                if (!oldFile.equals("default.png"))
                {
                   ImageUpdationHelper.deleteFile(pathOldFile);
                }

                if (ImageUpdationHelper.saveFile(part.getInputStream(), path)) 
                {
                    out.println("Profile updated...");
                    Message msg = new Message("Profile details updated...", "success", "alert-success");
                    s.setAttribute("msg", msg);

                }
                else 
                {
                    Message msg = new Message("Something went wrong..", "error", "alert-danger");
                    s.setAttribute("msg", msg);
                }
                //end of phots work
            } 
            else 
            {
                out.println("not updated..");
                Message msg = new Message("Something went wrong..", "error", "alert-danger");
                s.setAttribute("msg", msg);

            }

            response.sendRedirect("profile.jsp");

        }
   		
		
		
	}
}
