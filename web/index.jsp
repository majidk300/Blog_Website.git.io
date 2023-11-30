
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.dao.postDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.connectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>tech Blog</title>

        <!-- bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <!-- css -->
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>

        <style>
            .banner_background{
                clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 100%, 76% 90%, 49% 100%, 22% 91%, 0 100%, 0% 35%, 0 0);
            }

            .container{
                padding-bottom:100px;
            }

            .card:hover{
                transition:all 0.2s ease-in-out;
                background-image:linear-gradient(#2962ff,white);
            }


        </style>

        <!<!-- font awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>
    <body>

        <!<!-- Navbar -->
        <%@include file="normal_navbar.jsp" %>

        <!-- containers -->

        <div class="container-fluid p-0 m-0 banner_background">

            <div class="jumbotron primary-background text-light p-5">
                <div class="container">

                    <h3 class="display-3">Tech Blog</h3>
                    <p>Tech Blog is more than a blog; it's a community of like-minded individuals who are passionate
                        about technology. We're here to inspire, educate, and empower you in your tech journey. Whether 
                        you're a novice or a seasoned pro, there's always something new to discover here.</p>
                    <p>We invite you 
                        to be a part of our journey as we explore the digital frontier. Subscribe, interact, and embark on 
                        a tech adventure with us.</p>

                    <div class="btn_ pb-4">
                        <a href="register_page.jsp" class="btn btn-outline-light bg-light text-dark btn-lg mt-2 "><span class="fa fa-external-link"></span> Start ! it's Free</a>
                        <a href="login_page.jsp" class="btn btn-outline-light btn-lg mt-2"  style="margin-left:3px"><span class="fa fa-user-circle fa-spin"></span> Login</a>

                    </div>
                </div>
            </div>

        </div>

        <!-- cards -->
        <div class="container mt-4 mb-2" style="height:77rem; overflow:hidden">

            <div class="row">

                <%
                    postDao us = new postDao(connectionProvider.getConnection());

                    List<Post> post = null;

                    post = us.getAllposts();

                    for (Post p : post) {
                %>

                <div class="col-md-4">
                    <div class="card my-2">

                        <div class="card-header primary-background text-light pt-3">
                            <h5 class="card-title"><%=p.getpTitle()%></h5>

                        </div>

                        <div class="">

                            <img src="blog_pics/<%= p.getpPic()%>" class="card-img-top" alt="..." width="100%" height="200">

                            <div class="card-body">
                                <p class="card-text" style="height:50px; overflow:hidden"><%=p.getpContent()%></p>
                                <a href="register_page.jsp" class="btn primary-background text-light">Read more</a>
                            </div>

                        </div>
                    </div>
                </div>

                <%
                    }
                %>

            </div>

        </div>


        <!-- javaScripts -->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

        <script src="js/js.js" type="text/javascript"></script>


    </body>
</html>