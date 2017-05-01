<%-- 
    Document   : single
    Created on : Apr 27, 2017, 2:34:59 PM
    Author     : Dung Viet
--%>

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
<html lang="en">
    <head>
        <title>N-Air a E-commerce category Flat Bootstrap Responsive Website Template | Single :: w3layouts</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="N-Air Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() {setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <meta charset utf="8">
        <!--fonts-->
        <link href='//fonts.googleapis.com/css?family=Fredoka+One' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" type="text/css" href="css/newcss.css">
        <!--fonts-->
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
    </head>
    <body>
        <% DatabaseConnection db = new DatabaseConnection();
            Connection con = db.setConnection();%>
        <%
            shose temp = (shose) session.getAttribute("shosedetail");
        %>
        <div class="header">
            <div class="container">
                <div class="header-top">
                    <div class="logo">
                        <a href="index.html">N-AIR</a>
                    </div>
                    <div class="login-bars">
                        <a class="btn btn-default log-bar" href="register.html" role="button">Sign up</a>
                        <a class="btn btn-default log-bar" href="signup.html" role="button">Login</a>
                        <div class="cart box_1">
                            <a href="controller?action=checkout">
                                <h3>
                                    <div class="total">
                                        <span class="simpleCart_total"></span>(<span id="simpleCart_quantity" class="simpleCart_quantity"></span>)</div></h3>
                            </a>
                            <p><a href="javascript:;" class="simpleCart_empty">Empty Cart</a></p>
                            <div class="clearfix"> </div>
                        </div>	
                    </div>
                    <div class="clearfix"></div>
                </div>
                <!---menu-----bar--->
                <div class="header-botom">
                    <div class="content white">
                        <nav class="navbar navbar-default nav-menu" role="navigation">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                            </div>
                            <!--/.navbar-header-->

                            <div class="collapse navbar-collapse collapse-pdng" id="bs-example-navbar-collapse-1">
                                <ul class="nav navbar-nav nav-font">
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Shop<b class="caret"></b></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="products.html">Shoes</a></li>
                                            <li><a href="products.html">Tees</a></li>
                                            <li><a href="products.html">Tops</a></li>
                                            <li class="divider"></li>
                                            <li><a href="products.html">Tracks</a></li>
                                            <li class="divider"></li>
                                            <li><a href="products.html">Gear</a></li>
                                        </ul>
                                    </li>
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Men<b class="caret"></b></a>
                                        <ul class="dropdown-menu multi-column columns-3">
                                            <div class="row">
                                                <div class="col-sm-4 menu-img-pad">
                                                    <ul class="multi-column-dropdown">
                                                        <li><a href="products.html">Joggers</a></li>
                                                        <li><a href="products.html">Foot Ball</a></li>
                                                        <li><a href="products.html">Cricket</a></li>
                                                        <li class="divider"></li>
                                                        <li><a href="products.html">Tennis</a></li>
                                                        <li class="divider"></li>
                                                        <li><a href="products.html">Casual</a></li>
                                                    </ul>
                                                </div>
                                                <div class="col-sm-4 menu-img-pad">
                                                    <a href="#"><img src="images/menu1.jpg" alt="/" class="img-rsponsive men-img-wid" /></a>
                                                </div>
                                                <div class="col-sm-4 menu-img-pad">
                                                    <a href="#"><img src="images/menu2.jpg" alt="/" class="img-rsponsive men-img-wid" /></a>
                                                </div>
                                            </div>
                                        </ul>
                                    </li>
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Women<b class="caret"></b></a>
                                        <ul class="dropdown-menu multi-column columns-2">
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <ul class="multi-column-dropdown">
                                                        <li><a href="products.html">Tops</a></li>
                                                        <li><a href="products.html">Bottoms</a></li>
                                                        <li><a href="products.html">Yoga Pants</a></li>
                                                        <li class="divider"></li>
                                                        <li><a href="products.html">Sports</a></li>
                                                        <li class="divider"></li>
                                                        <li><a href="products.html">Gym</a></li>
                                                    </ul>
                                                </div>
                                                <div class="col-sm-6">
                                                    <a href="#"><img src="images/menu3.jpg" alt="/" class="img-rsponsive men-img-wid" /></a>
                                                </div>
                                            </div>
                                        </ul>
                                    </li>
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">kids<b class="caret"></b></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="products.html">Tees</a></li>
                                            <li><a href="products.html">Shorts</a></li>
                                            <li><a href="products.html">Gear</a></li>
                                            <li class="divider"></li>
                                            <li><a href="products.html">Watches</a></li>
                                            <li class="divider"></li>
                                            <li><a href="products.html">Shoes</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="contact.html">Catch</a></li>
                                    <div class="clearfix"></div>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <!--/.navbar-collapse-->
                            <div class="clearfix"></div>
                        </nav>
                        <!--/.navbar-->   
                        <div class="clearfix"></div>
                    </div>
                    <!--/.content--->
                </div>
                <!--header-bottom-->
            </div>
        </div>
        <div class="head-bread">
            <div class="container">
                <ol class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Men</a></li>
                    <li class="active">Shop</li>
                </ol>
            </div>
        </div>
        <div class="showcase-grid">
            <div class="container">
                <div class="col-md-8 showcase">
                    <div class="flexslider">
                        <ul class="slides">
                            <%    String sql = "select url from ecmrproj.shose_has_picture where ID_shose = '" + temp.getID_shose() + "'";
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
                            <fieldset class="rating">
                                <input type="radio" id="star5" name="rating" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>
                                <input type="radio" id="star4half" name="rating" value="4 and a half" /><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
                                <input type="radio" id="star4" name="rating" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
                                <input type="radio" id="star3half" name="rating" value="3 and a half" /><label class="half" for="star3half" title="Meh - 3.5 stars"></label>
                                <input type="radio" id="star3" name="rating" value="3" /><label class = "full" for="star3" title="Meh - 3 stars"></label>
                                <input type="radio" id="star2half" name="rating" value="2 and a half" /><label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
                                <input type="radio" id="star2" name="rating" value="2" /><label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
                                <input type="radio" id="star1half" name="rating" value="1 and a half" /><label class="half" for="star1half" title="Meh - 1.5 stars"></label>
                                <input type="radio" id="star1" name="rating" value="1" /><label class = "full" for="star1" title="Sucks big time - 1 star"></label>
                                <input type="radio" id="starhalf" name="rating" value="half" /><label class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
                            </fieldset>
                        </div>
                        <div class="pull-left rating-stars">
                            <ul>
                                <li><a href="#" class="active"><span class="glyphicon glyphicon-star star-stn" aria-hidden="true"></span></a></li>
                                <li><a href="#" class="active"><span class="glyphicon glyphicon-star star-stn" aria-hidden="true"></span></a></li>
                                <li><a href="#" class="active"><span class="glyphicon glyphicon-star star-stn" aria-hidden="true"></span></a></li>
                                <li><a href="#"><span class="glyphicon glyphicon-star star-stn" aria-hidden="true"></span></a></li>
                                <li><a href="#"><span class="glyphicon glyphicon-star star-stn" aria-hidden="true"></span></a></li>
                            </ul>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <hr class="featurette-divider">
                    <form action="controller" method ="post">
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
                                        <h4>QTY</h4>
                                        <select class="form-control qnty-chrt" name ="quantity">
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
                            <ul>
                                <li class="ad-2-crt simpleCart_shelfItem">
                                    <input type="submit" name="action" value="Add to Cart">
                                    <a class="btn" href="#" role="button">Buy Now</a>
                                </li>
                            </ul>
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
                        <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Terms & conditiona</a></li>
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
