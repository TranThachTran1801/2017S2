
<%@page import="model.Product"%>
<%@page import="java.util.List"%>

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
    List<Product> cartProduct = Settings.getCart(request).getProducts();

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
        <title><%=languageMap.get("title")%></title>
        <script src="js/my-script.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Space+Mono" rel="stylesheet">
        <style>
            tr, td {
                padding: 10px;
            }
        </style>
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


        <div class="clearfix"> </div><br>
        <div class="container">
            <div class="row">
                <form action="orderaction" method="post">

                    <div class="col-md-6" style="border: 1px solid  #bfbfbf;">
                        <h4><b><%=languageMap.get("checkout.title1")%></b></h4><hr style="border-top: 1px solid red; color:red">
                        <div class="col-md-12" >

                            <div class="table-responsive">
                                <table class="text-center">

                                    <tr>
                                        <td><b><%=languageMap.get("checkout.fullname")%></td>
                                        <td><input type="text"
                                                   name="checkout-fullname-name"
                                                   id="checkout-fullname-id"
                                                   placeholder="Your fullname...."
                                                   class="form-control"
                                                   style="width: 300px"></td>
                                    </tr>

                                    <tr>
                                        <td><b><%=languageMap.get("checkout.address")%></b></td>
                                        <td><textarea
                                                name="checkout-address-name"
                                                id="checkout-address-id"
                                                placeholder="Your address...."
                                                rows="4"
                                                class="form-control"></textarea></td>
                                    </tr>

                                    <tr>
                                        <td><b><%=languageMap.get("checkout.phone")%></b></td>
                                        <td><input type="text"
                                                   name="checkout-phone-name"
                                                   id="checkout-phone-name"
                                                   class="form-control"
                                                   style="width: 300px"></td>

                                    </tr>

                                    <tr>
                                        <td><b><%=languageMap.get("checkout.purchase")%></b></td>
                                        <td><select class="form-control"
                                                    name="checkout-purchase-name"
                                                    id="checkout-pusrchase-id"
                                                    style="width: 100px">
                                                <option value="MONEY"><%=languageMap.get("checkout.money")%></option>
                                                <option value="CARD"><%=languageMap.get("checkout.card")%></option>
                                            </select></td>
                                    </tr>
                                </table>
                            </div>
                            <h4><b><%=languageMap.get("checkout.purchaseBy")%>
                                <hr style="border-top: 1px solid black; color:black"></h4>

                            <div id="card-content" class="collapse">
                                <div class="table-responsive">
                                    <table>

                                        <tr>
                                            <td><b><%=languageMap.get("checkout.purchase")%></b></td>
                                            <td><select class="form-control"
                                                        name="checkout-carttype-name"
                                                        id="checkout-cartId-id"
                                                        style="width: 110px">
                                                    <option value="master">MASTER</option>
                                                    <option value="visa">VISA</option>
                                                </select></td>
                                        </tr>

                                        <tr>
                                            <td><b><%=languageMap.get("checkout.carid")%></b></td>
                                            <td><input type="text"
                                                       class="form-control"
                                                       name="checkout-cardId-name"
                                                       id="checkout-cardId-id"
                                                       style="width: 300px"></td>
                                        </tr>

                                    </table>
                                </div>
                            </div>

                            <div class="text-center">    
                                <button type="submit" style="width: 100%" class="btn btn-primary"><h5><%=languageMap.get("checkout.checkout")%> <span class="glyphicon glyphicon-log-in"></span> </h5></button>
                            </div>
                            <br>

                        </div>

                    </div>

                    <div class="col-md-5" style="border: 1px solid  #bfbfbf; margin-left: 20px">

                        <h4><b><%=languageMap.get("checkout.title2")%><%=cartProduct.size()%> <%=languageMap.get("checkout.good")%> </b></h4><hr style="border-top: 1px solid red; color:red">
                        <div class="col-md-12" >


                            <table class="table table-hover">
                                <thead>
                                    <tr class="success">
                                        <th><%=languageMap.get("checkout.good")%></th>
                                        <th><%=languageMap.get("checkout.quantity")%></th>
                                        <th><%=languageMap.get("checkout.price")%></th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <%
                                        int i = 0;
                                        double sum = 0.0;
                                        for (Product product : cartProduct) {
                                    %>
                                    <tr>
                                        <td><%=languageMap.get(product.getProductName()) == null ? product.getProductName() : languageMap.get(product.getProductName())%></td>
                                        <td><input type="number" 
                                                   class="form-control" 
                                                   value="1" 
                                                   min="1"
                                                   max="20"
                                                   id="my-quantity<%=i%>"
                                                   name="<%=product.getProductId()%>"
                                                   onchange="takeQuantity('my-quantity<%=i%>', 'my-cost<%=i%><%=i%>')"
                                                   style="width: 60px; height: 30px"></td>
                                        <td>
                                            <b><div id="my-cost<%=i%>">
                                                    <%=product.getProductPrice()%>
                                                </div></b>
                                            <input type="hidden" 
                                                   id="my-cost<%=i%><%=i%>"
                                                   value="<%=product.getProductPrice()%>">
                                        </td>
                                    </tr>
                                    <%
                                            i++;
                                            sum = sum + product.getProductPrice();
                                        }
                                        i = 0;
                                    %>


                                </tbody>

                            </table>

                            <div>
                                <h2><b><%=languageMap.get("checkout.total")%> <span style="color:red; font-family: 'Space Mono', monospace;"><span id="total-cost"><%=sum%></span> VND</span>
                                        <input type="hidden"
                                               name="total-cost-hidden-name"
                                               id="total-cost-hidden"
                                               value="<%=sum%>">
                                    </b>
                                </h2>
                            </div>

                        </div>
                    </div>

                </form>
            </div>



        </div>

    </body>

    <script type="text/javascript">
    </script>

</html>
<%}%>