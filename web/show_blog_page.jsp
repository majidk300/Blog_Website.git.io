<%@page import="com.tech.blog.dao.likeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.connectionProvider"%>
<%@page import="com.tech.blog.dao.postDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error.jsp" %>

<%

    User user = (User) session.getAttribute("currentUser");

    if (user == null) {

        response.sendRedirect("login_page.jsp");
    }

%>

<%    int postId = Integer.parseInt(request.getParameter("post_id"));

    postDao dao = new postDao(connectionProvider.getConnection());

    Post p = dao.getPostByPostId(postId);

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=p.getpTitle()%> by <%=user.getName()%></title>

        <!-- bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <!-- css -->
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>


        <style>
            .banner_background{
                clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 70%, 100% 93%, 66% 100%, 30% 93%, 0 100%, 0% 35%, 0 0);

            }

            .card{
                border:2px solid #e2e2e2;
            }

            .post-title{
                font-weight:100;
                font-size:30px;
            }

            .post-conyent{
                font-weight:100;
                font-size:25px;
            }

            .post-user-info{
                font-size:20px;
                font-weight: 100;
                text-decoration:none;
            }

            .post-user-info a{
                text-decoration:none;
                transition:all 0.1s ease;
            }

            .post-user-info a:hover{
                border-bottom:2px solid #2962ff;

            }

            .post-date{
                font-style:italic;
                font-weight:bold;
            }

            .row-user{
                border:2px solid #e2e2e2;
                padding-top:15px;
            }

            body{
                background:url(image/backgrond-blog.jpg);
                width:100%;
                height:auto;
                background-size:cover;
                background-attachment:fixed;
            }

        </style>

        <!<!-- font awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <!--comments facebook plugin-->
    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v18.0" nonce="RgmUoxws"></script>
