<%-- 
    Document   : header
    Created on : Dec 3, 2017, 4:35:14 PM
    Author     : amitk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="../Css/bootsrapSupport.css" rel="stylesheet" type="text/css"/>
<link href="../Css/styles.css" rel="stylesheet" type="text/css"/>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="../bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>
<script src="../JsScripts/Common.js" type="text/javascript"></script>
<header class="header db-header">
    <div class="content">
        <div class="logo">
            <img src="../images/logo.jpg" alt="">
        </div>
        <div class="rightPanel">
            <!--<nav>
                        <ul>
                                <li><a href="#">Back to website</a></li>
                        </ul>
                </nav>-->
            <div class="bigButton">
                <div class="btn-group">
                    <button type="button" class="btn btn-primary" data-toggle="dropdown">
                        Hi ${loginedUser.firstName} &nbsp;<span
                            class="caret"></span></button>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="${pageContext.request.contextPath}/login?logut=1" class="logout">Log Out</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</header>
<div class="adminNav">
    <div class="content">
        <nav class="navbar navbar-default" role="navigation">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span><span
                            class="icon-bar"></span><span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Brand</a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">Dashboard</a>
                        </li>
                 
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </nav>

        <div class="clear"></div>
    </div>
</div>    