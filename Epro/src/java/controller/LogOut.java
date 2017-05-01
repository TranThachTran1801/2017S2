
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.UserSessionHolder;
import util.Settings;
/**
 *
 * @author IU-CSE Team
 */
@WebServlet("/logout")
public class LogOut extends HttpServlet{
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        UserSessionHolder currentUSH = Settings.getCurrentUserSession(request);
        
        if (currentUSH.equals(UserSessionHolder.getGuestSession())) {
            response.sendRedirect("index.jsp");
        } else {
            Settings.removeWebUserSession(request);
            response.sendRedirect("index.jsp");
        }
    }
    
}
