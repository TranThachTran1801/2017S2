

<%@page import="repository.APIFetcher"%>
<%@page import="repository.ProductRepositoty"%>
<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page import="model.UserRole"%>
<%@page import="model.UserSessionHolder"%>
<%@page import="util.Settings"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ResourceBundle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Map<String, String> map = (HashMap<String, String>) Settings.getSessionAttribute(request, "languageCode");
    UserSessionHolder ush = Settings.getCurrentUserSession(request);

    List<Product> products = ProductRepositoty.getAllProduct();
    String cartSettings = "href=\"login.jsp\"";

    if (map == null) {
        request.getRequestDispatcher("language?lang=vi").forward(request, response);
    } else {
%>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="ContentType" content="text/html" charset="utf-8"/>
        <title><%=map.get("title")%></title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
        <script src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/my-script.js"></script>
        <script src="js/base-ajax.js"></script>
    </head>
    <body> 
        <!--header-->
        <div class="header">
            <div class="top-header">
                <div class="container">
                    <div class="top-header-left">
                        <ul class="support">
                            <li><a href="error.jsp"><label> </label></a></li>
                            <li><a href="error.jsp"><%=map.get("live_support")%><span class="live"></span></a>

                            </li>
                        </ul>
                        <ul class="support">
                            <li class="van"><a href="error.jsp"><label> </label></a></li>
                            <li><a href="error.jsp"><%=map.get("shipping")%><span class="live"></span></a></li>
                        </ul>
                    </div>
                    <div class="top-header-right">
                        <ul class="support">
                            <li><a href="language?lang=vi">Tiếng Việt</a><a href="#">|</a> 
                            <li><a href="language?lang=en">English</a>
                        </ul>        
                    </div>
                </div>
                <!---->
                <div class="clearfix"> </div>	
            </div>
            <div class="clearfix"> </div>		
        </div>
    </div>
    <div class="bottom-header">
        <div class="container">
            <div class="col-sm-3 header-bottom-left">
                <div class="logo">
                    <a href="index.jsp">E-<span>COMMERCE</span></a>
                </div>
                <div class="search">
                    <input type="text" value="" placeholder="<%=map.get("place_holder")%>" 
                           onfocus="this.value = '';" 
                           onblur="if (this.value === '') {
                                       this.value = '';
                                   }" >
                    <input type="submit"  value="<%=map.get("search")%>">

                </div>
                <div class="clearfix"> </div>
            </div>

            <div class="col-sm-6 header-bottom-right">	

                <% if (ush.getAccrole() == UserRole.GUEST) {%>
                <div class="account"><a href="login.jsp"><span></span><%=map.get("my_account")%></a></div>
                <ul class="login">
                    <li><a href="login.jsp"><span> </span><%=map.get("login")%> </a></li>
                    <li><a data-toggle="modal" data-target="#registerModal">| <%=map.get("reg")%></a></li>
                </ul>
                <% } else {
                    String settings = "";
                    if (ush.getAccrole().equals(UserRole.ADMINISTRATOR)) {
                        settings = "admin.jsp";
                        cartSettings = "data-toggle=\"modal\" data-target=\"#myModal\"";
                    } else if (ush.getAccrole().equals(UserRole.CUSTOMER)) {
                        settings = "account.jsp";
                        cartSettings = "data-toggle=\"modal\" data-target=\"#myModal\"";
                    } else if (ush.getAccrole().equals(UserRole.STAFF)) {
                        settings = "staff.jsp";
                        cartSettings = "data-toggle=\"modal\" data-target=\"#myModal\"";
                    }

                %>
                <div class="account"><a href="#"><span></span><%=map.get("account.welcome")%><%=ush.getAccname()%></a></div>
                <ul class="login">
                    <li><a href="<%=settings%>"><span> </span><%=map.get("account.setting")%> </a></li> 
                    <li><a href="logout">| <%=map.get("logout")%> </a></li>
                </ul>
                <%}%>

                <div class="cart"><a <%=cartSettings%>><span> </span><%=map.get("cart")%></a></div>
                <div class="clearfix"> </div>
            </div>

            <div class="clearfix"> </div>	
        </div>
    </div>
</div>

