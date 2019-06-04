<%-- 
    Document   : AdminUserList
    Created on : Dec 4, 2017, 7:35:27 PM
    Author     : amitk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                        Users
                        <a href="${pageContext.request.contextPath}/Admin/AddUser" class="pull-right btn btn-primary">Add User</a></h1>
                    <section class="searchFilters">
                        <div class="col-md-2">
                            <div class="form-group">
                                <label for="1">Quick Search</label>
                                <input type="text" class="form-control input-sm" id="txtSrchSearchBy" placeholder="">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <button class="btn btn-primary" onclick="SearchExpenseList()">Search</button>
                            <button class="btn btn-default" onclick="ResetExpenseList()">Reset</button>
                        </div>
                        <div class="clear"></div>
                    </section>
                    <div class="table-responsive">
                        <table class="table table-hover table-bordered" id="tblUserList">

                        </table>
                    </div>
                    <div class="clear">
                    </div>
                    <div class="edit_project">
                        <div class="modal fade" id="delModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">
                                            <span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                        <h4 class="modal-title" id="myModalLabel">
                                            Delete
                                        </h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="editModal">
                                            <div class="form-group">
                                                <p>
                                                    Are you sure you want to delete?</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-primary">
                                            Delete</button>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">
                                            Cancel</button>
                                    </div>
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