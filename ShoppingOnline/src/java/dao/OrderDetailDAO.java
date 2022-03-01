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
import java.sql.Statement;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.OrderDetail;

/**
 *
 * @author Thiep Ngo
 */
public class OrderDetailDAO {

    public void saveCart(int orderID, Map<Integer, Cart> carts) {
        try {

            String sql = "INSERT INTO [dbo].[OrderDetail]\n"
                    + "           ([order_id]\n"
                    + "           ,[productName]\n"
                    + "           ,[productImage]\n"
                    + "           ,[productPrice]\n"
                    + "           ,[quantity])\n"
                    + "     VALUES\n"
                    + "          (?,?,?,?,?)";
            Connection conn = new DBUtils().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, orderID);
            for (Map.Entry<Integer, Cart> entry : carts.entrySet()) {
                Integer productID = entry.getKey();
                Cart cart = entry.getValue();
                ps.setString(2, cart.getProduct().getProductName());
                ps.setString(3, cart.getProduct().getImageUrl());
                ps.setDouble(4, cart.getProduct().getPrice());
                ps.setInt(5, cart.getQuantity());
                ps.executeUpdate();
            }

        } catch (Exception ex) {
            Logger.getLogger(ShippingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
