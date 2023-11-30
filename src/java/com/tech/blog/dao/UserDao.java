package com.tech.blog.dao;

import com.tech.blog.entities.User;
import java.sql.*;

public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    public boolean saveUser(User user) {

        boolean f = false;

        try {

            String query = "insert into User(name,email,password,gender,about) values(?,?,?,?,?)";

            PreparedStatement pstmt = this.con.prepareStatement(query);

            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());

            pstmt.executeUpdate();

            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    //get useremail and password
    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;

        try {

            String query = "select * from User where email=? and password=?";

            PreparedStatement pstm = con.prepareStatement(query);

            pstm.setString(1, email);
            pstm.setString(2, password);

            ResultSet set = pstm.executeQuery();

            if (set.next()) {

                user = new User();

                //data from database
                String name = set.getString("name");
                user.setName(name);

                user.setId(set.getInt("id"));

                user.setEmail(set.getString("email"));

                user.setPassword(set.getString("password"));

                user.setGender(set.getString("gender"));

                user.setAbout(set.getString("about"));

                user.setRdate(set.getTimestamp("rdate"));

                user.setProfile(set.getString("profile"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public boolean updateUser(User user) {

        boolean f = false;

        try {

            String query = "update User set name=?, email=?, password=?, gender=?, about=?, profile=? where id=?";

            PreparedStatement p = con.prepareStatement(query);

            p.setString(1, user.getName());
            p.setString(2, user.getEmail());
            p.setString(3, user.getPassword());
            p.setString(4, user.getGender());
            p.setString(5, user.getAbout());
            p.setString(6, user.getProfile());
            p.setInt(7, user.getId());

            p.executeUpdate();

            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;

    }

    public User getUserByUsertId(int userId) {
        User user = null;

        String q = "select * from User where id=?";

        try {
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, userId);

            ResultSet set = ps.executeQuery();

            if (set.next()) {
                //data from database

                user = new User();

                String name = set.getString("name");
                user.setName(name);

                user.setId(set.getInt("id"));

                user.setEmail(set.getString("email"));

                user.setPassword(set.getString("password"));

                user.setGender(set.getString("gender"));

                user.setAbout(set.getString("about"));

                user.setRdate(set.getTimestamp("rdate"));

                user.setProfile(set.getString("profile"));
 
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

}
