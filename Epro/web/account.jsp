
<%@page import="util.Encript"%>
<%@page import="model.Account"%>
<%@page import="model.UserRole"%>
<%@page import="model.UserSessionHolder"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="util.Settings"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Map<String, String> languageMap = (HashMap<String, String>) Settings.getSessionAttribute(request, "languageCode");
    UserSessionHolder ush = Settings.getCurrentUserSession(request);
    Account account = Settings.getCurrentAccount(request);

    if (languageMap == null) {
        request.getRequestDispatcher("language?lang=vi").forward(request, response);

    } else if (!ush.getAccrole().equals(UserRole.CUSTOMER)) {
        response.sendRedirect("index.jsp");
    } else {
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Cabin+Sketch" />
        <title><%=languageMap.get("title")%></title>
        <script src="js/base-ajax.js"></script>
        <script src="js/md5.min.js"></script>
    </head>
    <body>
        <div class="header">
            <div class="top-header" style="background-color: #244b5e">
                <div class="container">
                    <div class="top-header-left">
                        <ul class="support">
                            <li><a href="error.jsp"><label> </label></a></li>
                            <li><a href="error.jsp"><%=languageMap.get("live_support")%><span class="live"></span></a></li>
                        </ul>
                        <ul class="support">
                            <li class="van"><a href="error.jsp"><label> </label></a></li>
                            <li><a href="error.jsp"><%=languageMap.get("shipping")%><span class="live"></span></a></li>
                        </ul>
                    </div>
                    <div class="col-lg-10 top-header-right">
                        <ul class="support">
                            <li><a href="index.jsp"><span class="glyphicon glyphicon-arrow-left"></span>  Home</a><a href="#"></a> 
                        </ul>        
                    </div>
                </div>
                <!---->
                <div class="clearfix"> </div>	
            </div>
            <div class="clearfix"> </div>		
        </div>
                        <br>
        <div class="container" >
            <div class="row" >
                <div class="col-lg-10 col-md-offset-1" style="border: 1px solid  #bfbfbf; box-shadow: 2px 2px 2px 2px #888888;">
                    <h1 class="col-lg-20 text-center" style="font-size: 400%"><%=languageMap.get("acc.title")%></h1>
                    <hr style="border-top: 1px solid red; color:red">
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" class="btn-primary btn-block" href="#profile"><%=languageMap.get("acc.profile")%> <span class="glyphicon glyphicon-arrow-down"></span></a></li>
                        <li><a data-toggle="tab" class="btn-danger" href="#history"><%=languageMap.get("acc.history")%> <span class="glyphicon glyphicon-arrow-down"></span></a></li>

                    </ul>

                    <div class="tab-content">
                        <div id="profile" class="tab-pane fade in active ">
                            <h3><%=languageMap.get("acc.profile")%> <a data-toggle="modal" data-target="#changePassModal" class="btn btn-md btn-primary"><%=languageMap.get("acc.changepass")%></a></h3>
                            <div class="well well-sm">
                                <table class="table">
                                    <tbody>
                                        <tr class="default">
                                            <td>ID</td>
                                            <td><%=account.getId()%></td>
                                        </tr>
                                        <tr>
                                            <td><%=languageMap.get("reg.usrnm")%></td>
                                            <td><%=account.getUsername()%></td>
                                        </tr>
                                        <tr>
                                            <td><%=languageMap.get("reg.email")%></td>
                                            <td><%=account.getEmail()%></td>
                                        </tr>
                                        <tr>
                                            <td><%=languageMap.get("acc.createDate")%></td>
                                            <td><%=account.getCreateDate()%></td>
                                        </tr>
                                        </tr>
                                        <tr>
                                            <td><%=languageMap.get("acc.role")%></td>
                                            <td><%=account.getRole()%></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div id="history" class="tab-pane fade">
                            <h3><%=languageMap.get("acc.history")%></h3>
                            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="changePassModal" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <img src="images/changepass.jpg" class="center-block" height="130">
                        <h4 style="text-align: center;font-size: 25px">
                            <span style="color: #2eb82e" class="glyphicon glyphicon-cog"></span> <%=languageMap.get("acc.changepass")%>
                        </h4>
                    </div>
                    <div class="modal-body">
                        <form role="form" action="changepassword" onsubmit="return(changePasswordValidate())" method="post" name="changePassForm">

                            <div class="form-group">
                                <label for="usrname"><span style="color:#ff9933" class="glyphicon glyphicon-lock"></span> <%=languageMap.get("acc.oldpass")%></label>
                                <input type="password" name="oldPassword" class="form-control" id="old-password">
                                <div style="color:red" id="oldpass-error"></div>
                            </div>

                            <div class="form-group">
                                <label for="psw"><span style="color:#e60000" class="glyphicon glyphicon-eye-open"></span> <%=languageMap.get("acc.newpass")%></label>
                                <input type="password" name="newPassword" class="form-control" id="new-password">
                                <div style="color:red" id="newpass-error"></div>
                            </div>

                            <div class="form-group">
                                <label for="usrname"><span style="color:#999900" class="glyphicon glyphicon-lock"></span> <%=languageMap.get("acc.retypass")%></label>
                                <input type="password" name="retyPassword" class="form-control" id="rety-password">
                                <div style="color:red" id="newpass-error"></div>
                            </div>
                            <input type="hidden" name="accountId" value="<%=account.getId()%>">
                            <div>
                                <b><%=languageMap.get("acc.changeSuccess")%></b>
                            </div>
                            <button type="submit" class="btn btn-primary btn-block"><h5><%=languageMap.get("acc.changepass")%> <span class="glyphicon glyphicon-log-in"></span> </h5></button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> <%=languageMap.get("cart.close")%></button>

                    </div>
                </div>
            </div>
        </div>                  




    </body>
    <script type="text/javascript">

        function changePasswordValidate() {
            var oldpass = document.getElementById("old-password").value;
            var newpass = document.getElementById("new-password").value;
            var rety = document.getElementById("rety-password").value;

            var encriptPass = md5(oldpass);
            var currentPass = '<%=account.getPassword()%>';

            if (oldpass.length < 5 || oldpass.length > 20) {
                document.changePassForm.oldPassword.focus();
                document.getElementById("oldpass-error").innerHTML = '<%=languageMap.get("reg.passerr")%>';
                return false;
            }

            if (encriptPass !== currentPass) {
                document.changePassForm.oldPassword.focus();
                document.getElementById("oldpass-error").innerHTML = '<%=languageMap.get("acc.oldPassErr")%>';
                return false;
            }

            if (newpass.length < 5 || newpass.length > 20) {
                document.changePassForm.newPassword.focus();
                document.getElementById("newpass-error").innerHTML = '<%=languageMap.get("reg.passerr")%>';
                return false;
            }

            if (newpass !== rety) {
                document.changePassForm.newPassword.focus();
                document.getElementById("newpass-error").innerHTML = '<%=languageMap.get("acc.newPassErr")%>';
                return false;
            }

            return true;
        }

    </script>
</html>
<%}%>