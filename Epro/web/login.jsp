
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
    if (languageMap == null) {
        request.getRequestDispatcher("language?lang=vi").forward(request, response);
    } else if (!ush.getAccrole().equals(UserRole.GUEST)) {
        response.sendRedirect("index.jsp");
    } else {
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/loginCSS.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.1/css/materialize.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.1/js/materialize.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Tangerine" />
        <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
        <title><%=languageMap.get("title")%></title>
        <style type="text/css">
            html,
            body {
                height: 100%;
                background-color: #ffbf80
            }
            html {
                display: table;
                margin: auto;
            }
            body {
                display: table-cell;
                vertical-align: middle;
            }
            .margin {
                margin: 0 !important;
            }
        </style>
    </head>
    <body>
        <div id="login-page" class="row">
            <div class="col s12 z-depth-6 card-panel">
                <form class="login-form" method="post" action="login">
                    <div class="row">
                        <div class="input-field col s12 center">
                            <img src="images/regpic.png" style="height: 160px" alt="" class="center-block">
                            <p class="center login-form-text">
                            <h5><%=languageMap.get("login.title")%>
                                <b><span style="font-family: 'Tangerine', serif; font-size: 200%">
                                        <span style="color:#009900">E</span> -
                                        <span style="color:#f3c500">Commerce</span>
                                    </span>
                                </b>
                            </h5>
                            </p>
                        </div>
                    </div>
                    <div class="row margin">
                        <div class="input-field col s12">
                            <i class="mdi-social-person-outline prefix"></i>
                            <input id="username" type="text" name="username" class="validate" required>
                            <label for="username" class="center-align"><%=languageMap.get("login.username.placeholder")%></label>
                        </div>
                    </div>
                    <div class="row margin">
                        <div class="input-field col s12">
                            <i class="mdi-action-lock prefix"></i>
                            <input id="password" type="password" name="password" class="validate" required>
                            <label for="password"><%=languageMap.get("login.password.placeholder")%></label>
                        </div>
                    </div>
                    <div class="row">          
                        <div class="input-field col s12 m12 l12  login-text">
                            <input type="checkbox" id="remember-me" />
                            <label for="remember-me"><%=languageMap.get("login.remember")%></label>
                        </div>
                    </div>
                    <div class="row">
                        <div style="color:red">
                            <%=(String) Settings.getSessionAttribute(request, "isAuthenticated") != null
                                    ? languageMap.get("login.fail")
                                    : ""%>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <button type="submit" class="btn waves-effect waves-light col s12"><span style="font-family: 'Lobster', cursive; font-size: 150%"><%=languageMap.get("login.login")%><span></a>
                        </div>
                        <div class="input-field col s12">
                            <p class="margin center medium-small sign-up pull-left"><a style="color:blue" href="index.jsp"><%=languageMap.get("login.back")%></a></p>
                            <p class="margin center medium-small sign-up pull-right"><a style="color:blue" href="#"><%=languageMap.get("login.help")%></a></p>
                        </div>
                    </div>
                </form>
            </div>
        </div>
       
    </body>
</html>
<%}%>