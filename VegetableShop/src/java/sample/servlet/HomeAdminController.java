/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.category.CategoryDAO;
import sample.category.CategoryDTO;
import sample.user.ProductDAO;
import sample.user.ProductDTO;

/**
 *
 * @author Thiep Ngo
 */
public class HomeAdminController extends HttpServlet {

    private static final String ERROR = "admin.jsp";
    private static final String SUCCESS = "admin.jsp";
    private static final int PAGE_ZIE = 9;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            int page = 1;
            String pageStr = request.getParameter("page");
            if (pageStr != null) {
                page = Integer.parseInt(pageStr);
            }
            HttpSession session = request.getSession();
            List<CategoryDTO> listCategories = new CategoryDAO().getAllCategories();
            List<ProductDTO> listProducts = new ProductDAO().getListProductWithPaging(page, PAGE_ZIE);
            int totalProducts = new ProductDAO().getTotalProducts();
            int totalPage = totalProducts / PAGE_ZIE;
            if (totalProducts % PAGE_ZIE != 0) {
                totalPage += 1;
            }

            request.setAttribute("PAGE", page);
            request.setAttribute("TOTAL_PAGE", totalPage);
            request.setAttribute("LIST_PRODUCT", listProducts);
            session.setAttribute("LIST_CATEGORY", listCategories);
            url = SUCCESS;

        } catch (Exception e) {
            log("Error at DeleteProductController" + e.toString());
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
