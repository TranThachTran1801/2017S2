package repository;

import dao.BaseDAO;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import model.Account;
import model.Activation;
import util.Constant;
import util.MailService;

/**
 *
 * @author IU-CSE Team
 */

public class AccountRepository {

    private static final String ADDRESS_CONTENT = "fa2dcc238152c8737597858b6adb4e6e93e1a84feddfad3be60575c982846a4d00d8d3f11739d2f3537099982b4674c29fc59a8fda350fca1379613adbb09119";
    private static final String PARAMETER_CONTENT = "300a670c21bcf9d2cc4b53b2443abf2a99891178f8b5d4e9e7a5e5ba80d57cb3";

    public static List<Account> getAllAccount() {
        return BaseDAO.getAllAccount();
    }

    public static Account getAccountById(String accountId) {
        return getAllAccount().stream()
                .filter(account -> account.getId().equals(accountId))
                .findFirst()
                .orElse(null);
    }

    public static String getCustomerName(String customerId) {
        return getAccountById(customerId).getUsername();
    }

    public static List<Account> getUnactivatedAccounts() {
        return getAllAccount().stream()
                .filter(account -> account.getActivate().equals(Activation.UNACTIVATED))
                .collect(Collectors.toList());
    }

    public static void pendingAccount(String[] accountIds) {
        Stream.of(accountIds).forEach(BaseDAO::pendingAccountState);
        Stream.of(accountIds)
                .map(AccountRepository::getAccountById)
                .filter(account -> account != null)
                .forEach(account -> MailService.sendMail(account.getEmail(),
                                getMailContent(account.getId())));
        
    }

    public static void activateAccount(String accountIds) {
        BaseDAO.activatedAccountState(accountIds);
    }
    
    public static void changePassword(String accountId, String newPassword) {
        BaseDAO.changePassword(accountId, newPassword);
    }

    private static String getMailContent(String accountId) {
        String content = "Dear " + getCustomerName(accountId) + ","
                + "\n\nThank for your registration to our E-Commerce."
                + " Your account has been qualified for activation by the administrators of the website."
                + "Congratulations!!!\n\n"
                + "However, you need to do one more step to make your account valid."
                + " Click to the link below and then log in to the system. That is all for your validation."
                + "\nhttp://localhost:" + Constant.getServerPort() + "/ECommerceProject/" + ADDRESS_CONTENT + "?" + PARAMETER_CONTENT
                + "="+accountId
                + "\n\nBest regards, \nE-Commerce Team.";
        return content;
    }
}
