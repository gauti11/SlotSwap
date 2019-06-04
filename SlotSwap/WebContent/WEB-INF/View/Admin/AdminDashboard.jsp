<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta charset="UTF-8">
        <title>Dashboard</title>
    </head>
    <body class="admin-pages">

        <div class="wrapper">
            <jsp:include page="header.jsp"></jsp:include>
                <link href="../Css/bootstrap-table.css" rel="stylesheet" type="text/css"/>
                <script src="../JsLib/bootstrap-table.js" type="text/javascript"></script>
                <script src="../JsScripts/AdminDashboard.js" type="text/javascript"></script>
                <style>
                    #tblUserList
                    {
                        margin-top: 0px !important;
                    }
                </style>
                <section class="contentArea">  
                    <h1>
                        Dashboard</h1>
                    <div class="row">
                        <div class="col-md-12 nopadding">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">User Registered</h3>
                                </div>
                                <div class="panel-body user-reg">
                                    <button class="btn btn-warning btn-lg" type="button">
                                        Today <span class="badge">$(today)</span>
                                    </button>

                                    <button class="btn btn-info btn-lg" type="button">
                                        Week <span class="badge">$(week)</span>
                                    </button>

                                    <button class="btn btn-danger btn-lg" type="button">
                                        Month <span class="badge">$(month)</span>
                                    </button>
                                    <img href="../Haskell/hours.svg"></img>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 nopadding">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Notifications</h3>
                                </div>
                                <div class="panel-body noti-pannel">
                                    <button class="btn btn-danger btn-lg" type="button">
                                        Pending Requests <span class="badge">16</span>
                                    </button>
                                    <button class="btn btn-primary btn-lg" type="button">
                                        Comments to approve <span class="badge">5</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <div class="push"></div>

            </div>
        <jsp:include page="footer.jsp"></jsp:include>

    </body>
</html>