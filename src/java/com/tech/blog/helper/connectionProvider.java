package com.tech.blog.helper;
import java.sql.*;

public class connectionProvider {
    
    private static Connection con;   
    
    public static Connection getConnection()
    {
        try{
            
            if(con==null){
                
                Class.forName("com.mysql.cj.jdbc.Driver");
            
            con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/techBlog", "root", "majid17oct");
                
            }
            
            
        }catch (Exception e){
            e.printStackTrace();
        }
        
        return con;
    }
}
