package com.techblog.dao;

import java.sql.*;


import com.techblog.entities.User;

public class UserDao 
{
	private Connection con;
	public UserDao(Connection con)
	{
		this.con=con;
	}
	
	// insert user into db
	public boolean saveUser(User user)
	{
		boolean result=false;
		
		try
		{
			String query="insert into user(name,email,password,gender) values(?,?,?,?)";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, user.getName());
			pstmt.setString(2,user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getGender());
			pstmt.executeUpdate();
			result=true;
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return result;
	}


	//get user by useremail and userpassword:
    public User getUserByEmailAndPassword(String email, String password) 
    {
        User user = null;

        try 
        {

            String query = "select * from techblog.user where email =? and password=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) 
            {
                user = new User();

//             data from db
                String name = rs.getString("name");
//             set to user object
                user.setName(name);

                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
                user.setReg_date(rs.getTimestamp("reg_date"));
                user.setProfile(rs.getString("profile"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

	public boolean updateUser(User user) 
	{
		boolean f = false;
        try {

            String query = "update user set name=? , email=? , password=? , gender=? , profile=? where  id =?";
            PreparedStatement p = con.prepareStatement(query);
            p.setString(1, user.getName());
            p.setString(2, user.getEmail());
            p.setString(3, user.getPassword());
            p.setString(4, user.getGender());
            p.setString(5, user.getProfile());
            p.setInt(6, user.getId());

            p.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
	}

	 public User getUserByUserId(int userId) {
	        User user = null;
	        try {
	            String q = "select * from user where id=?";
	            PreparedStatement ps = this.con.prepareStatement(q);
	            ps.setInt(1, userId);
	            ResultSet set = ps.executeQuery();
	            if (set.next()) {
	                user = new User();

//	             data from db
	                String name = set.getString("name");
//	             set to user object
	                user.setName(name);

	                user.setId(set.getInt("id"));
	                user.setEmail(set.getString("email"));
	                user.setPassword(set.getString("password"));
	                user.setGender(set.getString("gender"));
	                user.setReg_date(set.getTimestamp("reg_date"));
	                user.setProfile(set.getString("profile"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return user;
	    }

}
