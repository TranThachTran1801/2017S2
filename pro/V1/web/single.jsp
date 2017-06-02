<%-- 
    Document   : single
    Created on : Apr 27, 2017, 2:34:59 PM
    Author     : Dung Viet
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.UserRole"%>
<%@page import="model.UserRole"%>
<%@page import="dao.DAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="repository.ProductRepositoty"%>
<%@page import="model.Product"%>
<%@page import="model.UserSessionHolder"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="util.Settings"%>
<%@page import="util.Settings"%>
<%@page import="bean.myproduct"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="bean.shose"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.DatabaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<%
    Map<String, String> map = (HashMap<String, String>) Settings.getSessionAttribute(request, "languageCode");
    UserSessionHolder ush = Settings.getCurrentUserSession(request);

    List<Product> products = ProductRepositoty.getAllProduct();
    String productId = request.getParameter("productId");
    Product currentProduct = ProductRepositoty.getProductById(productId);
    List<Product> cartProduct = Settings.getCart(request).getProducts();
    String cartSettings = "href=\"login.jsp\"";

    if (map == null) {
        request.getRequestDispatcher("language?lang=vi").forward(request, response);
    } else {
%>
<html lang="en">
    <head>
        <title>N-Air a E-commerce category Flat Bootstrap Responsive Website Template | Products :: w3layouts</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="N-Air Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() {setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <meta charset utf="8">
        <link rel="stylesheet" href="css/stylesheet.css">
        <!--fonts-->
        <link href='//fonts.googleapis.com/css?family=Fredoka+One' rel='stylesheet' type='text/css'>

        <!--fonts-->
        <!--form-css-->
        <link href="css/form_1.css" rel="stylesheet" type="text/css" media="all" />
        <!--bootstrap-->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <!--coustom css-->
        <link href="css/style_1.css" rel="stylesheet" type="text/css"/>
        <!--shop-kart-js-->
        <script src="js/simpleCart.min.js"></script>
        <!--default-js-->
        <script src="js/jquery-2.1.4.min.js"></script>
        <script src="js/base-ajax.js"></script>
        <!--bootstrap-js-->
        <script src="js/bootstrap.min.js"></script>
        <!--script-->
        <!-- FlexSlider -->
        <script src="js/imagezoom.js"></script>
        <script defer src="js/jquery.flexslider.js"></script>
        <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />

        <script>
            // Can also be used with $(document).ready()
            $(window).load(function () {
                $('.flexslider').flexslider({
                    animation: "slide",
                    controlNav: "thumbnails"
                });
            });
        </script>
        <!-- //FlexSlider-->
        <script type="text/javascript" src="js/my-script.js"></script>
        <script src="js/base-ajax.js"></script>
        <link href='//fonts.googleapis.com/css?family=Cabin:400,500,600,700' rel='stylesheet' type='text/css'>
        <link href='//fonts.googleapis.com/css?family=Lato:400,100,300,700,900' rel='stylesheet' type='text/css'>
        <script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
        <!-- //for bootstrap working -->
        <!-- animation-effect -->
        <link href="css/animate.min.css" rel="stylesheet"> 
        <script src="js/wow.min.js"></script>
        <script>
            new WOW().init();
        </script>
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
            function hideURLbar(){ window.scrollTo(0,1); } </script>
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>


        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
        <!-- //FlexSlider-->
    </head>
    <body>
        <% DatabaseConnection db = new DatabaseConnection();
            Connection con = db.setConnection();%>
        <%
            myproduct temp = (myproduct) session.getAttribute("productdetail");
            int check = 3;

        %>
        <%            ArrayList<String> name = new ArrayList<String>();

            con = db.setConnection();

            String sql1 = "Select name from badao.myproduct";
            ResultSet rs1 = db.getResult(sql1, con);

            while (rs1.next()) {
                name.add(rs1.getString("name"));
            }


        %>


        <!--header-->
        <div class="header">
            <div class="header-grid">
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
                <div class="bottom-header">
                    <div class="container">
                        <div class="col-sm-5  header-bottom-left  ">
                            <div class="logo">
                                <a href="index.jsp">E-<span>COMMERCE</span></a>
                            </div>
                            <div class="search">
                                <form method="GET" id="form-search" action="controller">
                                    <div>
                                        <input type="text" id="autocomplete" name="keyword" placeholder=""/>
                                        <input type="hidden" name="action" value="search"/>
                                        <input type="submit" id="searchsubmit" value="search " name="Search"/>
                                    </div>
                                </form>
                                <script>
                                    $('#autocomplete').autocomplete({
                                        source: [
                                    <%
                                        for (int j = 0; j < name.size(); ++j) {
                                    %>
                                            "<%=name.get(j)%>",
                                    <% } %>
                                        ]

                                    });
                                </script>
                            </div>

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

                            <div class="cart"><a href="controller?action=checkout"><span> </span><%=map.get("cart")%></a></div>
                            <div class="clearfix"> </div>
                        </div>

                        <div class="clearfix"> </div>	
                    </div>
                </div>
                <div class="clearfix"> </div>	

            </div>

        </div> 





        <div class="showcase-grid">
            <div class="container">
                <div class="col-md-8 showcase">
                    <div class="flexslider">
                        <ul class="slides">
                            <%
                                String sql = "select url from badao.product_has_picture where ID_product = '" + temp.getID_product() + "'";
                                ResultSet rs = db.getResult(sql, con);

                                String[] url = new String[5];
                                int j = 0;
                                while (rs.next()) {
                                    url[j] = rs.getString("url");
                                    ++j;
                                }
                                for (int i = 0; i < j; ++i) {
                            %>
                            <li data-thumb="<%=url[i]%>">
                                <div class="thumb-image"> <img src="<%=url[i]%>" data-imagezoom="true" class="img-responsive"> </div>
                            </li>
                            <%}%>

                        </ul>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="col-md-4 showcase">
                    <div class="showcase-rt-top">
                        <div class="pull-left shoe-name">
                            <h3><%=temp.getName()%></h3>
                            <p>Men's running shoes</p>
                            <h4>&#36;<%=temp.getPrice()%></h4>
                            <p>
                                <% if (session.getAttribute("login") != null) {
                                        String accid = (String) session.getAttribute("login");
                                        System.out.println("accid " + accid);
                                        DAO dao = new DAO();
                                        int start = dao.getratingStart(temp.getID_product(), accid);
                                        System.out.println("start " + start);
                                        if (start == 1) {
                                %>
                                Rating:
                                <span class="starRating">
                                    <input id="rating5" type="radio" name="rating" value="5"   onclick="rating(5,<%=temp.getID_product()%>)">
                                    <label for="rating5">5</label>
                                    <input id="rating4" type="radio" name="rating" value="4" onclick="rating(4,<%=temp.getID_product()%>)">
                                    <label for="rating4">4</label>
                                    <input id="rating3" type="radio" name="rating" value="3"  onclick="rating(3,<%=temp.getID_product()%>)">
                                    <label for="rating3">3</label>
                                    <input id="rating2" type="radio" name="rating" value="2" onclick="rating(2,<%=temp.getID_product()%>)">
                                    <label for="rating2">2</label>
                                    <input id="rating1" type="radio" name="rating" value="1" checked onclick="rating(1,<%=temp.getID_product()%>)">
                                    <label for="rating1">1</label>
                                </span>
                            <div  style="color:red; margin-top: 20px" id="rating-msg"></div> 
                            <% }
                                if (start == 2) {%>
                            Rating:
                            <span class="starRating">
                                <input id="rating5" type="radio" name="rating" value="5"   onclick="rating(5,<%=temp.getID_product()%>)">
                                <label for="rating5">5</label>
                                <input id="rating4" type="radio" name="rating" value="4" onclick="rating(4,<%=temp.getID_product()%>)">
                                <label for="rating4">4</label>
                                <input id="rating3" type="radio" name="rating" value="3"  onclick="rating(3,<%=temp.getID_product()%>)">
                                <label for="rating3">3</label>
                                <input id="rating2" type="radio" name="rating" value="2" checked onclick="rating(2,<%=temp.getID_product()%>)">
                                <label for="rating2">2</label>
                                <input id="rating1" type="radio" name="rating" value="1" onclick="rating(1,<%=temp.getID_product()%>)">
                                <label for="rating1">1</label>
                            </span>
                            <div  style="color:red; margin-top: 20px" id="rating-msg"></div> 
                            <% }
                                if (start == 3) {%>
                            Rating:
                            <span class="starRating">
                                <input id="rating5" type="radio" name="rating" value="5"  checked onclick="rating(5,<%=temp.getID_product()%>)">
                                <label for="rating5">5</label>
                                <input id="rating4" type="radio" name="rating" value="4" onclick="rating(4,<%=temp.getID_product()%>)">
                                <label for="rating4">4</label>
                                <input id="rating3" type="radio" name="rating" value="3" checked onclick="rating(3,<%=temp.getID_product()%>)">
                                <label for="rating3">3</label>
                                <input id="rating2" type="radio" name="rating" value="2" onclick="rating(2,<%=temp.getID_product()%>)">
                                <label for="rating2">2</label>
                                <input id="rating1" type="radio" name="rating" value="1" onclick="rating(1,<%=temp.getID_product()%>)">
                                <label for="rating1">1</label>
                            </span>
                            <div  style="color:red; margin-top: 20px" id="rating-msg"></div> 
                            <% }
                                if (start == 4) {%>
                            Rating:
                            <span class="starRating">
                                <input id="rating5" type="radio" name="rating" value="5"   onclick="rating(5,<%=temp.getID_product()%>)">
                                <label for="rating5">5</label>
                                <input id="rating4" type="radio" name="rating" value="4" checked onclick="rating(4,<%=temp.getID_product()%>)">
                                <label for="rating4">4</label>
                                <input id="rating3" type="radio" name="rating" value="3"  onclick="rating(3,<%=temp.getID_product()%>)">
                                <label for="rating3">3</label>
                                <input id="rating2" type="radio" name="rating" value="2" onclick="rating(2,<%=temp.getID_product()%>)">
                                <label for="rating2">2</label>
                                <input id="rating1" type="radio" name="rating" value="1" onclick="rating(1,<%=temp.getID_product()%>)">
                                <label for="rating1">1</label>
                            </span>
                            <div  style="color:red; margin-top: 20px" id="rating-msg"></div> 
                            <% }
                                if (start == 5) {%>
                            Rating:
                            <span class="starRating">
                                <input id="rating5" type="radio" name="rating" value="5"  checked onclick="rating(5,<%=temp.getID_product()%>)">
                                <label for="rating5">5</label>
                                <input id="rating4" type="radio" name="rating" value="4" onclick="rating(4,<%=temp.getID_product()%>)">
                                <label for="rating4">4</label>
                                <input id="rating3" type="radio" name="rating" value="3"  onclick="rating(3,<%=temp.getID_product()%>)">
                                <label for="rating3">3</label>
                                <input id="rating2" type="radio" name="rating" value="2" onclick="rating(2,<%=temp.getID_product()%>)">
                                <label for="rating2">2</label>
                                <input id="rating1" type="radio" name="rating" value="1" onclick="rating(1,<%=temp.getID_product()%>)">
                                <label for="rating1">1</label>
                            </span>
                            <div  style="color:red; margin-top: 20px" id="rating-msg"></div> 
                            <% } %>
                            <% } else {%>
                            Rating:
                            <span class="starRating">
                                <input id="rating5" type="radio" name="rating" value="5" onclick="rating(5,<%=temp.getID_product()%>)">
                                <label for="rating5">5</label>
                                <input id="rating4" type="radio" name="rating" value="4" onclick="rating(4,<%=temp.getID_product()%>)">
                                <label for="rating4">4</label>
                                <input id="rating3" type="radio" name="rating" value="3" checked onclick="rating(3,<%=temp.getID_product()%>)">
                                <label for="rating3">3</label>
                                <input id="rating2" type="radio" name="rating" value="2" onclick="rating(2,<%=temp.getID_product()%>)">
                                <label for="rating2">2</label>
                                <input id="rating1" type="radio" name="rating" value="1" onclick="rating(1,<%=temp.getID_product()%>)">
                                <label for="rating1">1</label>
                            </span>
                            <div  style="color:red; margin-top: 20px" id="rating-msg"></div> 
                            <% } %>
                            </p>
                        </div>

                        <div class="clearfix"></div>
                    </div>
                    <hr class="featurette-divider">
                    <form name="myform" method="post">
                        <div class="shocase-rt-bot">
                            <div class="float-qty-chart">
                                <ul>
                                    <li class="qty">
                                        <h3>Size Chart</h3>
                                        <select class="form-control siz-chrt">
                                            <option>6 US</option>
                                            <option>7 US</option>
                                            <option>8 US</option>
                                            <option>9 US</option>
                                            <option>10 US</option>
                                            <option>11 US</option>
                                        </select>
                                    </li>
                                    <li class="qty">
                                        <h3>QTY</h3>
                                        <select class="form-control qnty-chrt" id ="quantity">
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                            <option>6</option>
                                            <option>7</option>
                                        </select>
                                    </li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>


                            <% if (session.getAttribute("login") != null) { %> 
                            <!--<input type="submit" name="action" value="Add to Cart"> -->
                            <input type="button" value="add to cart" onclick="addToCart()">

                            <a class="btn" role="button" onclick="addToCart()">Buy Now</a>
                            <div  style="color:red; margin-top: 20px" id="cart-msg"></div> 
                            <% } else { %>
                            <div> login to buy </div>
                            <% }%>



                        </div>
                    </form>
                    <div class="showcase-last">
                        <h3>product details</h3>
                        <ul>
                            <li>Internal bootie wraps your foot for a sock-like fit</li>
                            <li>Unique eyestays work with the Flywire cables to create an even better glove-like fit</li>
                            <li>Waffle outsole for durability and multi-surface traction</li>
                            <li>Sculpted Cushlon midsole combines plush cushioning and springy resilience for impact protection</li>
                            <li>Midsole flex grooves for greater forefoot flexibility</li>
                        </ul>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>

        <div class="specifications">
            <div class="container">
                <h3>Item Details</h3> 
                <div class="detai-tabs">
                    <!-- Nav tabs -->
                    <ul class="nav nav-pills tab-nike" role="tablist">
                        <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Highlights</a></li>
                        <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Description</a></li>
                        <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Terms & conditional</a></li>
                        <li role="presentation"><a href="#comment" aria-controls="comment" role="tab" data-toggle="tab">Comment</a></li>
                    </ul>

                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="home">
                            <p>The full-length Max Air unit delivers excellent cushioning with enhanced flexibility for smoother transitions through footstrike.</p> 
                            <p>Dynamic Flywire cables integrate with the laces and wrap your midfoot for a truly adaptive, supportive fit.</p>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="profile">
                            <p>Nike is one of the leading manufacturer and supplier of sports equipment, footwear and apparels. Nike is a global brand and it continuously creates products using high technology and design innovation. Nike has a vast collection of sports shoes for men at Snapdeal. You can explore our range of basketball shoes, football shoes, cricket shoes, tennis shoes, running shoes, daily shoes or lifestyle shoes. Take your pick from an array of sports shoes in vibrant colours like red, yellow, green, blue, brown, black, grey, olive, pink, beige and white. Designed for top performance, these shoes match the way you play or run. Available in materials like leather, canvas, suede leather, faux leather, mesh etc, these shoes are lightweight, comfortable, sturdy and extremely sporty. The sole of all Nike shoes is designed to provide an increased amount of comfort and the material is good enough to provide an improved fit. These shoes are easy to maintain and last for a really long time given to their durability. Buy Nike shoes for men online with us at some unbelievable discounts and great prices. So get faster and run farther with your Nike shoes and track how hard you can play.</p>    
                        </div>
                        <div role="tabpanel" class="tab-pane" id="messages">
                            The images represent actual product though color of the image and product may slightly differ.    
                        </div>
                        <div role="tabpanel" class="tab-pane" id="comment">
                            <%
                                String sql2 = "SELECT * FROM badao.comment, badao.account where account.accid = comment.accid and ID_product ='" + temp.getID_product() + "'";
                                ResultSet rs2 = db.getResult(sql2, con);
                                boolean empty = true;
                                while (rs2.next()) {%>

                            <%=rs2.getString("accname")%>: <textarea name="comment" id="comment"><%=rs2.getString("comment")%></textarea><br />
                            <% }%>
                            <form name="myform1" method="post">

                                <textarea name="comment" id="comment"></textarea><br />
                                <input type="button" value="add to cart" onclick="addToCart()">
                                <input type="button" value="comment" onclick="comment1(<%=temp.getID_product()%>)">

                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="you-might-like">
            <div class="container">
                <h3 class="you-might">Products You May Like</h3>
                <div class="col-md-4 grid-stn simpleCart_shelfItem">
                    <!-- normal -->
                    <div class="ih-item square effect3 bottom_to_top">
                        <div class="bottom-2-top">
                            <div class="img"><img src="images/grid4.jpg" alt="/" class="img-responsive gri-wid"></div>
                            <div class="info">
                                <div class="pull-left styl-hdn">
                                    <h3>style 01</h3>
                                </div>
                                <div class="pull-right styl-price">
                                    <p><a  href="#" class="item_add"><span class="glyphicon glyphicon-shopping-cart grid-cart" aria-hidden="true"></span> <span class=" item_price">$190</span></a></p>
                                </div>
                                <div class="clearfix"></div>
                            </div></div>
                    </div>
                    <!-- end normal -->
                    <div class="quick-view">
                        <a href="single.html">Quick view</a>
                    </div>
                </div>
                <div class="col-md-4 grid-stn simpleCart_shelfItem">
                    <!-- normal -->
                    <div class="ih-item square effect3 bottom_to_top">
                        <div class="bottom-2-top">
                            <div class="img"><img src="images/grid6.jpg" alt="/" class="img-responsive gri-wid"></div>
                            <div class="info">
                                <div class="pull-left styl-hdn">
                                    <h3>style 01</h3>
                                </div>
                                <div class="pull-right styl-price">
                                    <p><a  href="#" class="item_add"><span class="glyphicon glyphicon-shopping-cart grid-cart" aria-hidden="true"></span> <span class=" item_price">$190</span></a></p>
                                </div>
                                <div class="clearfix"></div>
                            </div></div>
                    </div>
                    <!-- end normal -->
                    <div class="quick-view">
                        <a href="single.html">Quick view</a>
                    </div>
                </div>
                <div class="col-md-4 grid-stn simpleCart_shelfItem">
                    <!-- normal -->
                    <div class="ih-item square effect3 bottom_to_top">
                        <div class="bottom-2-top">
                            <div class="img"><img src="images/grid3.jpg" alt="/" class="img-responsive gri-wid"></div>
                            <div class="info">
                                <div class="pull-left styl-hdn">
                                    <h3>style 01</h3>
                                </div>
                                <div class="pull-right styl-price">
                                    <p><a  href="#" class="item_add"><span class="glyphicon glyphicon-shopping-cart grid-cart" aria-hidden="true"></span> <span class=" item_price">$190</span></a></p>
                                </div>
                                <div class="clearfix"></div>
                            </div></div>
                    </div>
                    <!-- end normal -->
                    <div class="quick-view">
                        <a href="single.html">Quick view</a>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
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