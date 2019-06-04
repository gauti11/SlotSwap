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
                <link href="../Css/bootstrap-timepicker.min.css" rel="stylesheet" type="text/css"/>
                <script src="../JsLib/bootstrap-timepicker.min.js" type="text/javascript"></script>
                <section class="contentArea">  
                    <h1>
                        Add User</h1>
                    <form method="POST" action="${pageContext.request.contextPath}/Admin/AddUser">
                    <div class="row">
                        <div class="form-group col-md-4">
                            <label for="">First Name</label>
                            <input type="text" required name="firstName" value="${AddUser.firstName}" class="form-control" id="" />
                        </div>
                        <div class="form-group col-md-4">
                            <label for="">Last Name</label>
                            <input type="text" required name="lastName" value="${AddUser.lastName}" class="form-control" id="" />
                        </div>
                        <div class="form-group col-md-4">
                            <label for="">Email</label>
                            <input type="email"  required name="email" value="${AddUser.email}"class="form-control" id="Password1" />
                        </div>
                        
                        <div class="form-group col-md-4">
                            <label for="">Password</label>
                            <input type="password" required name="password" value="${AddUser.Password}"class="form-control" id="Password1" />
                        </div>
                        
                        <div class="form-group col-md-4">
                            <label for="">Restaurant</label>
                            <div class="dropdown">
                                <select name="restaurantId" value="${AddUser.RestaurantId}" >
                                    <option selected value="0">--Select--</option>
                                    <option value="1">Mughal</option>
                                    <option value="2">Dukin</option>
                                    <option value="3">Star Bucks</option>
                                    <option value="4">Sushi</option>
                                </select>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <div class="table-responsive form-group col-md-8">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Week Day</th>
                                        <th>Start Time</th>
                                        <th>End time</th>
                                        <th>Not Available</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>

                                        <td>Monday</td>
                                        <td><input class="wkd1"  type="text" name="mStartTime" value="${AddUser.MondayStartTime}" class="form-control" id="Password2" />
                                        </td>
                                        <td><input class="wkd1" type="text" name="mEndTime" value="${AddUser.MondayEndTime}" class="form-control" id="Password2" />
                                        </td>
                                        <td><input id="wkd1" onchange="disableRow('wkd1')" type="checkbox" name="mAction" value="${AddUser.mAction}"></td>

                                    </tr>
                                    <tr>

                                        <td>Tuesday</td>
                                        <td><input class="wkd2" type="text" name="tStartTime" value="${AddUser.TuesdayStartTime}" class="form-control" id="Password2" />
                                        </td>
                                        <td><input class="wkd2" type="text" name="tEndTime" value="${AddUser.TuesdayEndTime}" class="form-control" id="Password2" />
                                        </td>
                                        <td><input id="wkd2" onchange="disableRow('wkd2')" type="checkbox" name="tAction" value="${AddUser.tAction}"></td>

                                    </tr>
                                    <tr>

                                        <td>Wednesday</td>
                                        <td><input class="wkd3" type="text" name="wStartTime" value="${AddUser.WednesdayStartTime}" class="form-control" id="Password2" />
                                        </td>
                                        <td><input class="wkd3" type="text" name="wEndTime" value="${AddUser.WednesdayEndTime}" class="form-control" id="Password2" />
                                        </td>
                                        <td><input id="wkd3" onchange="disableRow('wkd3')" type="checkbox" name="wAction" value="${AddUser.wAction}"></td>

                                    </tr>
                                    <tr>

                                        <td>Thursday</td>
                                        <td><input class="wkd4" type="text" name="thStartTime" value="${AddUser.ThursdayStartTime}" class="form-control" id="Password2" />
                                        </td>
                                        <td><input class="wkd4" type="text" name="thEndTime" value="${AddUser.ThursdayEndTime}" class="form-control" id="Password2" />
                                        </td>
                                        <td><input id="wkd4" onchange="disableRow('wkd4')" type="checkbox" name="thAction" value="${AddUser.thAction}"></td>

                                    </tr>
                                    <tr>

                                        <td>Friday</td>
                                        <td><input class="wkd5"  type="text" name="fStartTime" value="${AddUser.FridayStartTime}" class="form-control" id="Password2" />
                                        </td>
                                        <td><input class="wkd5" type="text" name="fEndTime" value="${AddUser.FridayEndTime}" class="form-control" id="Password2" />
                                        </td>
                                        <td><input id="wkd5" onchange="disableRow('wkd5')" type="checkbox" name="fAction" value="${AddUser.fAction}"></td>

                                    </tr>
                                    <tr>

                                        <td>Saturday</td>
                                        <td><input class="wkd6" type="text" name="stStartTime" value="${AddUser.SaturdayStartTime}" class="form-control" id="Password2" />
                                        </td>
                                        <td><input class="wkd6" type="text" name="stEndTime" value="${AddUser.SaturdayEndTime}" class="form-control" id="Password2" />
                                        </td>
                                        <td><input id="wkd6" onchange="disableRow('wkd6)" type="checkbox" name="stAction" value="${AddUser.stAction}"></td>

                                    </tr>
                                    <tr>

                                        <td>Sunday</td>
                                        <td><input class="wkd7" type="text" name="sStartTime" value="${AddUser.SundayStartTime}" class="form-control" id="Password2" />
                                        </td>
                                        <td><input class="wkd7" type="text" name="sEndTime" value="${AddUser.SundayEndTime}" class="form-control" id="Password2" />
                                        </td>
                                        <td><input id="wkd7" onchange="disableRow('wkd7')" type="checkbox" name="sAction" value="${AddUser.sAction}"></td>

                                    </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>
                    <div class="col-md-12">
                        <button type="submit" class="btn btn-primary">Save</button>
                        <a href="${pageContext.request.contextPath}/Admin/Dashboard" class="btn btn-default">Cancel</a>

                    </div>
                </form>

                <div class="push"></div>

        </div>
        <jsp:include page="footer.jsp"></jsp:include>

    </body>
</html>

<script type="text/javascript">
    function disableRow(rowid) {

        if ($('#' + rowid).is(':checked')) {
            $("." + rowid).val("");
            $("." + rowid).prop("disabled", true);
        } else {
            $("." + rowid).prop("disabled", false);
        }
        //document.getElementById('IdOfTheTextbox').disabled = this.checked;
    }
    $(document).ready(function () {
        
         $('.wkd1, .wkd2, .wkd3, .wkd4, .wkd5, .wkd6, .wkd7').timepicker({
                minuteStep: 1,
                template: 'modal',
                appendWidgetTo: 'body',
                showSeconds: true,
                showMeridian: false,
                defaultTime: false
            });
    });
</script>