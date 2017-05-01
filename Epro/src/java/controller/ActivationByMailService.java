package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import repository.AccountRepository;

/**
 *
 * @author IU-CSE Team
 */

@WebServlet("/fa2dcc238152c8737597858b6adb4e6e93e1a84feddfad3be60575c982846a4d00d8d3f11739d2f3537099982b4674c29fc59a8fda350fca1379613adbb09119")
public class ActivationByMailService extends HttpServlet {

    private static final String PARAMETER_CONTENT = "300a670c21bcf9d2cc4b53b2443abf2a99891178f8b5d4e9e7a5e5ba80d57cb3";
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accountIds = request.getParameter(PARAMETER_CONTENT);
        AccountRepository.activateAccount(accountIds);
        response.sendRedirect("login.jsp");
    }

}
