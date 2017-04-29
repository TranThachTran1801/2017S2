package controller;

import dao.BaseDAO;
import java.io.IOException;
import java.time.LocalDate;
import java.util.Collections;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Activation;
import model.UserRole;
import util.Encript;

/**
 *
 * @author IU-CSE Team
 */

@WebServlet("/signup")
public class SignUp extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("regUsername");
        String email = request.getParameter("regEmail");
        String password = request.getParameter("regPassword");

        Account account = createAccount(username, email, password);
        BaseDAO.insertAccount(account);

        response.sendRedirect("annotation.jsp?success=reg.success");

    }

    private Account createAccount(String username, String email, String password) {
        String today = String.valueOf(LocalDate.now());

        return new Account(generateNewId(),
                username,
                Encript.encript(password),
                email, "",
                Activation.UNACTIVATED,
                UserRole.CUSTOMER,
                today);
    }

    private String generateNewId() {
        List<Account> allAccounts = BaseDAO.getAllAccount();
        Collections.reverse(allAccounts);

        String currentId = allAccounts.stream()
                .filter(account -> account.getRole().equals(UserRole.CUSTOMER))
                .map(Account::getId)
                .findFirst()
                .orElse(null);

        String suffix = currentId.substring(0, 4);
        String prefix = currentId.substring(4, currentId.length());

        int newValueId = Integer.valueOf(prefix) + 1;
        prefix = String.valueOf(newValueId);

        return suffix + prefix;
    }
}
