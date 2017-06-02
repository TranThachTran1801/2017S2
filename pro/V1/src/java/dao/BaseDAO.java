package dao;

import annotation.Transaction;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import model.Account;
import model.Activation;
import model.Category;
import model.OrderType;
import model.Product;
import model.UserRole;
import util.Constant;
import util.JsonBinder;

/**
 *
 * @author IU-CSE Team
 */
public class BaseDAO {

    public static final String USERNAME = Constant.getDBUsername();
    public static final String PASSWORD = Constant.getDBPassword();
    public static final String CONNECTION_POOL = Constant.getDBConnection();

    @Transaction
    private static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/badao", "root", "2912");

        if (connection == null) {
            throw new ClassNotFoundException("DB not found!");
        }

        return connection;
    }

    @Transaction
    public static ResultSet coreExeTransaction(String sqlQuery) throws SQLException, ClassNotFoundException {
        Statement sta = getConnection().createStatement();
        ResultSet rs = sta.executeQuery(sqlQuery);

        return rs;
    }

    @Transaction
    public static void coreUpdateTransaction(String sqlQuery) throws SQLException, ClassNotFoundException {
        Statement sta = getConnection().createStatement();
        sta.executeUpdate(sqlQuery);

        getConnection().close();
    }

    @Transaction
    public static List<Account> getAllAccount() {
        List<Account> accounts = new ArrayList<>();
        try {
            ResultSet rs = coreExeTransaction("SELECT * FROM badao.account");
            
            while (rs.next()) {
                accounts.add(new Account(rs.getString("accid"),
                        rs.getString("accname"),
                        rs.getString("accpassword"),
                        rs.getString("accemail"),
                        rs.getString("accaddress"),
                        Activation.valueOf(rs.getString("accactivate")),
                        UserRole.valueOf(rs.getString("accrole")),
                        rs.getString("accdate")
                ));
            }

            getConnection().close();
        } catch (SQLException | ClassNotFoundException e) {
        }

        return accounts;
    }

    @Transaction
    public static List<Product> getAllProduct() {
        List<Product> products = new ArrayList<>();
        try {
            ResultSet rs = coreExeTransaction("SELECT * FROM product");

            while (rs.next()) {
                products.add(new Product(rs.getString("productid"),
                        rs.getString("productname"),
                        rs.getDouble("productprice"),
                        rs.getString("supplierid"),
                        rs.getString("info")));
            }

            getConnection().close();
        } catch (SQLException | ClassNotFoundException e) {
        }
        return products;
    }

    @Transaction
    public static List<OrderDAO> getAllOrder() {
        List<OrderDAO> orders = new ArrayList<>();
        try {
            ResultSet rs = coreExeTransaction("SELECT * FROM ecmrproj.`order`");

            while (rs.next()) {
                orders.add(new OrderDAO(rs.getString("orderid"),
                        rs.getString("customerid"),
                        rs.getString("orderfullname"),
                        rs.getString("orderaddress"),
                        rs.getString("orderphone"),
                        rs.getString("orderdate"),
                        Double.valueOf(rs.getString("totalcost")),
                        rs.getString("cardid"),
                        rs.getString("orderform"),
                        OrderType.valueOf(rs.getString("ordertype"))));
            }

            getConnection().close();
        } catch (SQLException | ClassNotFoundException e) {
        }
        return orders;
    }

    @Transaction
    public static List<Category> getAllSupply() {
        List<Category> categories = new ArrayList<>();

        try {
            ResultSet rs = coreExeTransaction("SELECT * FROM supply");

            while (rs.next()) {
                String jsString = rs.getString("product");
                categories.add((Category) JsonBinder.fromJson(jsString, Category.class));
            }

            getConnection().close();
        } catch (SQLException | ClassNotFoundException e) {
        }
        return categories;
    }

    @Transaction
    public static void insertOrderDAO(OrderDAO orderDAO) {

        try {
            String sqlQuery = "INSERT INTO web.`order`"
                    + "(orderid, customerid, orderfullname, orderaddress, orderphone, orderdate, totalcost, cardid, orderform, ordertype)"
                    + " VALUES ('" + orderDAO.getOrderId()
                    + "','" + orderDAO.getCustomerId()
                    + "','" + orderDAO.getOrderFullname()
                    + "','" + orderDAO.getOrderAddress()
                    + "','" + orderDAO.getOrderPhone()
                    + "','" + orderDAO.getOrderDate()
                    + "','" + String.valueOf(orderDAO.getTotalCost())
                    + "','" + orderDAO.getCardid()
                    + "','" + orderDAO.getOrderform()
                    + "','" + orderDAO.getOrdertype()
                    + "')";

            coreUpdateTransaction(sqlQuery);
        } catch (SQLException | ClassNotFoundException e) {

        }
    }

    @Transaction
    public static void insertAccount(Account account) {
        try {
            String sqlQuery = "INSERT INTO badao.`account`"
                    + "(accid, accname, accpassword, accemail, accaddress, accactivate, accrole, accdate)"
                    + " VALUES ('" + account.getId()
                    + "','" + account.getUsername()
                    + "','" + account.getPassword()
                    + "','" + account.getEmail()
                    + "','" + account.getAddress()
                    + "','" + account.getActivate()
                    + "','" + account.getRole()
                    + "','" + account.getCreateDate() + "')";

            coreUpdateTransaction(sqlQuery);
        } catch (SQLException | ClassNotFoundException e) {
        }
    }

    @Transaction
    public static void insertProduct(Product product) {
        try {

            String sqlQuery = "INSERT INTO ecmrproj.`product`"
                    + "(productid, productname, productprice, supplierid, info)"
                    + " VALUES ('" + product.getProductId()
                    + "','" + product.getProductName()
                    + "'," + product.getProductPrice()
                    + ",'" + product.getSupplierId()
                    + "','" + product.getInfo() + "')";

            coreUpdateTransaction(sqlQuery);
        } catch (SQLException | ClassNotFoundException e) {
        }
    }

    @Transaction
    public static void insertSupply(Category category) {
        try {
            String sqlQuery = "INSERT INTO ecmrproj.`supply`"
                    + "(product, supplierid, name)"
                    + " VALUES ('" + JsonBinder.toJson(category)
                    + "','" + category.getSupplierId()
                    + "','" + category.getName() + "')";

            coreUpdateTransaction(sqlQuery);
        } catch (SQLException | ClassNotFoundException e) {
        }
    }

    @Transaction
    public static void updateProduct(Product product) {
        try {
            String sqlQuery = "UPDATE ecmrproj.`product`"
                    + "SET productname='" + product.getProductName()
                    + "', productprice=" + product.getProductPrice()
                    + ", supplierid='S001', info='" + String.valueOf(product.getInfo()) + "'"
                    + "WHERE productid='" + product.getProductId() + "'";

            coreUpdateTransaction(sqlQuery);
        } catch (SQLException | ClassNotFoundException e) {
        }
    }

    @Transaction
    public static void pendingAccountState(String accountID) {
        try {
            String sqlQuery = "UPDATE badao.account"
                    + " SET accactivate='" + String.valueOf(Activation.PENDING) + "'"
                    + "WHERE accid='" + accountID + "'";
             System.out.println(sqlQuery);
            coreUpdateTransaction(sqlQuery);
        } catch (SQLException | ClassNotFoundException e) {
        }
    }

    @Transaction
    public static void activatedAccountState(String accountID) {
        try {
            String sqlQuery = "UPDATE badao.account"
                    + " SET accactivate='" + String.valueOf(Activation.ACTIVATED) + "'"
                    + "WHERE accid='" + accountID + "'";
            System.out.println(sqlQuery);
            coreUpdateTransaction(sqlQuery);
        } catch (SQLException | ClassNotFoundException e) {
        }
    }

    @Transaction
    public static void changePassword(String accountID, String newPassword) {
        try {
            String sqlQuery = "UPDATE badao.`account`"
                    + "SET accpassword='" + newPassword + "'"
                    + "WHERE accid='" + accountID + "'";

            coreUpdateTransaction(sqlQuery);
        } catch (SQLException | ClassNotFoundException e) {
        }
    }

    @Transaction
    public static void deleteOrder(String orderId) {
        try {
            String sqlQuery = "DELETE FROM badao.`order`"
                    + "WHERE orderid='" + orderId + "'";

            coreUpdateTransaction(sqlQuery);
        } catch (SQLException | ClassNotFoundException e) {
        }
    }

}
