<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.likeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.postDao"%>
<%@page import="com.tech.blog.helper.connectionProvider"%>

<div class="row">
    <%
        User user = (User) session.getAttribute("currentUser");
        Thread.sleep(500);
        
        postDao d = new postDao(connectionProvider.getConnection());

        int cid = Integer.parseInt(request.getParameter("cid"));
        
        List<Post> posts = null;
         
        if (cid == 0) {
            posts = d.getAllposts();
        } else {
            posts = d.getPostByCatId(cid);
        }
        
        if(posts.size()==0){
           %>
           
           <b class="display-3 text-center">No Posts int this category...</b>
           
           <%
           return;
        }
        
        for (Post p : posts) {

    %>

    <div class="card-border col-md-6 mt-2">

        <div class="card">
            <img src="blog_pics/<%= p.getpPic()%>" class="card-img-top" alt="..." width="100%" height="220">
            
            <div class="card-body">
                <b><%= p.getpTitle()%></b>
                <p style="height:49px; overflow:hidden"><%= p.getpContent()%></p>
            </div>
      
                <%
                    likeDao ldao = new likeDao(connectionProvider.getConnection());
                %>
            
            <div class="card-footer text-center primary-background">
                
                <a href="#!" onclick="doLike(<%=p.getpId()%>,<%=user.getId()%>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"><span class="like-counter"><%= ldao.countLikeonPost(p.getpId())%></span></i></a>
                <a href="show_blog_page.jsp?post_id=<%=p.getpId()%>" class="btn btn-outline-light btn-sm">Read more...</a>
                <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"><span>20</span></i></a>
            </div>
            
        </div>

    </div>

    <%
        }

    %>
    
    <script src="js/myscript.js" type="text/javascript"></script>
    
</div>