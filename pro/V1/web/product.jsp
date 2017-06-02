<%-- 
    Document   : product
    Created on : Apr 27, 2017, 2:39:53 PM
    Author     : Dung Viet
--%>

<%@page import="model.UserRole"%>
<%@page import="model.UserRole"%>
<%@page import="repository.ProductRepositoty"%>
<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page import="model.UserSessionHolder"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Map"%>
<%@page import="util.Settings"%>
<%@page import="bean.myproduct"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
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
    String cartSettings = "href=\"login.jsp\"";

    if (map == null) {
        request.getRequestDispatcher("language?lang=vi").forward(request, response);
    } else {
%>
<html lang="en">
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
        <script src="js/jquery-ui.js"></script>
        <!--fonts-->
        <!--form-css-->
        <link href="css/form_1.css" rel="stylesheet" type="text/css" media="all" />
        <!--bootstrap-->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <!--coustom css-->
        <link href="css/style_1.css" rel="stylesheet" type="text/css"/>
        <!--shop-kart-js-->

        <!--default-js-->

        <!--bootstrap-js-->

        <!--script-->
        <!-- FlexSlider -->




    </head>
    <body>
        <% DatabaseConnection db = new DatabaseConnection();
            Connection con = db.setConnection();%>
        <%
            ArrayList<myproduct> list = (ArrayList<myproduct>) session.getAttribute("product");
        %>
        <%
            ArrayList<String> name = new ArrayList<String>();

            con = db.setConnection();

            String sql = "Select name from badao.myproduct";
            ResultSet rs = db.getResult(sql, con);
            int i = 0;
            while (rs.next()) {
                name.add(rs.getString("name"));
            }

            System.out.println(i);

        %>
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
                    </div>
                    <div class="container" style="margin-left: 700px;">
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
        <!--endheader-->



        <div class="products-gallery">
            <div class="container">
                <div class="col-md-9 grid-gallery">

                    <%
                        System.out.println("L " + list.size());
                        for (int l = 0; l < list.size(); ++l) {

                            myproduct temp = list.get(l);
                            String sql1 = "select * from badao.product_has_picture where ID_product = '" + temp.getID_product() + "'";
                            System.out.println(sql1);
                            ResultSet rs1 = db.getResult(sql1, con);

                            String[] url = new String[5];
                            int j = 0;
                            while (rs1.next()) {
                                url[j] = rs1.getString("url");
                                ++j;
                            }

                    %>
                    <div class="col-md-4 grid-stn simpleCart_shelfItem">
                        <!-- normal -->
                        <div class="ih-item square effect3 bottom_to_top">
                            <div class="bottom-2-top">
                                <div class="img"><img src="<%=url[0]%>" alt="/" class="img-responsive gri-wid"></div>
                                <div class="info">
                                    <div class="pull-left styl-hdn">
                                        <h3><%=temp.getName()%></h3>
                                    </div>
                                    <div class="pull-right styl-price">
                                        <p><a  href="#" class="item_add"><span class="glyphicon glyphicon-shopping-cart grid-cart" aria-hidden="true"></span> <span class=" item_price"><%=temp.getPrice()%></span></a></p>
                                    </div>
                                    <div class="clearfix"></div>
                                </div></div>
                        </div>
                        <!-- end normal -->
                        <div class="quick-view">
                            <a href="controller?action=productDetail&id=<%=temp.getID_product()%>">Quick view</a>
                        </div>
                    </div>

                    <%}%>

                </div>
                <div class="col-md-3 grid-details">
                    <div class="grid-addon">
                        <section  class="sky-form">
                            <div class="product_right">
                                <h4 class="m_2"><span class="glyphicon glyphicon-minus" aria-hidden="true"></span>Categories</h4>
                                <div class="tab1">
                                    <ul class="place">								
                                        <li class="sort">Shoes</li>
                                        <li class="by"><img src="images/do.png" alt=""></li>
                                        <div class="clearfix"> </div>
                                    </ul>
                                    <div class="single-bottom">						
                                        <a href="#"><p>Running</p></a>
                                        <a href="#"><p>Foot ball</p></a>
                                        <a href="#"><p>Daily</p></a>
                                        <a href="#"><p>Sneakers</p></a>
                                    </div>
                                </div>						  
                                <div class="tab2">
                                    <ul class="place">								
                                        <li class="sort">Clothing</li>
                                        <li class="by"><img src="images/do.png" alt=""></li>
                                        <div class="clearfix"> </div>
                                    </ul>
                                    <div class="single-bottom">						
                                        <a href="#"><p>Tracks</p></a>
                                        <a href="#"><p>Tees</p></a>
                                        <a href="#"><p>Hair bands</p></a>
                                        <a href="#"><p>Wrist bands</p></a>
                                    </div>
                                </div>
                                <div class="tab3">
                                    <ul class="place">								
                                        <li class="sort">Gear</li>
                                        <li class="by"><img src="images/do.png" alt=""></li>
                                        <div class="clearfix"> </div>
                                    </ul>
                                    <div class="single-bottom">						
                                        <a href="#"><p>Running app</p></a>
                                        <a href="#"><p>Training club</p></a>
                                        <a href="#"><p>Nike Fuel+Band se</p></a>
                                    </div>
                                </div>						  
                                <!--script-->
                                <script>
                                    $(document).ready(function () {
                                        $(".tab1 .single-bottom").hide();
                                        $(".tab2 .single-bottom").hide();
                                        $(".tab3 .single-bottom").hide();
                                        $(".tab4 .single-bottom").hide();
                                        $(".tab5 .single-bottom").hide();

                                        $(".tab1 ul").click(function () {
                                            $(".tab1 .single-bottom").slideToggle(300);
                                            $(".tab2 .single-bottom").hide();
                                            $(".tab3 .single-bottom").hide();
                                            $(".tab4 .single-bottom").hide();
                                            $(".tab5 .single-bottom").hide();
                                        })
                                        $(".tab2 ul").click(function () {
                                            $(".tab2 .single-bottom").slideToggle(300);
                                            $(".tab1 .single-bottom").hide();
                                            $(".tab3 .single-bottom").hide();
                                            $(".tab4 .single-bottom").hide();
                                            $(".tab5 .single-bottom").hide();
                                        })
                                        $(".tab3 ul").click(function () {
                                            $(".tab3 .single-bottom").slideToggle(300);
                                            $(".tab4 .single-bottom").hide();
                                            $(".tab5 .single-bottom").hide();
                                            $(".tab2 .single-bottom").hide();
                                            $(".tab1 .single-bottom").hide();
                                        })
                                        $(".tab4 ul").click(function () {
                                            $(".tab4 .single-bottom").slideToggle(300);
                                            $(".tab5 .single-bottom").hide();
                                            $(".tab3 .single-bottom").hide();
                                            $(".tab2 .single-bottom").hide();
                                            $(".tab1 .single-bottom").hide();
                                        })
                                        $(".tab5 ul").click(function () {
                                            $(".tab5 .single-bottom").slideToggle(300);
                                            $(".tab4 .single-bottom").hide();
                                            $(".tab3 .single-bottom").hide();
                                            $(".tab2 .single-bottom").hide();
                                            $(".tab1 .single-bottom").hide();
                                        })
                                    });
                                </script>
                                <!-- script -->					 
                        </section>
                        <section  class="sky-form">
                            <h4><span class="glyphicon glyphicon-minus" aria-hidden="true"></span>DISCOUNTS</h4>
                            <div class="row row1 scroll-pane">
                                <div class="col col-4">
                                    <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Upto - 10% (20)</label>
                                </div>
                                <div class="col col-4">
                                    <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>40% - 50% (5)</label>
                                    <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>30% - 20% (7)</label>
                                    <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>10% - 5% (2)</label>
                                    <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Other(50)</label>
                                </div>
                            </div>
                        </section> 				 
                        <!---->
                        <link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
                        <script type='text/javascript'>//<![CDATA[ 
                            $(window).load(function () {
                                $("#slider-range").slider({
                                    range: true,
                                    min: 0,
                                    max: 400000,
                                    values: [2500, 350000],
                                    slide: function (event, ui) {
                                        $("#amount").val("$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ]);
                                    }
                                });
                                $("#amount").val("$" + $("#slider-range").slider("values", 0) + " - $" + $("#slider-range").slider("values", 1));

                            });//]]>  

                        </script>
                        <section  class="sky-form">
                            <h4><span class="glyphicon glyphicon-minus" aria-hidden="true"></span>Type</h4>
                            <div class="row row1 scroll-pane">
                                <div class="col col-4">
                                    <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Air Max (30)</label>
                                </div>
                                <div class="col col-4">
                                    <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Armagadon   (30)</label>
                                    <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Helium (30)</label>
                                    <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Kyron     (30)</label>
                                    <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Napolean  (30)</label>
                                    <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Foot Rock   (30)</label>
                                    <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Radiated  (30)</label>
                                    <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Spiked  (30)</label>
                                </div>
                            </div>
                        </section>
                        <section  class="sky-form">
                            <h4><span class="glyphicon glyphicon-minus" aria-hidden="true"></span>Brand</h4>
                            <div class="row row1 scroll-pane">
                                <div class="col col-4">
                                    <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Roadstar</label>
                                </div>
                                <div class="col col-4">
                                    <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Tornado</label>
                                    <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Kissan</label>
                                    <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Oakley</label>
                                    <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Manga</label>
                                    <label class="checkbox"><input type="checkbox" name="checkbox" ><i></i>Wega</label>
                                    <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Kings</label>
                                    <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Zumba</label>
                                </div>
                            </div>
                        </section>		
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