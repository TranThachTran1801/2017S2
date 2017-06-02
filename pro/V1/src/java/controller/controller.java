 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.myproduct;
import bean.shoppingcart1;
import bean.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.*;
import javax.servlet.http.HttpSession;

/**
 *
 * @author trung
 */
@WebServlet(name = "controller", urlPatterns = {"/controller"})
public class controller extends HttpServlet {

    private Object session;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String action = request.getParameter("action");
            System.out.println(action);
            if (action.equals("shose")) {
                DAO dao = new DAO();
                ArrayList<myproduct> product = dao.getProduct();
                session.setAttribute("product", product);
                dispatcher(request, response, "product.jsp");
            }

            if (action.equals("productDetail")) {
                int id = Integer.parseInt(request.getParameter("id"));
                DAO detail = new DAO();
                myproduct productDetail = detail.productDetail(id);
                session.setAttribute("productdetail", productDetail);
                dispatcher(request, response, "single.jsp");
            }
            // Add product 
            if (action.equals("AddtoCart")) {
                System.out.println(action);
                shoppingcart1 cart = (shoppingcart1) session.getAttribute("cart");
                if (cart == null) {
                    System.out.println("cart: " + null);
                    cart = new shoppingcart1();
                }
                
                System.out.println("product " + session.getAttribute("productdetail"));
                
                myproduct temp = (myproduct) session.getAttribute("productdetail");

                int quantity = Integer.parseInt(request.getParameter("quantity"));

                cart.addProduct(temp, quantity);
                System.out.println("cart total " + cart.getTotal());
                session.setAttribute("cart", cart);
                dispatcher(request, response, "single.jsp");
            }
            //add product
            
            if (action.equals("checkout")) {
                System.out.println(action);
                shoppingcart1 cart = (shoppingcart1) session.getAttribute("cart");
                if (cart == null) {
                    cart = new shoppingcart1();
                }
                 session.setAttribute("cart", cart);
                dispatcher(request, response, "checkout.jsp");
            }
            if(action.equals("delete"))
            {
                 int id = Integer.parseInt(request.getParameter("id"));
                System.out.println(action + " " + id);
                shoppingcart1 cart = (shoppingcart1) session.getAttribute("cart");
                cart.deleteProduct(id);
                session.setAttribute("cart", cart);
                dispatcher(request, response, "checkout.jsp");
            }
            if(action.equals("order"))
            {
                shoppingcart1 cart = (shoppingcart1) session.getAttribute("cart");
                String accid = (String)session.getAttribute("login");
                DAO dao = new DAO();
                dao.order(cart, accid);
                session.removeAttribute("cart");
                response.sendRedirect("index.jsp");
                
                
            }
            if(action.equals("orderDetail"))
            {
                String id = request.getParameter("ID_order");
                DAO dao = new DAO();
                order ans = dao.getOrder(id);
                session.setAttribute("order", ans);
                response.sendRedirect("orderdetail.jsp");
            }
            if(action.equals("get"))
            {
                System.out.println(request.getParameter("month"));
                System.out.println(request.getParameter("year"));
                DAO dao = new DAO();
                ArrayList<order> order = dao.getOrder1(Integer.parseInt(request.getParameter("month")),Integer.parseInt(request.getParameter("year")) );
                session.setAttribute("orderList", order);
                response.sendRedirect("statistic.jsp");
            }
            if(action.equals("search"))
            {
                 System.out.println(request.getParameter("keyword"));
                 DAO dao = new DAO();
                ArrayList<myproduct> product = dao.getProductSearch(request.getParameter("keyword"));
                session.setAttribute("product", product);
                dispatcher(request, response, "product.jsp");
            }
            if(action.equals("rating"))
            {
                String start = request.getParameter("start");
                
                String ID_product = request.getParameter("ID_product");
                System.out.println(start);
                System.out.println(ID_product);
                if(session.getAttribute("login")!=null)
                {
                    String accid = (String)session.getAttribute("login");
                    DAO dao = new DAO();
                    //System.out.println(dao.getrating(ID_product, accid));
                    if(!dao.getrating(ID_product, accid))
                    {
                        dao.rating(ID_product, accid, start);
                    }
                    else
                    {
                        dao.updateRaing(ID_product, accid, start);
                    }
                }
            }
            if(action.equals("comment"))
            {
                String start = request.getParameter("comment");
                
                String ID_product = request.getParameter("ID_product");
               // System.out.println(start);
                //System.out.println(ID_product);
                if(session.getAttribute("login")!=null)
                {
                    String accid = (String)session.getAttribute("login");
                    DAO dao = new DAO();
                    //System.out.println(dao.getrating(ID_product, accid));
                    dao.comment(accid, ID_product, start);
                    dispatcher(request, response, "single.jsp");
                }
            }
        }
    }

    public void dispatcher(HttpServletRequest request, HttpServletResponse response, String page) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher(page);
        rd.forward(request, response);

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
