package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;
import util.Settings;

/**
 *
 * @author IU-CSE Team
 */

@WebServlet("/updateCart")
public class UpdateCart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        List<Product> cartProduct = Settings.getCart(request).getProducts();
        Map<String, String> map = (HashMap<String, String>) Settings.getSessionAttribute(request, "languageCode");

        String value = "<table class='table table-hover'>"
                + "                        <thead>"
                + "                            <tr class='danger'>"
                + "                                <th>" + map.get("cart.id") + "</th>"
                + "                                <th>" + map.get("cart.name") + "</th>"
                + "                                <th>" + map.get("cart.price") + "</th>"
                + "                            </tr>"
                + "                        </thead>"
                + "                        <tbody>";

        for (Product product : cartProduct) {
            
            String name = map.get(product.getProductName()) == null ? product.getProductName() : map.get(product.getProductName());
            
            String productString = "<tr>"
                    + "<td>" + product.getProductId() + "</td>"
                    + "<td>" + name + "</td>"
                    + "<td>" + product.getProductPrice() + "</td></tr>";
            value = value.concat(productString);
        }
        
        out.print(value);
        out.print("</tbody></table>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
