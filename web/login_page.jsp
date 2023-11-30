<%@page import="com.tech.blog.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login page</title>

        <!-- bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <!-- css -->
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>

        <style>
            .banner_background{
                clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 70%, 100% 93%, 66% 100%, 30% 93%, 0 100%, 0% 35%, 0 0);

            }

        </style>

        <!<!-- font awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>
    <body>

        <!-- navbar -->
        <%@include file="normal_navbar.jsp" %>

        <!-- login page -->
        <div class="main primary-background banner_background" style="height:84vh">
            <main class="d-flex align-items-center" style="height:79vh">


                <div class="container">

                    <div class="row">

                        <div class="col-md-4 offset-md-4">

                            <div class="card">
                                <div class="card-header primary-background text-white text-center">
                                    <span class="fa fa-user-plus fa-3x mt-3"></span>
                                    <br>
                                    <p>Login here</p>
                                </div>

                                <%

                                    Message m = (Message) session.getAttribute("msg");

                                    if (m != null) {

                                %>

                                <div class="alert <%= m.getcssClass() %>" role="alert">
                                    <%= m.getContent()%>
                                </div>

                                <%     
                                    session.removeAttribute("msg");
                                    }

 
                                %>

                                <div class="card-body">

                                    <form action="loginServlet" method="POST">
                                        <div class="mb-3">
                                            <label for="exampleInputEmail1" class="form-label">Email address</label>
                                            <input name="email" required="" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                            <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="exampleInputPassword1" class="form-label">Password</label>
                                            <input name="password" required="" type="password" class="form-control" id="exampleInputPassword1" placeholder="Enter password">
                                        </div>
                                        <div class="mb-3 form-check">
                                            <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                            <label class="form-check-label" for="exampleCheck1">Check me out</label>
                                        </div>
                                        <div class="container text-center">
                                            <button type="submit" class="btn primary-background text-white">Login</button>
                                        </div>
                                    </form>

                                </div>
                            </div>
                        </div>

                    </div>

                </div>

            </main>

        </div>


        <!-- java Scripts -->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

        <script src="js/js.js" type="text/javascript"></script>


    </body>
</html>
