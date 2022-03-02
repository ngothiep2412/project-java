/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import sample.utils.DBUtils;

/**
 *
 * @author Thiep Ngo
 */
public class ProductDAO {

    private static final String SEARCH = "SELECT [productID]\n"
            + "      ,[productName]\n"
            + "      ,[quantity]\n"
            + "      ,[price]\n"
            + "      ,[description]\n"
            + "      ,[imageUrl]\n"
            + "      ,[categoryID]\n"
            + "      ,[importDate]\n"
            + "      ,[usingDate]\n"
            + "  FROM [dbo].[tblProduct] WHERE [productName] LIKE ?";
    private static final String DELETE = "DELETE FROM [dbo].[tblProduct]\n"
            + "      WHERE [productID] = ?";

    public List<ProductDTO> searchByAdmin(String search) throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int productID = rs.getInt("productID");
                    String productName = rs.getString("productName");
                    int quantity = rs.getInt("quantity");
                    double price = rs.getDouble("price");
                    String description = rs.getString("description");
                    String imageUrl = rs.getString("imageUrl");
                    int categoryID = rs.getInt("categoryID");
                    String importDate = rs.getString("importDate");
                    String usingDate = rs.getString("usingDate");
                    list.add(new ProductDTO(productID, productName, quantity, price, description, imageUrl, categoryID, importDate, usingDate));
                }
            }
        } catch (Exception e) {

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public List<ProductDTO> getListProduct() throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT [productID]\n"
                    + "      ,[productName]\n"
                    + "      ,[quantity]\n"
                    + "      ,[price]\n"
                    + "      ,[description]\n"
                    + "      ,[imageUrl]\n"
                    + "      ,[categoryID]\n"
                    + "      ,[importDate]\n"
                    + "      ,[usingDate]\n"
                    + "  FROM [dbo].[tblProduct]";
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int productID = rs.getInt("productID");
                    String productName = rs.getString("productName");
                    int quantity = rs.getInt("quantity");
                    double price = rs.getDouble("price");
                    String description = rs.getString("description");
                    String imageUrl = rs.getString("imageUrl");
                    int categoryID = rs.getInt("categoryID");
                    String importDate = rs.getString("importDate");
                    String usingDate = rs.getString("usingDate");
                    list.add(new ProductDTO(productID, productName, quantity, price, description, imageUrl, categoryID, importDate, usingDate));
                }
            }
        } catch (Exception e) {

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public boolean deleteProduct(int productID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setInt(1, productID);
                int value = ptm.executeUpdate();
                check = value > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (ptm != null) {
                ptm.close();
            }
        }
        return check;
    }

    public List<ProductDTO> getProductsByCategoryID(int categoryID) throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT [productID]\n"
                    + "      ,[productName]\n"
                    + "      ,[quantity]\n"
                    + "      ,[price]\n"
                    + "      ,[description]\n"
                    + "      ,[imageUrl]\n"
                    + "      ,[categoryID]\n"
                    + "      ,[importDate]\n"
                    + "      ,[usingDate]\n"
                    + "  FROM [dbo].[tblProduct] WHERE [categoryID] = ?";
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, categoryID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int productID = rs.getInt("productID");
                    String productName = rs.getString("productName");
                    int quantity = rs.getInt("quantity");
                    double price = rs.getDouble("price");
                    String description = rs.getString("description");
                    String imageUrl = rs.getString("imageUrl");
                    String importDate = rs.getString("importDate");
                    String usingDate = rs.getString("usingDate");
                    list.add(new ProductDTO(productID, productName, quantity, price, description, imageUrl, categoryID, importDate, usingDate));
                }
            }
        } catch (Exception e) {

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public List<ProductDTO> getListProductWithPaging(int page, int PAGE_ZIE) throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT [productID]\n"
                    + "      ,[productName]\n"
                    + "      ,[quantity]\n"
                    + "      ,[price]\n"
                    + "      ,[description]\n"
                    + "      ,[imageUrl]\n"
                    + "      ,[categoryID]\n"
                    + "      ,[importDate]\n"
                    + "      ,[usingDate]\n"
                    + "FROM [dbo].[tblProduct] ORDER BY [productID]\n"
                    + "OFFSET (? - 1) * ? ROW FETCH NEXT ? ROWS ONLY";
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, page);
                ptm.setInt(2, PAGE_ZIE);
                ptm.setInt(3, PAGE_ZIE);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int productID = rs.getInt("productID");
                    String productName = rs.getString("productName");
                    int quantity = rs.getInt("quantity");
                    double price = rs.getDouble("price");
                    String description = rs.getString("description");
                    String imageUrl = rs.getString("imageUrl");
                    int categoryID = rs.getInt("categoryID");
                    String importDate = rs.getString("importDate");
                    String usingDate = rs.getString("usingDate");
                    list.add(new ProductDTO(productID, productName, quantity, price, description, imageUrl, categoryID, importDate, usingDate));
                }
            }
        } catch (Exception e) {

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public int getTotalProducts() throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT COUNT([productID]) FROM [dbo].[tblProduct]";
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                while (rs.next()) {
                   return rs.getInt(1);
                }
            }
        } catch (Exception e) {

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return -1;
    }

}
