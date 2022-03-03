/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.user.ProductDAO;
import sample.user.ProductDTO;

/**
 *
 * @author Thiep Ngo
 */
@WebServlet(name = "EditController", urlPatterns = {"/EditController"})
public class EditController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "HomeAdminController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            int productID = Integer.parseInt(request.getParameter("productID"));
            String productName = request.getParameter("productName");
            String imageUrl = request.getParameter("imageUrl");
            String description = request.getParameter("description");
            double price = Double.parseDouble(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int categoryID = Integer.parseInt(request.getParameter("categoryID"));
            String importDate = request.getParameter("importDate");
            String usingDate = request.getParameter("usingDate");
            ProductDTO products = new ProductDTO(productID, productName, quantity, price, description, imageUrl, categoryID, importDate, usingDate,"", 1);
            request.setAttribute("LIST_PRODUCT", products);
            boolean checkUpdate = new ProductDAO().updateProduct(products, productID);
            if (checkUpdate) {
                if (products != null) {
                    products.setProductName(productName);
                    products.setImageUrl(imageUrl);
                    products.setDescription(description);
                    products.setPrice(price);
                    products.setQuantity(quantity);
                    products.setCategoryID(categoryID);
                    products.setImportDate(importDate);
                    products.setUsingDate(usingDate);
                    request.setAttribute("LIST_PRODUCT", products);
                }
            }
            url = SUCCESS;
        } catch (Exception e) {
            log("EditController" + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
