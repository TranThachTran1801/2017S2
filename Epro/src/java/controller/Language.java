package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.UserSessionHolder;
import util.Settings;

/**
 *
 * @author IU-CSE Team
 */
@WebServlet("/language")
public class Language extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sess = request.getSession(false);
        ResourceBundle rb = null;
        String languageType = request.getParameter("lang");
        PrintWriter out = response.getWriter();

        UserSessionHolder ush = Settings.getCurrentUserSession(request);

        if (languageType == null || languageType.equals("vi")) {
            rb = ResourceBundle.getBundle("resource.language_support_vi_VN");
        } else if (languageType.equals("en")) {
            rb = ResourceBundle.getBundle("resource.language_support_en_US");
        }

        if (rb != null) {
            List<String> keys = Collections.list(rb.getKeys());
            Map<String, String> languageCode = keys
                    .stream()
                    .collect(Collectors.toMap(key -> key, rb::getString));

            sess.setAttribute("languageCode", languageCode);

            response.sendRedirect("index.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
