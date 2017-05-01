/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.shoppingcart1;
import bean.shose;
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
            if (action.equals("shose")) {
                DAO boy = new DAO();
                ArrayList<shose> boys = boy.sneakerformen();
                session.setAttribute("boys", boys);
                dispatcher(request, response, "product.jsp");
            }

            if (action.equals("shoseDetail")) {
                int id = Integer.parseInt(request.getParameter("id"));
                DAO detail = new DAO();
                shose shosedetail = detail.shoseDetail(id);
                session.setAttribute("shosedetail", shosedetail);
                dispatcher(request, response, "single.jsp");
            }
            if (action.equals("Add to Cart")) {
                shoppingcart1 cart = (shoppingcart1) session.getAttribute("cart");
                if (cart == null) {
                    cart = new shoppingcart1();
                }
                shose shosedetail = (shose) session.getAttribute("shosedetail");

                int quantity = Integer.parseInt(request.getParameter("quantity"));

                cart.addProduct(shosedetail, quantity);
                System.out.println(cart.getTotal());
                session.setAttribute("cart", cart);
                dispatcher(request, response, "single.jsp");
            }
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
