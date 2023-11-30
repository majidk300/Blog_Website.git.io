package com.tech.blog.dao;

import com.tech.blog.entities.Post;
import com.tech.blog.entities.category;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class postDao {

    Connection con;

    public postDao(Connection con) {
        this.con = con;
    }

    public ArrayList<category> getAllCategories() {
        ArrayList<category> list = new ArrayList<>();

        try {

            String q = "select * from categaries";

            Statement st = this.con.createStatement();

            ResultSet set = st.executeQuery(q);

            while (set.next()) {

                int cid = set.getInt("cid");
                String name = set.getString("name");
                String description = set.getString("description");

                category c = new category(cid, name, description);

                list.add(c);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;

    }

    public boolean savePost(Post p) {

        boolean f = false;

        try {

            String q = "insert into posts(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(q);

            pstmt.setString(1, p.getpTitle());
            pstmt.setString(2, p.getpContent());
            pstmt.setString(3, p.getpCode());
            pstmt.setString(4, p.getpPic());
            pstmt.setInt(5, p.getCatId());
            pstmt.setInt(6, p.getUserId());

            pstmt.executeUpdate();

            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

//    Allpostlist
    public List<Post> getAllposts() {

        List<Post> list = new ArrayList<>();
//      fetch all post

        try {

            PreparedStatement p = con.prepareStatement("select * from posts order by pId desc");

            ResultSet set = p.executeQuery();

            while (set.next()) {

                int pId = set.getInt("pId");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp pDate = set.getTimestamp("pDate");
                int catId = set.getInt("catId");
                int userId = set.getInt("userId");

                Post post = new Post(pId, pTitle, pContent, pCode, pPic, pDate, catId, userId);

                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<Post> getPostByCatId(int catId) {

        List<Post> list = new ArrayList<>();
        // fetch all post by id

        try {

            PreparedStatement p = con.prepareStatement("select * from posts where catId=?");
            p.setInt(1, catId);
            ResultSet set = p.executeQuery();

            while (set.next()) {

                int pId = set.getInt("pId");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp pDate = set.getTimestamp("pDate");
                int userId = set.getInt("userId");

                Post post = new Post(pId, pTitle, pContent, pCode, pPic, pDate, catId, userId);

                list.add(post);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public Post getPostByPostId(int postId) {

        Post post = null;

        String q = "select * from posts where pId=?";

        try {
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1, postId);

            ResultSet set = p.executeQuery();

            if (set.next()) {

                int pId = set.getInt("pId");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp pDate = set.getTimestamp("pDate");
                int userId = set.getInt("userId");
                int catId = set.getInt("catId");

                post = new Post(pId, pTitle, pContent, pCode, pPic, pDate, catId, userId);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return post;
    }
}
