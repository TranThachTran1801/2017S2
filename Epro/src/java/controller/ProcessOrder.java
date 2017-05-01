
package controller;

import java.io.IOException;
import java.util.stream.Stream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import repository.ProductRepositoty;

/**
 *
 * @author IU-CSE Team
 */

@WebServlet("/processOrder")
public class ProcessOrder extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        doGet(request, response);
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        
        String[] orderIds = request.getParameterValues("orderId");
       
        ProductRepositoty.processOrder(orderIds);
    }
    
}
