
package controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.UserSessionHolder;
import repository.AccountRepository;
import util.Encript;
import util.Settings;

/**
 *
 * @author IU-CSE Team
 */
@WebServlet("/login")
public class LogIn extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        List<Account> accounts = AccountRepository.getAllAccount();
        Account currentUser = accounts.stream()
                .filter(account -> account.isValidate(username, Encript.encript(password)))
                .findFirst()
                .orElse(null);
        
        if (currentUser != null) {
            UserSessionHolder currentHolder = UserSessionHolder.getUSHolderByAccount(currentUser);
            Settings.setWebUserSession(request, currentHolder, currentUser);
            Settings.removeSessionAttribute(request, "isAuthenticated");
            response.sendRedirect("index.jsp");
        } else {
            Settings.setSessionAttribute(request, "isAuthenticated", "false");
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
