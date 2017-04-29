
<%@page import="repository.AccountRepository"%>
<%@page import="repository.ProductRepositoty"%>
<%@page import="model.Order"%>
<%@page import="dao.OrderDAO"%>
<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page import="dao.BaseDAO"%>
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
    List<Account> unactivatedAccounts = AccountRepository.getUnactivatedAccounts();
    if (languageMap == null) {
        request.getRequestDispatcher("language?lang=vi").forward(request, response);

    } else if (!ush.getAccrole().equals(UserRole.ADMINISTRATOR)) {
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
        <link rel="stylesheet" type="text/css" href="css/adminTable.scss">
    </head>
    <body>
        <div class="header">
            <div class="top-header">
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
        </div><br>
        <div class="container">
            <div class="row">
                <div class="col-lg-10 col-md-offset-1" style="border: 1px solid  #bfbfbf;">
                    <h1 class="col-lg-20 text-center" style="font-size: 500%"><%=languageMap.get("admin.title")%></h1>
                    <hr style="border-top: 1px solid red; color:red">
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" class="btn-info btn-block" href="#activate"><%=languageMap.get("admin.activateacc")%> <span class="glyphicon glyphicon-arrow-down"></span></a></li>
                        <li><a data-toggle="tab" class="btn-primary" href="#stats"><%=languageMap.get("admin.stats")%> <span class="glyphicon glyphicon-arrow-down"></span></a></li>
                        <li><a data-toggle="tab" class="btn-danger" href="#profits"><%=languageMap.get("admin.profit")%> <span class="glyphicon glyphicon-arrow-down"></span></a></li>

                    </ul>

                    <div class="tab-content">
                        <div id="activate" class="tab-pane fade in active">
                            <h3>
                                <%=languageMap.get("admin.activateacc")%>
<!--                                <a href="#" class="btn btn-sm btn-success"><%=languageMap.get("admin.atvall")%></a>
                                <a href="#" class="btn btn-sm btn-warning"><%=languageMap.get("admin.inall")%></a>-->
                            </h3>

                            <div id="account-table">
                                <div class="table-responsive">
                                    
                                        <table class="table table-hover table-condensed">
                                            <thead >
                                                <tr>
                                                    <th>ID</th>
                                                    <th><%=languageMap.get("admin.username")%></th>
                                                    <th><%=languageMap.get("admin.email")%></th>
                                                    <th><%=languageMap.get("admin.date")%></th>
                                                    <th style="text-align: center"><input type="submit" 
                                                                                          class="btn btn-md btn-primary" 
                                                                                          value="<%=languageMap.get("admin.activate")%>"
                                                                                          onclick='activateAccount()'></th>
                                                    <th style="text-align: center"><input type="button" 
                                                                                          class="btn btn-md btn-danger" 
                                                                                          value="<%=languageMap.get("admin.ignore")%>"></th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <% for (Account account : unactivatedAccounts) {
                                                        out.print("<tr id='" + account.getId() + "'>"
                                                                + "<td>" + account.getId() + "</td>"
                                                                + "<td>" + account.getUsername() + "</td>"
                                                                + "<td>" + account.getEmail() + "</td>"
                                                                + "<td>" + account.getCreateDate() + "</td>"
                                                                + "<td style='text-align: center;'><input type='checkbox' name='activatedCheckbox' value='" + account.getId() + "'></td>"
                                                                + "<td style='text-align: center;'><input type='checkbox' name='ignoreCheckbox' value='" + account.getId() + "'></td></tr>");

                                                    }
                                                %>                                       
                                            </tbody>

                                        </table>
                                    
                                </div>
                            </div>
                        </div>
                        <div id="stats" class="tab-pane fade">
                            <h3><%=languageMap.get("admin.stats")%></h3>
                            <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                        </div>
                        <div id="profits" class="tab-pane fade">
                            <h3><%=languageMap.get("admin.profit")%></h3>
                            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
<%}%>