package com.techblog.helpers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class ConnectionProvider {

	private static Connection con=null;
	public static Connection getConnection()
	{
		try 
		{
			if (con == null) 
			{
				// driver class load
				Class.forName("com.mysql.jdbc.Driver");
				//	create connection
				con= DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog", "root", "MySQL@mk");
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return con; 
	}
	
}
