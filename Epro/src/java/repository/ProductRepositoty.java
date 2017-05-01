package repository;

import dao.BaseDAO;
import dao.OrderDAO;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;
import model.Account;
import model.Category;
import model.Checkout;
import model.Order;
import model.Product;

import static repository.AccountRepository.getCustomerName;
import util.JsonBinder;
import util.MailService;

/**
 *
 * @author IU-CSE Team
 */
public class ProductRepositoty {

    public static List<Product> getAllProduct() {
        return BaseDAO.getAllProduct();
    }

    public static List<OrderDAO> getAllOrder() {
        return BaseDAO.getAllOrder();
    }

    public static void insertOrder(OrderDAO orderDAO) {
        BaseDAO.insertOrderDAO(orderDAO);
    }

    public static Product getProductById(String productId) {
        return getAllProduct().stream()
                .filter(product -> product.getProductId().equals(productId))
                .findFirst()
                .orElse(null);

    }

    public static OrderDAO getOrderDAOById(String orderId) {
        return getAllOrder().stream()
                .filter(Odao -> Odao.getOrderId().equals(orderId))
                .findFirst()
                .orElse(null);
    }

    public static void processOrder(String[] orderIds) {

        Stream.of(orderIds)
                .map(ProductRepositoty::getOrderDAOById)
                .filter(orderDAO -> orderDAO != null)
                .forEach(orderDAO -> {
                    Account account = AccountRepository.getAccountById(orderDAO.getCustomerId());
                    MailService.sendMail(account.getEmail(),
                            getOrderMailContent(
                                    orderDAO.getCustomerId(),
                                    orderDAO.getOrderId(),
                                    orderDAO.getTotalCost()));
                });

        Stream.of(orderIds).forEach(BaseDAO::deleteOrder);

    }

    public static List<Product> getProductByCategory(String supplierId, String name) {
        List<Category> categories = BaseDAO.getAllSupply();

        return categories.stream()
                .filter(cate -> cate.getSupplierId().equals(supplierId) && cate.getName().equals(name))
                .map(Category::getProducts)
                .findFirst()
                .orElse(null);
    }
    
    public static void saveProductFromProviders(List<Product> products) {
        
        
        System.out.println(products);
        products.forEach(product -> {
            if (getProductById(product.getProductId()) == null){
                BaseDAO.insertProduct(product);  
            } 
                
            BaseDAO.updateProduct(product);
        });
    }

    private static String getOrderMailContent(String customerId, String orderId, double total) {
        List<Order> orders = getOrderProductByCustomerId(customerId, orderId);
        String content = "Dear " + getCustomerName(customerId) + ","
                + "\n\nThank for your transaction to our E-Commerce. Here is your order list.\n"
                + "Product \t Quantity";

        for (Order order : orders) {
            content = content + "\n" + order.getProductName() + "\t" + order.getQuantity();
        }
        content = content + "\nTotal price: " + total
                + "\nPlease check your bill and do not hesitate ask us if you have any question."
                + "\n\nBest regards, \nE-Commerce Team.";
        return content;
    }

    private static List<Order> getOrderProductByCustomerId(String customerId, String orderId) {
        String jsonProduct = getAllOrder().stream()
                .filter(orderDAO -> orderDAO.getCustomerId().equals(customerId)
                && orderDAO.getOrderId().equals(orderId))
                .map(OrderDAO::getOrderform)
                .findFirst()
                .orElse("");
        Checkout myCheckout = (Checkout) JsonBinder.fromJson(jsonProduct, Checkout.class);

        return myCheckout.getForms();
    }

}
