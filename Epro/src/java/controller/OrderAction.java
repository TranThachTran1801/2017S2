package controller;

import dao.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Checkout;
import model.Order;
import model.OrderType;
import model.Product;
import repository.ProductRepositoty;
import util.JsonBinder;
import util.Settings;

/**
 *
 * @author IU-CSE Team
 */

@WebServlet("/orderaction")
public class OrderAction extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String fullname = request.getParameter("checkout-fullname-name");
        String address = request.getParameter("checkout-address-name");
        String phone = request.getParameter("checkout-phone-name");
        String purchaseBy = request.getParameter("checkout-purchase-name");
        String cardType = null;
        String cardId = null;
        
        if (purchaseBy.equals(String.valueOf(OrderType.CARD))) {
            cardType = request.getParameter("checkout-carttype-name");
            cardId = request.getParameter("checkout-cardId-name");
        }
        double totalcost = Double.valueOf(request.getParameter("total-cost-hidden-name"));
        String orderDate = String.valueOf(LocalDate.now());
        
        Map<String, Integer> quantityMap = new HashMap<>();   
        String customerId = Settings.getCurrentAccount(request).getId();
        Map<String, String> map = (HashMap<String, String>) Settings.getSessionAttribute(request, "languageCode");
        List<Product> orderProduct = Settings.getCart(request).getProducts();
        
        orderProduct.forEach(product -> {
            quantityMap.put((map.get(product.getProductName()) == null ? product.getProductName() : map.get(product.getProductName())), Integer.valueOf(request.getParameter(product.getProductId())));
        });
        
        List<Order> myOrder = quantityMap.entrySet().stream()
                .map(entry -> new Order(entry.getKey(), entry.getValue()))
                .collect(Collectors.toList());
        Checkout myCheckout = new Checkout(myOrder);  
        String coString = JsonBinder.toJson(myCheckout);
        
        OrderDAO aO = new OrderDAO(constructOrderId(),
                customerId,
                fullname, 
                address,
                phone,
                orderDate,
                totalcost,
                cardId,
                coString,
                OrderType.valueOf(purchaseBy));
        
        ProductRepositoty.insertOrder(aO);
        
        response.sendRedirect("annotation.jsp?success=checkout.anno");
        
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }


    private String constructOrderId() {
        List<OrderDAO> currentOrders = ProductRepositoty.getAllOrder();
        Collections.reverse(currentOrders);

        String currentId = currentOrders.stream()
                .map(OrderDAO::getOrderId)
                .findFirst()
                .orElse(null);
        
        if (currentId == null) {
            return "OD001";
        }

        String suffix = currentId.substring(0, 4);
        String prefix = currentId.substring(4, currentId.length());

        int newValueId = Integer.valueOf(prefix) + 1;
        prefix = String.valueOf(newValueId);

        return suffix + prefix;
    }

}
