/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.Cart;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Product;

/**
 *
 * @author Thiep Ngo
 */
public class AddToCartController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int productID = Integer.parseInt(request.getParameter("productID"));
            HttpSession session = request.getSession();
            Map<Integer, Cart> carts = (Map<Integer, Cart>) session.getAttribute("CARTS");
            if(carts == null) {
                carts = new LinkedHashMap<>(); //linkedHashMap nó có thứ tự, xài HashMap ko có thứ tự
            }
            
            if (carts.containsKey(productID)) { //sản phẩm đã có trên giỏ hàng
                int oldQuantity = carts.get(productID).getQuantity();
                carts.get(productID).setQuantity(oldQuantity + 1);
            } else {  // sản phẩm chưa có trên giỏ hàng
                Product product = new ProductDAO().getProductByID(productID);
                carts.put(productID, Cart.builder().product(product).quantity(1).build());
            }
            //lưu trên session
            session.setAttribute("CARTS", carts); 
            System.out.println(carts);
            String urlHistory = (String) session.getAttribute("urlHistory");
            if (urlHistory == null) {
                urlHistory = "home";
            }
            response.sendRedirect(urlHistory);
    }
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
