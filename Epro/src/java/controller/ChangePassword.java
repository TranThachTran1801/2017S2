package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import repository.AccountRepository;
import util.Encript;
import util.Settings;

/**
 *
 * @author IU-CSE Team
 */

@WebServlet("/changepassword")
public class ChangePassword extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String newPassword = request.getParameter("newPassword");
        String accountId = request.getParameter("accountId");

        AccountRepository.changePassword(accountId, Encript.encript(newPassword));
        Settings.removeWebUserSession(request);
        response.sendRedirect("login.jsp");
    }

}
