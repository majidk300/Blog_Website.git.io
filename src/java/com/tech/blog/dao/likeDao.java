package com.tech.blog.dao;

import java.sql.*;

public class likeDao {

    Connection con;

    public likeDao(Connection con) {
        this.con = con;
    }

    //insert user like
    public boolean insertLike(int pid, int uid) {

        boolean f = false;
        try {

            String q = "insert into likes(pid,uid) values(?,?)";
            PreparedStatement p = this.con.prepareStatement(q);
            
            p.setInt(1, pid);
            p.setInt(2,uid);
            
            p.executeUpdate();
            
            f=true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    //count Like
    public int countLikeonPost(int pid){
        int count=0;
        
        String q = "select count(*) from likes where pid=?";
        
        try{
            
        PreparedStatement p = this.con.prepareStatement(q);
        p.setInt(1, pid);
        
        ResultSet set = p.executeQuery();
        
        if(set.next()){
            count=set.getInt("count(*)");
        }
            
        }catch (Exception e){
            e.printStackTrace();
        }
        
        return count;
    }
    
    //is user is already liked 
    public boolean isLikeByUser(int pid, int uid){
        
        boolean f = false;
        
        try {
            
            PreparedStatement p = this.con.prepareStatement("select * from likes where pid=? and uid=?");
            p.setInt(1,pid);
            p.setInt(2,uid);
            
            ResultSet set = p.executeQuery();
            
            if(set.next()){
                f=true;
            }
            
        }catch (Exception e){
            e.printStackTrace();
        }
        
        return f;
    }
    
    //deslike 
    
    public boolean deleteLike(int pid, int uid){
        
        boolean f = false;
        
        try {
            
            PreparedStatement p = this.con.prepareStatement("delete from likes where pid=? and uid=?");
            p.setInt(1,pid);
            p.setInt(2, uid);
            
            p.executeUpdate();
            
            f = true;
            
        }catch (Exception e){
            e.printStackTrace();
        }
        
        return f;
    }
        
}
