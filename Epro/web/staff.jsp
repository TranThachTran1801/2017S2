
<%@page import="util.JsonBinder"%>
<%@page import="model.Checkout"%>
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

    List<OrderDAO> orderDAOs = ProductRepositoty.getAllOrder();

    if (languageMap == null) {
        request.getRequestDispatcher("language?lang=vi").forward(request, response);

    } else if (!ush.getAccrole().equals(UserRole.STAFF)) {
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
        <div class="container">
            <div class="row">
                <div class="col-lg-12 " style="border: 1px solid  #bfbfbf;">
                    <h1 class="col-lg-20 text-center" style=" font-size: 500%"><%=languageMap.get("staff.title")%></h1>
                    <hr style="border-top: 1px solid red; color:red">
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" class="btn-info btn-block" href="#info"><%=languageMap.get("staff.order")%> <span class="glyphicon glyphicon-arrow-down"></span></a></li>
                        <li><a data-toggle="tab" class="btn-primary" href="#order"><%=languageMap.get("staff.checkout")%> <span class="glyphicon glyphicon-arrow-down"></span></a></li>
                        <li><a data-toggle="tab" class="btn-danger" href="#stats"><%=languageMap.get("staff.stats")%> <span class="glyphicon glyphicon-arrow-down"></span></a></li>

                    </ul>

                    <div class="tab-content">
                        <div id="info" class="tab-pane fade in active">
                            <h3><%=languageMap.get("staff.order")%></h3>

                            <div class="table-responsive">
                                <table class="table text-center table-hover">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th><%=languageMap.get("staff.customername")%></th>
                                            <th><%=languageMap.get("staff.customeraddr")%></th>
                                            <th><%=languageMap.get("staff.customerphone")%></th>
                                            <th><%=languageMap.get("staff.orderDate")%></th>
                                            <th><%=languageMap.get("staff.purchaseBy")%></th>
                                            <th><%=languageMap.get("staff.total")%></th>
                                            <th><%=languageMap.get("staff.view")%></th>
                                            <th style="text-align: center"><input type="submit" 
                                                                                  class="btn btn-md btn-primary" 
                                                                                  value="<%=languageMap.get("staff.confirmation")%>"
                                                                                  onclick='processOrder()'></th>
                                            <th style="text-align: center"><input type="submit" 
                                                                                  class="btn btn-md btn-danger" 
                                                                                  value="<%=languageMap.get("staff.ignore")%>"
                                                                                  onclick=''></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            for (OrderDAO orderDAO : orderDAOs) {
                                        %>
                                        <tr id="<%=orderDAO.getOrderId()%>">
                                            <td><%=orderDAO.getOrderId()%></td>
                                            <td><%=orderDAO.getOrderFullname()%></td>
                                            <td><%=orderDAO.getOrderAddress()%></td>
                                            <td><%=orderDAO.getOrderPhone()%></td>
                                            <td><%=orderDAO.getOrderDate()%></td>
                                            <td><span class="btn btn-xs btn-warning"><%=orderDAO.getOrdertype()%></span></td>
                                            <td><%=orderDAO.getTotalCost()%></td>
                                            <td><a data-toggle="modal" data-target="#<%=orderDAO.getOrderId()%>-<%=orderDAO.getCustomerId()%>" class="btn btn-xs btn-success"><%=languageMap.get("staff.view2")%></a></td>
                                            <td style='text-align: center;'><input type='checkbox' name='orderCheckboxConfirm' value='<%=orderDAO.getOrderId()%>'></td>
                                            <td style='text-align: center;'><input type='checkbox' name='orderCheckboxIgnore' value='<%=orderDAO.getOrderId()%>'></td>
                                        </tr>
                                        <%}%>
                                    </tbody>

                                </table>
                            </div>

                        </div>
                        <div id="order" class="tab-pane fade">
                            <h3><%=languageMap.get("staff.checkout")%></h3>
                            <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                        </div>
                        <div id="stats" class="tab-pane fade">
                            <h3><%=languageMap.get("staff.stats")%></h3>
                            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <% for (OrderDAO orderDAO : orderDAOs) {%>


        <div class="modal fade" id="<%=orderDAO.getOrderId()%>-<%=orderDAO.getCustomerId()%>" role="dialog">
            <div class="modal-dialog">
                <%
                    Checkout myCheckout = (Checkout) JsonBinder.fromJson(orderDAO.getOrderform(), Checkout.class);
                    
                    int sum = 0;
                    for (Order order : myCheckout.getForms()) {
                        sum = sum + order.getQuantity();
                    }
                    
                %>
                <div class="modal-content">

                    <div class="modal-body" >
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title"><b><%=languageMap.get("checkout.title2")%><%=sum%> <%=languageMap.get("checkout.good")%></b></h4>
                        <hr style="border-top: 1px solid red; color:red">

                        <div class="table-responsive">

                            <table class="table" style="border: 1px solid  #bfbfbf;">
                                <thead>
                                    <tr>
                                        <th style="padding: 10px"><%=languageMap.get("checkout.good")%></th>
                                        <th style="padding: 10px"><%=languageMap.get("checkout.quantity")%></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for (Order order : myCheckout.getForms()) {%>
                                    <tr style="padding: 10px">
                                        <td style="padding: 10px"><%=order.getProductName()%></td>
                                        <td style="padding: 10px"><%=order.getQuantity()%></td>
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>

                        </div>

                    </div>

                </div>
            </div>
        </div>
        <%}%>



    </body>
</html>
<%}%>