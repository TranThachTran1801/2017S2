package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import model.UserRole;
import model.UserSessionHolder;
import java.util.HashMap;
import java.util.Map;
import util.Settings;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");

    Map<String, String> languageMap = (HashMap<String, String>) Settings.getSessionAttribute(request, "languageCode");
    UserSessionHolder ush = Settings.getCurrentUserSession(request);
    if (languageMap == null) {
        request.getRequestDispatcher("language?lang=vi").forward(request, response);
    } else if (!ush.getAccrole().equals(UserRole.GUEST)) {
        response.sendRedirect("index.jsp");
    } else {

      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/loginCSS.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">\r\n");
      out.write("        <script type=\"text/javascript\" src=\"//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js\"></script>\r\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.1/css/materialize.min.css\">\r\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.1/js/materialize.min.js\"></script>\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"https://fonts.googleapis.com/css?family=Tangerine\" />\r\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css?family=Lobster\" rel=\"stylesheet\">\r\n");
      out.write("        <title>");
      out.print(languageMap.get("title"));
      out.write("</title>\r\n");
      out.write("        <style type=\"text/css\">\r\n");
      out.write("            html,\r\n");
      out.write("            body {\r\n");
      out.write("                height: 100%;\r\n");
      out.write("                background-color: #ffbf80\r\n");
      out.write("            }\r\n");
      out.write("            html {\r\n");
      out.write("                display: table;\r\n");
      out.write("                margin: auto;\r\n");
      out.write("            }\r\n");
      out.write("            body {\r\n");
      out.write("                display: table-cell;\r\n");
      out.write("                vertical-align: middle;\r\n");
      out.write("            }\r\n");
      out.write("            .margin {\r\n");
      out.write("                margin: 0 !important;\r\n");
      out.write("            }\r\n");
      out.write("        </style>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <div id=\"login-page\" class=\"row\">\r\n");
      out.write("            <div class=\"col s12 z-depth-6 card-panel\">\r\n");
      out.write("                <form class=\"login-form\" method=\"post\" action=\"login\">\r\n");
      out.write("                    <div class=\"row\">\r\n");
      out.write("                        <div class=\"input-field col s12 center\">\r\n");
      out.write("                            <img src=\"images/regpic.png\" style=\"height: 160px\" alt=\"\" class=\"center-block\">\r\n");
      out.write("                            <p class=\"center login-form-text\">\r\n");
      out.write("                            <h5>");
      out.print(languageMap.get("login.title"));
      out.write("\r\n");
      out.write("                                <b><span style=\"font-family: 'Tangerine', serif; font-size: 200%\">\r\n");
      out.write("                                        <span style=\"color:#009900\">E</span> -\r\n");
      out.write("                                        <span style=\"color:#f3c500\">Commerce</span>\r\n");
      out.write("                                    </span>\r\n");
      out.write("                                </b>\r\n");
      out.write("                            </h5>\r\n");
      out.write("                            </p>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"row margin\">\r\n");
      out.write("                        <div class=\"input-field col s12\">\r\n");
      out.write("                            <i class=\"mdi-social-person-outline prefix\"></i>\r\n");
      out.write("                            <input id=\"username\" type=\"text\" name=\"username\" class=\"validate\" required>\r\n");
      out.write("                            <label for=\"username\" class=\"center-align\">");
      out.print(languageMap.get("login.username.placeholder"));
      out.write("</label>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"row margin\">\r\n");
      out.write("                        <div class=\"input-field col s12\">\r\n");
      out.write("                            <i class=\"mdi-action-lock prefix\"></i>\r\n");
      out.write("                            <input id=\"password\" type=\"password\" name=\"password\" class=\"validate\" required>\r\n");
      out.write("                            <label for=\"password\">");
      out.print(languageMap.get("login.password.placeholder"));
      out.write("</label>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"row\">          \r\n");
      out.write("                        <div class=\"input-field col s12 m12 l12  login-text\">\r\n");
      out.write("                            <input type=\"checkbox\" id=\"remember-me\" />\r\n");
      out.write("                            <label for=\"remember-me\">");
      out.print(languageMap.get("login.remember"));
      out.write("</label>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"row\">\r\n");
      out.write("                        <div style=\"color:red\">\r\n");
      out.write("                            ");
      out.print((String) Settings.getSessionAttribute(request, "isAuthenticated") != null
                                    ? languageMap.get("login.fail")
                                    : "");
      out.write("\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"row\">\r\n");
      out.write("                        <div class=\"input-field col s12\">\r\n");
      out.write("                            <button type=\"submit\" class=\"btn waves-effect waves-light col s12\"><span style=\"font-family: 'Lobster', cursive; font-size: 150%\">");
      out.print(languageMap.get("login.login"));
      out.write("<span></a>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"input-field col s12\">\r\n");
      out.write("                            <p class=\"margin center medium-small sign-up pull-left\"><a style=\"color:blue\" href=\"index.jsp\">");
      out.print(languageMap.get("login.back"));
      out.write("</a></p>\r\n");
      out.write("                            <p class=\"margin center medium-small sign-up pull-right\"><a style=\"color:blue\" href=\"#\">");
      out.print(languageMap.get("login.help"));
      out.write("</a></p>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </form>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("       \r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
}
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
