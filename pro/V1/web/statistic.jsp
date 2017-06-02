
<%@page import="bean.order"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.DatabaseConnection"%>
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
<%@page import="java.util.*"%>
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

                        <li><a data-toggle="tab" class="btn-primary" href="#stats"><%=languageMap.get("admin.stats")%> <span class="glyphicon glyphicon-arrow-down"></span></a></li>

                    </ul>

                    <div class="tab-content">

                        <div id="stats" class="tab-pane fade">

                            <h3><%=languageMap.get("acc.history")%></h3>


                            <%
                                ArrayList<order> order = (ArrayList<order>) session.getAttribute("orderList");


                            %>
                            <div>
                                <table border="2" style="font-size: 150%; width: 50%">
                                    <tr>
                                        <th>ID_order</th>
                                        <th>day</th>
                                        <th>month</th>
                                        <th>year</th>
                                    </tr>
                                    <% for (int i = 0; i < order.size(); ++i) {
                                            order temp = order.get(i);
                                    %>
                                    <tr>
                                        <td><%=temp.getID_order()%></td>
                                        <td><%=temp.getDay()%></td>
                                        <td><%=temp.getMonth()%></td>
                                        <td><%=temp.getYear()%></td>
                                        <td><%=temp.getTotalPrice()%></td>
                                        <td><a href="controller?action=orderDetail&ID_order=<%=temp.getID_order()%>">Detail</a></td>
                                    </tr>
                                    <% } %>
                                </table>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </body>
</html>
<%}%>