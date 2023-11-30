<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!-- bootsrap -->
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

        <!-- Register form -->
        <div class="register primary-background banner_background">

            <main class="p-3">
                <div class="container pb-5">

                    <div class="col-md-4 offset-md-4">

                        <div class="card">

                            <!--card header -->
                            <div class="card-header text-center primary-background text-white">
                                <span class="fa fa-3x fa-user-circle"></span>
                                <br>
                                Register here
                            </div>

                            <!--card body -->
                            <div class="card-body">
                                <form id="reg-form" action="RegisterServlet" method="POST">

                                    <div class="mb-3">
                                        <label for="user_name" class="form-label">User Name</label>
                                        <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="user_name" placeholder="Enter name">
                                    </div>

                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">Email address</label>
                                        <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                        <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                    </div>

                                    <div class="mb-3">
                                        <label for="exampleInputPassword1" class="form-label">Password</label>
                                        <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Enter password">
                                    </div>

                                    <div class="mb-3">
                                        <label for="gender" class="form-label">Gender</label>
                                        <br>
                                        <input value="Male" type="radio" id="gender" name="gender">Male
                                        <input value="Female" type="radio" id="gender" name="gender" style="margin-left:5px">Female
                                    </div>

                                    <div class="mb-3">
                                        <textarea name="about" class="form-control" id="about" rows="5" placeholder="Enter something about yourself"></textarea>
                                    </div>

                                    <div class="mb-3 form-check">
                                        <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">Agree terms and conditions</label>
                                    </div>

                                    <div id="loader" class="container text-center" style="display:none">
                                        <span class="fa fa-refresh fa-4x fa-spin"></span>
                                        <h4>Please wait...</h4>
                                    </div>
                                    <button type="submit" id="Submit-btn" class="btn primary-background text-white">Register</button>
                                </form>
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

        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        <script>

            $(document).ready(function () {

                console.log("loaded...");

                $('#reg-form').on('submit', function (event) {

                    event.preventDefault();

                    let form = new FormData(this);

                    $('#Submit-btn').hide();
                    $('#loader').show();

                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,

                        success: function (data, textStatus, jqXHR) {
                            console.log(data);

                            $('#Submit-btn').show();
                            $('#loader').hide();

                            if (data.trim() === 'done') {
                                swal("Successfully Registered We are redirecting to you login page...")
                                        .then((value) => {
                                            window.location = "login_page.jsp";
                                        });

                            }else{
                                swal(data);
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {

                            $('#Submit-btn').show();
                            $('#loader').hide();

                            swal("Something went wrong please try again...");
                        },

                        processData: false,
                        contentType: false

                    });

                });
            });
        </script>
    </body>
</html> 
