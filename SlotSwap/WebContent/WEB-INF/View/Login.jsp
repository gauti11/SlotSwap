<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login</title>
        <!-- Bootstrap -->
        <link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="Css/bootsrapSupport.css" rel="stylesheet" type="text/css">
        <link href="Css/styles.css" rel="stylesheet" type="text/css">
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body class="login">
        <div class="login-top-area"></div>
        <section class="login-content">
            <div class="login-logo">
                <img src="images/logo.jpg" alt="">
            </div>
            <div class="login-form">
                <form method="POST" action="${pageContext.request.contextPath}/login">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Email</label>
                        <input name="email" value="${loginEntity.email}" type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Password</label>
                        <input  name="password" value= "${loginEntity.password}" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                    </div>

                    <button type="submit" class="btn btn-primary">Login</button>
                    <a class="pull-right" style="margin-top: 10px;">Forgot your password?</a>
                    <p style="color: red;">${errorString}</p>
                </form>

            </div>
            <div class="clear"></div>

        </section>
        <div class="login-footer">
            &copy; 2017 Slot Swap. All rights reserved.
        </div>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://code.jquery.com/jquery.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>