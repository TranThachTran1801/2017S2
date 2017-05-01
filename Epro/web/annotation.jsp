

<%@page import="java.util.HashMap"%>
<%@page import="model.UserRole"%>
<%@page import="model.UserSessionHolder"%>
<%@page import="java.util.Map"%>
<%@page import="util.Settings"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Map<String, String> languageMap = (HashMap<String, String>) Settings.getSessionAttribute(request, "languageCode");
    UserSessionHolder ush = Settings.getCurrentUserSession(request);
    if (languageMap == null) {
        request.getRequestDispatcher("language?lang=vi").forward(request, response);
   
    } else {
        String info = languageMap.get(request.getParameter("success"));
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title><%=languageMap.get("title")%></title>
        <style>
            .container {
                padding: 20px 60px
            }
        </style>
    </head>
    <body>
        <div class="container text-center">
            
            <div class="well">
                <h1>
                    <span style="color: white" class="label label-primary">
                        <%=languageMap.get("anno.congrat")%>
                    </span>
                </h1>
                <b><%=info%><b>
            </div>
                <a href="login.jsp" class="btn btn-lg btn-success"><%=languageMap.get("login")%>
                    <span class="badge">
                        <span class="glyphicon glyphicon-log-in"></span>
                    </span>
                </a>
            <a href="index.jsp" class="btn btn-lg btn-danger "><%=languageMap.get("anno.goback")%>
                <span class="badge">
                    <span class="glyphicon glyphicon-new-window"></span>
                </span>
            </a>
        </div>
    </body>
</html>
<%}%>
