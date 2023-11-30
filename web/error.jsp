
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>sorry! something went wrong</title>
        
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
        
        <div class="container text-center mt-5">
            
            <img src="image/error.png" class="img-fluid" width="25%" height="25%"><!-- image -->
            <h3 class="display-3 mt-2">Sorry! Something went wrong...</h3>
          
            <a href="index.jsp" class="btn primary-background btn-lg text-white mt-3">Home</a>
        </div>
        
    </body>
</html>
