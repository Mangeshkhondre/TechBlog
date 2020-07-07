package com.techblog.dao;

import java.sql.*;


public class LikeDao 
{
	
	Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }

    // to add like for post (pid ) liked by user (uid)
    public boolean insertLike(int pid, int uid) 
    {
        boolean f = false;
        try 
        {
            String q = "insert into techblog.likes(pid,uid) values(?,?)";
            PreparedStatement p = this.con.prepareStatement(q);
            //values set...
            p.setInt(1, pid);
            p.setInt(2, uid);
            p.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }
    
    
    // to count like so we can show it 
    public int countLikeOnPost(int pid) {
        int count = 0;

        String q = "select count(*) from techblog.likes where pid=?";
        try {
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1, pid);
            ResultSet set = p.executeQuery();
            if (set.next()) {
                count = set.getInt("count(*)");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }

    
    // to check if a particular user has liked this post before
    public boolean isLikedByUser(int pid, int uid) {
        boolean f = false;
        try {
            PreparedStatement p = this.con.prepareStatement("select * from techblog.likes where pid=? and uid=?");
            p.setInt(1, pid);
            p.setInt(2, uid);
            ResultSet set = p.executeQuery();
            if (set.next()) {
                f = true;
            }

        } catch (Exception e) {
        }
        return f;
    }

    // to unlike the liked post
    public boolean deleteLike(int pid, int uid) {
        boolean f = false;
        try {
            PreparedStatement p = this.con.prepareStatement("delete from techblog.likes where pid=? and uid=? ");
            p.setInt(1, pid);
            p.setInt(2, uid);
            p.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

}
