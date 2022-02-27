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
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modal.Classes;
import modal.Student;

/**
 *
 * @author Thiep Ngo
 */
public class classDAO {

    public List<Classes> getAllClasses() {
       List<Classes> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM CLASS";
            Connection conn = new DBUtils().getConnectionn();

            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Classes classes = new Classes(rs.getInt(1), rs.getString(2));
                list.add(classes);
            }
        } catch (Exception ex) {
            Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
}
