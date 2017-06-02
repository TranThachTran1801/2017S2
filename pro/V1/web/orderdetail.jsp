<%-- 
    Document   : checkout
    Created on : Apr 27, 2017, 2:40:48 PM
    Author     : Dung Viet
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="bean.*"%>
<%@page import="java.util.ArrayList"%>
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
<html lang="en">
    <head>
        <title>N-Air a E-commerce category Flat Bootstrap Responsive Website Template | Products :: w3layouts</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="N-Air Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() {setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <meta charset utf="8">
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
           order order = (order)session.getAttribute("order");
           ArrayList<myproduct> list = order.getList();
          System.out.println(order.getTotalPrice());
        %>
     
        
        
        <!--header-->
        <div class="header">
            <div class="header-grid">
                <div class="container">
                    <div class="header-left animated wow fadeInLeft" data-wow-delay=".5s">
                        <ul>
                            <li><i class="glyphicon glyphicon-headphones"></i><a href="#">24x7 live support</a></li>
                            <li><i class="glyphicon glyphicon-envelope" ></i><a href="mailto:info@example.com">@example.com</a></li>
                            <li><i class="glyphicon glyphicon-earphone" ></i>+1234 567 892</li>

                        </ul>
                    </div>
                    <div class="header-right animated wow fadeInRight" data-wow-delay=".5s">
                        <div class="header-right1 ">
                            <ul>

                                <li><i class="glyphicon glyphicon-log-in" ></i><a href="login.html">Login</a></li>
                                <li><i class="glyphicon glyphicon-book" ></i><a href="register.html">Register</a></li>
                            </ul>
                        </div>
                        <div class="header-right2">

                            <div class="cart box_1">
                                <a href="controller?action=checkout">
                                    <h3>
                                        <div class="total">
                                            (<span id="simpleCart_quantity" class="simpleCart_quantity"></span>items)</div></h3>
                                </a>
                                <p><a href="javascript:;" class="simpleCart_empty">Empty Cart</a></p>
                                <div class="clearfix"> </div>
                            </div>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
            <div class="container">
                <div class="logo-nav">

                    <nav class="navbar navbar-default">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header nav_2">
                            <button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <div class="navbar-brand logo-nav-left ">
                                <h1 class="animated wow pulse" data-wow-delay=".5s"><a href="index.html">Classic<span>Style</span></a></h1>
                            </div>

                        </div> 
                        <div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href="index.html" class="act">Home</a></li>	
                                <!-- Mega Menu -->
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Women <b class="caret"></b></a>
                                    <ul class="dropdown-menu multi">
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <ul class="multi-column-dropdown">
                                                    <h6>Submenu1</h6>

                                                    <li><a href="products.html">Accessories</a></li>
                                                    <li><a href="products.html">Bags</a></li>
                                                    <li><a href="products.html">Caps & Hats</a></li>
                                                    <li><a href="products.html">Hoodies & Sweatshirts</a></li>

                                                </ul>
                                            </div>
                                            <div class="col-sm-4">
                                                <ul class="multi-column-dropdown">
                                                    <h6>Submenu2</h6>
                                                    <li><a href="products.html">Jackets & Coats</a></li>
                                                    <li><a href="products.html">Jeans</a></li>
                                                    <li><a href="products.html">Jewellery</a></li>
                                                    <li><a href="products.html">Jumpers & Cardigans</a></li>
                                                    <li><a href="products.html">Leather Jackets</a></li>
                                                    <li><a href="products.html">Long Sleeve T-Shirts</a></li>

                                                </ul>
                                            </div>
                                            <div class="col-sm-4">
                                                <ul class="multi-column-dropdown">
                                                    <h6>Submenu3</h6>
                                                    <li><a href="products.html">Shirts</a></li>
                                                    <li><a href="products.html">Shoes, Boots & Trainers</a></li>
                                                    <li><a href="products.html">Sunglasses</a></li>
                                                    <li><a href="products.html">Sweatpants</a></li>
                                                    <li><a href="products.html">Swimwear</a></li>
                                                    <li><a href="products.html">Trousers & Chinos</a></li>

                                                </ul>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="row-top">
                                            <div class="col-sm-6 row1">
                                                <a href="products.html"><img src="images/me.jpg" alt="" class="img-responsive"></a>
                                            </div>
                                            <div class=" col-sm-6 row2">
                                                <a href="products.html"><img src="images/me1.jpg" alt="" class="img-responsive"></a>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Men <b class="caret"></b></a>
                                    <ul class="dropdown-menu multi multi1">
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <ul class="multi-column-dropdown">
                                                    <h6>Submenu1</h6>

                                                    <li><a href="products1.html">Accessories</a></li>
                                                    <li><a href="products1.html">Bags</a></li>
                                                    <li><a href="products1.html">Caps & Hats</a></li>
                                                    <li><a href="products1.html">Hoodies & Sweatshirts</a></li>

                                                </ul>
                                            </div>
                                            <div class="col-sm-4">
                                                <ul class="multi-column-dropdown">
                                                    <h6>Submenu2</h6>
                                                    <li><a href="products1.html">Jackets & Coats</a></li>
                                                    <li><a href="products1.html">Jeans</a></li>
                                                    <li><a href="products1.html">Jewellery</a></li>
                                                    <li><a href="products1.html">Jumpers & Cardigans</a></li>
                                                    <li><a href="products1.html">Leather Jackets</a></li>
                                                    <li><a href="products1.html">Long Sleeve T-Shirts</a></li>

                                                </ul>
                                            </div>
                                            <div class="col-sm-4">
                                                <ul class="multi-column-dropdown">
                                                    <h6>Submenu3</h6>
                                                    <li><a href="products1.html">Shirts</a></li>
                                                    <li><a href="products1.html">Shoes, Boots & Trainers</a></li>
                                                    <li><a href="products1.html">Sunglasses</a></li>
                                                    <li><a href="products1.html">Sweatpants</a></li>
                                                    <li><a href="products1.html">Swimwear</a></li>
                                                    <li><a href="products1.html">Trousers & Chinos</a></li>

                                                </ul>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="row-top">
                                            <div class="col-sm-6 row1">
                                                <a href="products1.html"><img src="images/me2.jpg" alt="" class="img-responsive"></a>
                                            </div>
                                            <div class=" col-sm-6 row2">
                                                <a href="products1.html"><img src="images/me3.jpg" alt="" class="img-responsive"></a>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                    </ul>
                                </li>

                                <li><a href="codes.html"> Codes</a></li>
                                <li><a href="contact.html">Contact Us</a></li>
                            </ul>
                        </div>
                    </nav>
                </div>

            </div>
        </div> 
        
        

                            
           
       
        <!-- check-out -->
        <div class="check">
            <div class="container">	 
                <div class="col-md-3 cart-total">
                    <a class="continue" href="#">Continue to basket</a>
                    <div class="price-details">
                        <h3>Price Details</h3>
                        <span>Total</span>
                        <span class="total1"><%=order.getTotalPrice()%></span>
                        <span>Discount</span>
                        <span class="total1">10%(Festival Offer)</span>
                        <span>Delivery Charges</span>
                        <span class="total1">150.00</span>
                        <div class="clearfix"></div>				 
                    </div>
                    <hr class="featurette-divider">
                    <ul class="total_price">
                        <li class="last_price"> <h4>TOTAL</h4></li>	
                        <li class="last_price"><span><%=order.getTotalPrice()%></span></li>
                        <div class="clearfix"> </div>
                    </ul> 
                    <div class="clearfix"></div>
                   
                </div>
                <div class="col-md-9 cart-items">
                    <h1>My Shopping Bag (<%=list.size()%>)</h1>
                    
                        
                    <%
                        
                        for (int i = 0; i < list.size(); ++i) {
                            myproduct temp = list.get(i);
                            String sql = "select url from badao.product_has_picture where ID_product = '" + temp.getID_product() + "'";
                            System.out.println(sql);
                            ResultSet rs = db.getResult(sql, con);

                            String[] url = new String[5];
                            int j = 0;
                            while (rs.next()) {
                                url[j] = rs.getString("url");
                                ++j;
                            }

                    %>
                    <div class="cart-header2">
                        <div class="close2">
                            
                        </div>
                        <div class="cart-sec simpleCart_shelfItem">
                            <div class="cart-item cyc">
                                <img src="<%=url[0]%>" class="img-responsive" alt=""/>
                            </div>
                            <div class="cart-item-info">
                                <ul class="qty">
                                    <li><p>Size : 8 US</p></li>
                                    <li><p><%=temp.getQuantity()%></p></li>
                                    <li><p>Price each : $<%=temp.getPrice()%></p></li>
                                </ul>
                                <div class="delivery">
                                    <p>Service Charges : Rs.<%=temp.getPrice()*temp.getQuantity()%></p>
                                    <span>Delivered in 2-3 bussiness days</span>
                                    <div class="clearfix"></div>
                                </div>	
                            </div>
                            <div class="clearfix"></div>					
                        </div>
                    </div>
                    <%}%>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
        <div class="footer-grid">
            <div class="container">
                <div class="col-md-2 re-ft-grd">
                    <h3>Categories</h3>
                    <ul class="categories">
                        <li><a href="#">Men</a></li>
                        <li><a href="#">Women</a></li>
                        <li><a href="#">Kids</a></li>
                        <li><a href="#">Formal</a></li>
                        <li><a href="#">Casuals</a></li>
                        <li><a href="#">Sports</a></li>
                    </ul>
                </div>
                <div class="col-md-2 re-ft-grd">
                    <h3>Short links</h3>
                    <ul class="shot-links">
                        <li><a href="#">Contact us</a></li>
                        <li><a href="#">Support</a></li>
                        <li><a href="#">Delivery</a></li>
                        <li><a href="#">Return Policy</a></li>
                        <li><a href="#">Terms & conditions</a></li>
                        <li><a href="contact.html">Sitemap</a></li>
                    </ul>
                </div>
                <div class="col-md-6 re-ft-grd">
                    <h3>Social</h3>
                    <ul class="social">
                        <li><a href="#" class="fb">facebook</a></li>
                        <li><a href="#" class="twt">twitter</a></li>
                        <li><a href="#" class="gpls">g+ plus</a></li>
                        <div class="clearfix"></div>
                    </ul>
                </div>
                <div class="col-md-2 re-ft-grd">
                    <div class="bt-logo">
                        <div class="logo">
                            <a href="index.html" class="ft-log">N-AIR</a>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="copy-rt">
                <div class="container">
                    <p>&copy;   2015 N-AIR All Rights Reserved. Design by <a href="http://www.w3layouts.com">w3layouts</a></p>
                </div>
            </div>
        </div>
    </body>
</html>