<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">

        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"><%=map.get("cart.title")%>
                    <input type="button" 
                           class="btn btn-primary btn-md"
                           value="<%=map.get("cart.refesh")%>" 
                           onclick="updateMyCart()"></h4>
            </div>
            <div class="modal-body">
                <div id="cart-content">
                    <table class="table table-hover">
                        <thead>
                            <tr class="danger">
                                <th><%=map.get("cart.id")%></th>
                                <th><%=map.get("cart.name")%></th>
                                <th><%=map.get("cart.price")%></th>
                            </tr>
                        </thead>

                        <tbody>

                            <%
                                List<Product> cartProduct = Settings.getCart(request).getProducts();
                                for (Product product : cartProduct) {
                                    out.print("<tr>"
                                            + "<td>" + product.getProductId() + "</td>"
                                            + "<td>" + map.get(product.getProductName()) + "</td>"
                                            + "<td>" + product.getProductPrice() + "</td></tr>");
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-md btn-primary" data-toggle="modal" data-target="#proceedModal"><%=map.get("cart.order")%></button>
                <button type="button" class="btn btn-md btn-default" data-dismiss="modal"><%=map.get("cart.close")%></button>
            </div>
        </div>

    </div>
</div>

<div class="modal fade" id="proceedModal" role="dialog">
    <div class="modal-dialog">

        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h3 class="text-danger modal-title"><%=map.get("cart.anno")%></h3>
            </div>
            <div class="modal-body">
                <a href="order.jsp" class="btn btn-md btn-success "><%=map.get("cart.proceed")%></a>
                <button type="button" class="btn btn-md btn-danger pull-right" data-dismiss="modal"><%=map.get("cart.ignore")%></button>
            </div>
        </div>

    </div>
</div>    

<div class="modal fade" id="registerModal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <img src="images/regpic.png" class="center-block" height="180">
                <h4 style="text-align: center;font-size: 25px">
                    <span style="color: #86b300" class="glyphicon glyphicon-cog"></span> <%=map.get("reg.title")%>
                </h4>
            </div>
            <div class="modal-body">
                <form role="form" action="signup" onsubmit="return(registerValidate())" method="post" name="regForm">
                    <div class="form-group">
                        <label for="usrname"><span style="color: #c7e600"class="glyphicon glyphicon-user"></span> <%=map.get("reg.usrnm")%></label>
                        <input type="text" name="regUsername" class="form-control" id="reg-username" placeholder="<%=map.get("reg.usrnmh")%>">
                        <div style="color:red" id="username-error"></div>
                    </div>
                    <div class="form-group">
                        <label for="usrname"><span class="glyphicon glyphicon-envelope"></span> Email</label>
                        <input type="text" name="regEmail" class="form-control" id="reg-email" placeholder="<%=map.get("reg.emailh")%>">
                        <div style="color:red" id="email-error"></div>
                    </div>
                    <div class="form-group">
                        <label for="usrname"><span style="color:#ff0066" class="glyphicon glyphicon-lock"></span> <%=map.get("reg.pass")%></label>
                        <input type="password" name="regPassword" class="form-control" id="reg-pass" placeholder="<%=map.get("reg.passh")%>">
                        <div style="color:red" id="pass-error"></div>
                    </div>
                    <div class="form-group">
                        <label for="psw"><span style="color:#e60000" class="glyphicon glyphicon-eye-open"></span> <%=map.get("reg.repass")%></label>
                        <input type="password" name="regRepass" class="form-control" id="reg-repass" placeholder="<%=map.get("reg.repassh")%>">
                        <div style="color:red" id="repass-error"></div>
                    </div>
                    <button type="submit" class="btn btn-primary btn-block"><h5><%=map.get("reg.signup")%> <span class="glyphicon glyphicon-log-in"></span> </h5></button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> <%=map.get("cart.close")%></button>
                <p><%=map.get("reg.already")%> <a style="color: blue"href="login.jsp"><%=map.get("login")%></a></p>
                <p><a style="color: blue"href="#"> <%=map.get("login.help")%></a></p>
            </div>
        </div>
    </div>
</div>      

<script type="text/javascript">

    function registerValidate() {

        var username = document.getElementById("reg-username").value;
        var email = document.getElementById("reg-email").value;
        var password = document.getElementById("reg-pass").value;
        var repass = document.getElementById("reg-repass").value;

        if (username.length <= 0 || username.length > 16) {
            document.regForm.regUsername.focus();
            document.getElementById("username-error").innerHTML = '<%=map.get("reg.usrnmerr")%>';
            return false;
        }

        if (isEmailValidate(email) === false) {
            document.regForm.regEmail.focus();
            document.getElementById("email-error").innerHTML = '<%=map.get("reg.emailerr")%>';
            return false;
        }

        if (password.length <= 5 || password.length > 20) {
            document.regForm.regPassword.focus();
            document.getElementById("pass-error").innerHTML = '<%=map.get("reg.passerr")%>';
            return false;
        }

        if (password !== repass) {
            document.regForm.regPassword.focus();
            document.getElementById("pass-error").innerHTML = '<%=map.get("reg.repasserr")%>';
            document.getElementById("repass-error").innerHTML = '<%=map.get("reg.repasserr")%>';
            return false;
        }

        return true;
    }


</script>
<!---->
<div class="container">
    <div class="shoes-grid">

        <!---->
        <div class="row" style="padding-top: 17px; padding-left: 3px">

            <div class="" style="padding:10px ;">		  
                <div class="row">
                    <h1><%=map.get("television.title")%></h1>
                    <%
                        List<Product> productsByCate = APIFetcher.fetcher("/televisionApi");

                        for (Product product : productsByCate) {%>
                    <div class="col-md-6" style="border: 1px solid  #bfbfbf;">
                        <br>
                        <div class="col-md-12">
                            <div class="col-md-6" style="word-break:break-all; ">
                                <p style="font-size: 120%"><b><%=product.getProductName()%><b></p>
                                            <p style="color: red">$<%=product.getProductPrice()%></p>
                                            <br>
                                            <a href="view.jsp?productId=<%=product.getProductId()%>">
                                                <span class="on-get"><%=map.get("get")%></span>
                                            </a>
                                            </div>
                                            <div class="col-md-6" style="">
                                                <a href="view.jsp?productId=<%=product.getProductId()%>">
                                                    <% if (!product.getInfo().isEmpty()) { %>
                                                        <img src="<%=product.getInfo()%>" style="width: 150px ;height: 150px;">
                                                       <% } else { %>
                                                        <img src="images/<%=product.getProductId()%>.jpg" style="width: 150px ;height: 150px;">
                                                    <%}%>
                                                </a>
                                            </div>
                                            </div>


                                            </div><%}%>
                                            </div>

                                            </div>

                                            </div>

                                            <div class="products">
                                                <%=map.get("products")%>
                                            </div>
                                            <div class="product-left">
                                                <div class="col-md-4 chain-grid">
                                                    <a href="view.jsp?productId=<%=products.get(5).getProductId()%>"><img class="img-responsive chain" src="images/P006.jpg" alt=" " /></a>
                                                    <span class="star"> </span>
                                                    <div class="grid-chain-bottom">
                                                        <h6><a href="view.jsp?productId=<%=products.get(5).getProductId()%>">
                                                                <%=map.get(products.get(5).getProductName())%>
                                                            </a></h6>
                                                        <div class="star-price">
                                                            <div class="dolor-grid"> 
                                                                <span class="actual">800<%=map.get("money")%></span>
                                                                <span class="reducedfrom">1200<%=map.get("money")%></span>
                                                                <span class="rating">
                                                                    <input type="radio" class="rating-input" id="rating-input-1-5" name="rating-input-1">
                                                                    <label for="rating-input-1-5" class="rating-star1"> </label>
                                                                    <input type="radio" class="rating-input" id="rating-input-1-4" name="rating-input-1">
                                                                    <label for="rating-input-1-4" class="rating-star1"> </label>
                                                                    <input type="radio" class="rating-input" id="rating-input-1-3" name="rating-input-1">
                                                                    <label for="rating-input-1-3" class="rating-star"> </label>
                                                                    <input type="radio" class="rating-input" id="rating-input-1-2" name="rating-input-1">
                                                                    <label for="rating-input-1-2" class="rating-star"> </label>
                                                                    <input type="radio" class="rating-input" id="rating-input-1-1" name="rating-input-1">
                                                                    <label for="rating-input-1-1" class="rating-star"> </label>
                                                                </span>
                                                            </div>
                                                            <div class="clearfix"> </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 chain-grid">
                                                    <a href="view.jsp?productId=<%=products.get(6).getProductId()%>"><img class="img-responsive chain" src="images/P007.jpg" alt=" " /></a>
                                                    <span class="star"> </span>
                                                    <div class="grid-chain-bottom">
                                                        <h6><a href="view.jsp?productId=<%=products.get(6).getProductId()%>">
                                                                <%=map.get(products.get(6).getProductName())%></a></h6>
                                                        <div class="star-price">
                                                            <div class="dolor-grid"> 
                                                                <span class="actual">500<%=map.get("money")%></span>
                                                                <span class="reducedfrom">800<%=map.get("money")%></span>
                                                                <span class="rating">
                                                                    <input type="radio" class="rating-input" id="rating-input-1-5" name="rating-input-1">
                                                                    <label for="rating-input-1-5" class="rating-star1"> </label>
                                                                    <input type="radio" class="rating-input" id="rating-input-1-4" name="rating-input-1">
                                                                    <label for="rating-input-1-4" class="rating-star1"> </label>
                                                                    <input type="radio" class="rating-input" id="rating-input-1-3" name="rating-input-1">
                                                                    <label for="rating-input-1-3" class="rating-star"> </label>
                                                                    <input type="radio" class="rating-input" id="rating-input-1-2" name="rating-input-1">
                                                                    <label for="rating-input-1-2" class="rating-star"> </label>
                                                                    <input type="radio" class="rating-input" id="rating-input-1-1" name="rating-input-1">
                                                                    <label for="rating-input-1-1" class="rating-star"> </label>
                                                                </span>
                                                            </div>

                                                            <div class="clearfix"> </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 chain-grid grid-top-chain">
                                                    <a href="view.jsp?productId=<%=products.get(7).getProductId()%>"><img class="img-responsive chain" src="images/P008.jpg" alt=" " /></a>
                                                    <span class="star"> </span>
                                                    <div class="grid-chain-bottom">
                                                        <h6><a href="view.jsp?productId=<%=products.get(7).getProductId()%>">
                                                                <%=map.get(products.get(7).getProductName())%></a></h6>
                                                        <div class="star-price">
                                                            <div class="dolor-grid"> 
                                                                <span class="actual">300<%=map.get("money")%></span>
                                                                <span class="reducedfrom">400<%=map.get("money")%></span>
                                                                <span class="rating">
                                                                    <input type="radio" class="rating-input" id="rating-input-1-5" name="rating-input-1">
                                                                    <label for="rating-input-1-5" class="rating-star1"> </label>
                                                                    <input type="radio" class="rating-input" id="rating-input-1-4" name="rating-input-1">
                                                                    <label for="rating-input-1-4" class="rating-star1"> </label>
                                                                    <input type="radio" class="rating-input" id="rating-input-1-3" name="rating-input-1">
                                                                    <label for="rating-input-1-3" class="rating-star"> </label>
                                                                    <input type="radio" class="rating-input" id="rating-input-1-2" name="rating-input-1">
                                                                    <label for="rating-input-1-2" class="rating-star"> </label>
                                                                    <input type="radio" class="rating-input" id="rating-input-1-1" name="rating-input-1">
                                                                    <label for="rating-input-1-1" class="rating-star"> </label>
                                                                </span>
                                                            </div>
                                                            <div class="clearfix"> </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="clearfix"> </div>
                                            </div>
                                            <div class="clearfix"> </div>
                                            </div>   
                                            <div class="sub-cate">
                                                <div class=" top-nav rsidebar span_1_of_left">
                                                    <h3 class="cate"><%=map.get("cate")%></h3>
                                                    <ul class="menu">
                                                        <li class="item1"><a href="error.jsp"><%=map.get("electronic")%></a>
                                                            <ul class="cute">
                                                                <li class="subitem1"><a href="phone.jsp"><%=map.get("phone")%></a></li>
                                                                <li class="subitem2"><a href="laptop.jsp">Laptop</a></li>
                                                                <li class="subitem3"><a href="tablet.jsp"><%=map.get("ipad")%></a></li>
                                                                <li class="subitem4"><a href="television.jsp"><%=map.get("tv")%></a></li>
                                                                <li class="subitem5"><a href="error.jsp"><%=map.get("camera")%></a></li>
                                                            </ul>
                                                        </li>
                                                        <li class="item2"><a href="error.jsp"><%=map.get("clothes")%></a>
                                                            <ul class="cute">
                                                                <li class="subitem1"><a href="error.jsp"><%=map.get("men")%></a></li>
                                                                <li class="subitem2"><a href="error.jsp"><%=map.get("women")%></a></li>
                                                                <li class="subitem2"><a href="error.jsp"><%=map.get("child")%></a></li>
                                                            </ul>
                                                        </li>
                                                        <li class="item3"><a href="error.jsp"><%=map.get("jewellery")%></a>
                                                            <ul class="cute">
                                                                <li class="subitem1"><a href="error.jsp"><%=map.get("bags")%></a></li>
                                                                <li class="subitem2"><a href="error.jsp"><%=map.get("eyewear")%></a></li>
                                                                <li class="subitem3"><a href="error.jsp"><%=map.get("hat")%></a></li>
                                                                <li class="subitem3"><a href="error.jsp"><%=map.get("shoes")%></a></li>
                                                            </ul>
                                                        </li>
                                                        <li class="item3"><a href="error.jsp"><%=map.get("living")%></a>
                                                            <ul class="cute">
                                                                <li class="subitem1"><a href="error.jsp"><%=map.get("kitapp")%></a></li>
                                                                <li class="subitem2"><a href="error.jsp"><%=map.get("cleanapp")%></a></li>
                                                                <li class="subitem3"><a href="error.jsp"><%=map.get("washapp")%></a></li>
                                                                <li class="subitem3"><a href="error.jsp"><%=map.get("bathapp")%></a></li>
                                                                <li class="subitem3"><a href="error.jsp"><%=map.get("outapp")%></a></li>
                                                                <li class="subitem3"><a href="error.jsp"><%=map.get("decoapp")%></a></li>
                                                            </ul>
                                                        </li>
                                                        <li class="item4"><a href="error.jsp"><%=map.get("home")%></a>
                                                            <ul class="cute">
                                                                <li class="subitem1"><a href="error.jsp"><%=map.get("ion")%></a></li>
                                                                <li class="subitem2"><a href="error.jsp"><%=map.get("fridge")%></a></li>
                                                                <li class="subitem3"><a href="error.jsp"><%=map.get("wash")%></a></li>
                                                                <li class="subitem1"><a href="error.jsp"><%=map.get("fan")%></a></li>
                                                                <li class="subitem1"><a href="error.jsp"><%=map.get("air")%></a></li>
                                                                <li class="subitem1"><a href="error.jsp"><%=map.get("hot_water")%></a></li>
                                                            </ul>
                                                        </li>
                                                        <li class="item4"><a href="error.jsp"><%=map.get("furni")%></a>
                                                            <ul class="cute">
                                                                <li class="subitem1"><a href="error.jsp"><%=map.get("bed")%></a></li>
                                                                <li class="subitem2"><a href="error.jsp"><%=map.get("living_room")%></a></li>
                                                                <li class="subitem3"><a href="error.jsp"><%=map.get("audi")%></a></li>
                                                                <li class="subitem1"><a href="error.jsp"><%=map.get("dining")%></a></li>
                                                                <li class="subitem1"><a href="error.jsp"><%=map.get("bath_room")%></a></li>
                                                                <li class="subitem1"><a href="error.jsp"><%=map.get("floor")%></a></li>
                                                            </ul>
                                                        </li>
                                                        <li class="item4"><a href="error.jsp"><%=map.get("beauty")%></a>
                                                            <ul class="cute">
                                                                <li class="subitem1"><a href="error.jsp"><%=map.get("func_medi")%></a></li>
                                                                <li class="subitem2"><a href="error.jsp"><%=map.get("comestic")%></a></li>
                                                                <li class="subitem3"><a href="error.jspl"><%=map.get("makeup")%></a></li>
                                                            </ul>
                                                        </li>
                                                        <li class="item4"><a href="error.jsp"><%=map.get("food")%></a>
                                                            <ul class="cute">
                                                                <li class="subitem1"><a href="error.jsp"><%=map.get("food_alive")%></a></li>
                                                                <li class="subitem2"><a href="error.jsp"><%=map.get("food_can")%></a></li>
                                                            </ul>
                                                        </li>
                                                        <li class="item4"><a href="error.jsp"><%=map.get("travel")%></a>
                                                            <ul class="cute">
                                                                <li class="subitem1"><a href="error.jsp"><%=map.get("suitcase")%></a></li>
                                                                <li class="subitem2"><a href="error.jsp"><%=map.get("backpack")%></a></li>
                                                                <li class="subitem3"><a href="error.jsp"><%=map.get("tent")%></a></li>
                                                            </ul>
                                                        </li>
                                                        <li class="item4"><a href="error.jsp"><%=map.get("sport")%></a>
                                                            <ul class="cute">
                                                                <li class="subitem1"><a href="error.jsp"><%=map.get("soccer")%></a></li>
                                                                <li class="subitem2"><a href="error.jsp"><%=map.get("tt")%></a></li>
                                                                <li class="subitem3"><a href="error.jsp"><%=map.get("badminton")%></a></li>
                                                                <li class="subitem3"><a href="error.jsp"><%=map.get("tenis")%></a></li>
                                                                <li class="subitem3"><a href="error.jsp"><%=map.get("danger")%></a></li>
                                                                <li class="subitem3"><a href="error.jsp"><%=map.get("swim")%></a></li>
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </div>
                                                <!--initiate accordion-->
                                                <script type="text/javascript">
                                                    $(function () {
                                                        var menu_ul = $('.menu > li > ul'),
                                                                menu_a = $('.menu > li > a');
                                                        menu_ul.hide();
                                                        menu_a.click(function (e) {
                                                            e.preventDefault();
                                                            if (!$(this).hasClass('active')) {
                                                                menu_a.removeClass('active');
                                                                menu_ul.filter(':visible').slideUp('normal');
                                                                $(this).addClass('active').next().stop(true, true).slideDown('normal');
                                                            } else {
                                                                $(this).removeClass('active');
                                                                $(this).next().stop(true, true).slideUp('normal');
                                                            }
                                                        });

                                                    });
                                                </script>
                                                <div class=" chain-grid menu-chain">
                                                    <a href="view.jsp?productId=<%=products.get(8).getProductId()%>"><img class="img-responsive chain" src="images/P009.jpg" alt=" " /></a>	   		     		
                                                    <div class="grid-chain-bottom chain-watch"><h6>
                                                            <a href="view.jsp?productId=<%=products.get(8).getProductId()%>">
                                                                <%=map.get(products.get(8).getProductName())%></a></h6>
                                                        <span class="actual dolor-left-grid">300.000.000<%=map.get("money")%></span>
                                                        <span class="reducedfrom">500.000.000<%=map.get("money")%></span>
                                                    </div>
                                                </div>
                                                <a class=" all-product" href="error.jsp"><%=map.get("view_all")%><span> </span></a> 	
                                            </div>
                                            <div class="clearfix"> </div>        	         
                                            </div>
                                            <div class="temp">

                                            </div>
                                            <div class="clearfix"> </div>
                                            <div class="footer-top">
                                                <div class="container">
                                                    <div class="foo-grids">
                                                        <div class="col-md-3 footer-grid">
                                                            <h4 class="footer-head"><%=map.get("intro")%></h4>
                                                            <%=map.get("intro_deep")%>
                                                        </div>
                                                        <div class="col-md-3 footer-grid">
                                                            <h4 class="footer-head"><%=map.get("help")%></h4>
                                                            <ul>
                                                                <li><a href="error.jsp"><%=map.get("sitemap")%></a></li>						
                                                                <li><a href="error.jsp"><%=map.get("footer.control")%></a></li>
                                                                <li><a href="error.jspl">FAQ</a></li>
                                                                <li><a href="error.jsp"><%=map.get("feed")%></a></li>
                                                                <li><a href="error.jsp"><%=map.get("contact")%></a></li>
                                                                <li><a href="error.jsp">Code</a></li>
                                                            </ul>
                                                        </div>
                                                        <div class="col-md-3 footer-grid">
                                                            <h4 class="footer-head"><%=map.get("info")%></h4>
                                                            <ul>
                                                                <li><a href="error.jsp"><%=map.get("locale")%></a></li>	
                                                                <li><a href="error.jsp"><%=map.get("terms")%></a></li>
                                                                <li><a href="error.jsp"><%=map.get("pop_search")%></a></li>	
                                                                <li><a href="error.jsp"><%=map.get("secure")%></a></li>	
                                                            </ul>
                                                        </div>
                                                        <div class="col-md-3 footer-grid">
                                                            <h4 class="footer-head"><%=map.get("contacts")%></h4>
                                                            <span class="hq"><%=map.get("headq")%></span>

                                                            <ul class="location">
                                                                <li><span class="glyphicon glyphicon-map-marker"></span></li>
                                                                <li><a href="error.jsp"><%=map.get("hrm")%></a></li>
                                                                <div class="clearfix"></div>
                                                            </ul>	
                                                            <ul class="location">
                                                                <li><span class="glyphicon glyphicon-earphone"></span></li>
                                                                <li><a href="error.jsp">+0 561 111 235</a></li>
                                                                <div class="clearfix"></div>
                                                            </ul>	
                                                            <ul class="location">
                                                                <li><span class="glyphicon glyphicon-envelope"></span></li>
                                                                <li><a href="error.jsp">ecommerce@hcmiu.edu.vn.com</a></li>
                                                                <div class="clearfix"></div>
                                                            </ul>						
                                                        </div>
                                                        <div class="clearfix"></div>
                                                    </div>						
                                                </div>	
                                            </div>	
                                            </body>
                                            </html>
                                            <%}%>   