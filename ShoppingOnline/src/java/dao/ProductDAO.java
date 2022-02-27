/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;

/**
 *
 * @author Thiep Ngo
 */
public class ProductDAO {

    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM PRODUCT";
            Connection conn = new DBUtils().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = Product.builder()
                        .productID(rs.getInt(1))
                        .productName(rs.getString(2))
                        .quantity(rs.getInt(3))
                        .price(rs.getInt(4))
                        .description(rs.getString(5))
                        .imageUrl(rs.getString(6))
                        .createdDate(rs.getString(7))
                        .categoryID(rs.getInt(8)).build();
                list.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Product> getProductByCategoryID(int categoryID) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM PRODUCT WHERE CategoryID = ?";
            Connection conn = new DBUtils().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, categoryID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = Product.builder()
                        .productID(rs.getInt(1))
                        .productName(rs.getString(2))
                        .quantity(rs.getInt(3))
                        .price(rs.getInt(4))
                        .description(rs.getString(5))
                        .imageUrl(rs.getString(6))
                        .createdDate(rs.getString(7))
                        .categoryID(rs.getInt(8)).build();
                list.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

}
