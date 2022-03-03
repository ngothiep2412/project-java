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
import sample.user.ProductDAO;
import sample.user.ProductDTO;

/**
 *
 * @author Thiep Ngo
 */
public class SearchProductAdminController extends HttpServlet {

    private static final String ERROR = "home.jsp";
    private static final String SUCCESS_V1 = "admin.jsp";
    private static final String SUCCESS_V2 = "home.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            int roleID;
            final int PAGE_SIZE = 9;
            int pageStr = Integer.parseInt(request.getParameter("page")) ;
            String search = request.getParameter("keyword");

            int totalProducts = new ProductDAO().getTotalProductsWithKeyWord(search);
            int totalPage = totalProducts / PAGE_SIZE;
            if (totalProducts % PAGE_SIZE != 0) {
                totalPage += 1;
            }
            List<ProductDTO> listProducts = new ProductDAO().searchByAdminWithPaging(search, pageStr, PAGE_SIZE);

            if (request.getParameter("roleID") == null) {
                roleID = 2;
            } else {
                roleID = Integer.parseInt(request.getParameter("roleID"));
            }
            request.setAttribute("PAGE", pageStr);
            request.setAttribute("KEYWORD", search);
            request.setAttribute("TOTAL_PAGE", totalPage);
            if (roleID == 1) {
                if (listProducts.size() >= 0) {
                    request.setAttribute("LIST_PRODUCT", listProducts);
                    url = SUCCESS_V1;
                }
            } else {
                if (listProducts.size() >= 0) {
                    request.setAttribute("LIST_PRODUCT", listProducts);
                    url = SUCCESS_V2;
                }
            }

        } catch (Exception e) {
            log("Error at SearchProductAdminController" + e.toString());
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
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