</head>
<body>

    <!-- Navbar -->

    <nav class="navbar navbar-expand-lg navbar-dark primary-background">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"></span> Tech Blog</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="profile.jsp"> <span class="fa fa-book"></span> Learn code</a>
                    </li>
                    <li class="nav-item dropdown">

                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <span class="fa fa-check-square-o"></span> Categories
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#">Programming language</a></li>
                            <li><a class="dropdown-item" href="#">Project implementation</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="#">Data Structure</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><span class="fa fa-tty"></span> contact</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#add-post-modal"><span class="fa fa-newspaper-o"></span> Do Post</a>
                    </li>

                </ul>
                <ul class="navbar-nav mr-right">

                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-bs-toggle="modal" data-bs-target="#profile-model"> <img src="pics/<%= user.getProfile()%>" class="img-fluid" style="border-radius:50%; max-width:28px; height:auto;"> <%= user.getName()%></a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="logoutServlet"><span class="fa fa-sign-out"></span> logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!--NavBar end -->

    <!--Message --> 
    <%

        Message m = (Message) session.getAttribute("msg");

        if (m != null) {

    %>

    <div class="alert <%= m.getcssClass()%>" role="alert">
        <%= m.getContent()%>
    </div>

    <%
            session.removeAttribute("msg");
        }


    %>

    <!-- profile model start-->
    <!-- Modal -->
    <div class="modal fade" id="profile-model" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header primary-background text-white">
                    <h5 class="modal-title" id="exampleModalLabel">Tech Blog</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body text-center">
                    <img src="pics/<%= user.getProfile()%>" class="img-fluid" style="border-radius:50%; max-width:150px; height:auto;">
                    <br>
                    <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName()%></h5>

                    <!-- User Details -->
                    <div id="profile-detail">
                        <table class="table">

                            <tbody>
                                <tr>
                                    <th scope="row" > ID :</th>
                                    <td><%= user.getId()%></td>
                                </tr>
                                <tr>
                                    <th scope="row"> Email :</th>
                                    <td><%= user.getEmail()%></td>
                                </tr>
                                <tr>
                                    <th scope="row"> Gender :</th>
                                    <td><%= user.getGender()%></td>
                                </tr>
                                <tr>
                                    <th scope="row"> About :</th>
                                    <td><%= user.getAbout()%></td>
                                </tr>
                                <tr>
                                    <th scope="row"> Registered on :</th>
                                    <td><%= user.getRdate()%></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <!-- profile edit -->
                    <div id="profile-edit" style="display:none;">
                        <h6 style="color:#ff6666">PLEASE EDIT CAREFULLY...</h6>
                        <form action="EditServlet" method="post" enctype="multipart/form-data">
                            <table class="table">
                                <tr>
                                    <td>ID :</td>
                                    <td><%= user.getId()%></td>
                                </tr>
                                <tr>
                                    <td>Name :</td>
                                    <td><input type="text" class="form-control" name="user_name" value="<%= user.getName()%>"</td>
                                </tr>
                                <tr>
                                    <td>Email :</td>
                                    <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>"</td>
                                </tr>
                                <tr>
                                    <td>Password :</td>
                                    <td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>"</td>
                                </tr>
                                <tr>
                                    <td>Gender :</td>
                                    <td><%= user.getGender().toUpperCase()%></td>
                                </tr>
                                <tr>
                                    <td>About :</td>
                                    <td><textarea rows="3" class="form-control" name="user_about"><%= user.getAbout()%></textarea></td>
                                </tr>

                                <tr>
                                    <td>Update photo :</td>
                                    <td><input type="file" name="image" class="form-control"></td>
                                </tr>

                            </table>

                            <div class="container">
                                <button type="submit" class="btn btn-outline-primary">Save</button>
                            </div>

                        </form>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button id="edit-profile-btn" type="button" class="btn btn-primary">EDIT</button>
                </div>
            </div>
        </div>
    </div>
    <!--Profile model end-->

    <!--Post Modal start-->
    <!-- Modal -->
    <div class="modal fade" id="add-post-modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">PROVIDE THE POST DETAILS</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="add-post-form" action="AddPostServlet" method="post" enctype="multipart/form-data">

                        <div class="form-group">

                            <select class="form-control" selected disable name="cid">

                                <option>---Select Category</option>

                                <%
                                    postDao postd = new postDao(connectionProvider.getConnection());
                                    ArrayList<category> list = postd.getAllCategories();

                                    for (category c : list) {

                                %>

                                <option value="<%=c.getCid()%>"><%= c.getName()%></option>

                                <%
                                    }%>
                            </select>
                        </div>

                        <div class="form-group mt-2">
                            <input name="pTitle" type="test" placeholder="Enter post Title" class="form-control" />
                        </div>

                        <div class="form-group mt-2">
                            <textarea name="pContent" class="form-control" style="height:130px" placeholder="Enter your content"></textarea>
                        </div>

                        <div class="form-group mt-2">
                            <textarea name="pCode" class="form-control" style="height:130px" placeholder="Enter your program(if any)"></textarea>
                        </div>

                        <div class="form-group mt-2">

                            <span>Select your pic..</span>
                            <br>
                            <input type="file" name="pPic"/>
                        </div>

                        <div class="container text-center mt-3">
                            <button type="submit" class="btn btn-outline-primary">Post</button>
                        </div>

                    </form>
                </div>

            </div>
        </div>
    </div>

    <!--Post Modal end-->

    <!--main content of body start-->

    <div class="container">

        <div class="row my-2">

            <div class="col-md-8 offset-md-2">

                <div class="card">

                    <div class="card-header primary-background text-light p-2">
                        <h3 class="post-title"><%= p.getpTitle()%></h3>
                    </div>
                    
                    <div class="img-fluid">
                        <img src="blog_pics/<%= p.getpPic()%>" class="card-img-top mb-2" alt="..." width="100%" height="520px">
                    </div>

                    <div class="card-body">
                        
                        <div class="row mb-3 row-user">

                            <%UserDao ud = new UserDao(connectionProvider.getConnection());%>

                            <div class="col-md-8">
                                <p class="post-user-info"><a href="#!"><%=ud.getUserByUsertId(p.getUserId()).getName()%> </a> has posted</p>
                            </div>

                            <div class="col-md-4">
                                <p class="post-date offset-md-5"><%=DateFormat.getDateInstance().format(p.getpDate())%></p>
                            </div>

                        </div>


                        <p class="post-conyent"><%= p.getpContent()%></p>

                        <br>
                        <br>

                        <div class="post-code">
                            <%= p.getpCode()%>
                        </div>

                    </div>

                    <%
                        
                        likeDao ldao = new likeDao(connectionProvider.getConnection());
                        
                    %>

                    <div class="card-footer text-center primary-background">
                        <a href="#!" onclick="doLike(<%=p.getpId()%>,<%=user.getId()%>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"><span class="like-counter"><%= ldao.countLikeonPost(p.getpId())%></span></i></a>
                        <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"><span>20</span></i></a>
                    </div>

                    <div class="card-footer">
                        <div class="fb-comments" data-href="http://localhost:9494/techBlog/show_blog_page.jsp?post_id=<%=p.getpId()%>" data-width="800" data-numposts="5"></div>
                    </div>

                </div>

            </div>

        </div>

    </div>

    <!--main content of body end-->



    <!-- java Scripts -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="js/myscript.js" type="text/javascript"></script>

    <script>
                            $(document).ready(function () {

                                let editStatus = false;

                                $('#edit-profile-btn').click(function () {

                                    if (editStatus === false) {

                                        $("#profile-detail").hide();
                                        $("#profile-edit").show();
                                        editStatus = true;
                                        $(this).text("back");

                                    } else {
                                        $("#profile-detail").show();
                                        $("#profile-edit").hide();
                                        editStatus = false;
                                        $(this).text("EDIT");
                                    }

                                });
                            });
    </script>

    <!--Add post js-->

    <script>

        $(document).ready(function () {

            $("#add-post-form").on("submit", function (event) {

                event.preventDefault();

                console.log("you have clicked on submit...");

                let form = new FormData(this);

                $.ajax({

                    url: "AddPostServlet",
                    type: 'POST',
                    data: form,

                    success: function (data, textStatus, jqXHR) {
                        console.log(data);

                        if (data.trim() === 'done') {
                            swal("Good Job😊", "save successfully", "success");
                        } else {
                            swal("Error!!😔", "Something went wrong", "error");
                        }
                    },

                    error: function (jqXHR, textStatus, errorThrown) {
                        swal("Error!!", "Something went wrong", "error");
                    },
                    processData: false,
                    contentType: false

                });

            });

        });

    </script>


</body>
</html>
