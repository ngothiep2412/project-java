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
import modal.Student;

/**
 *
 * @author Thiep Ngo
 */
public class StudentDAO {

    public List<Student> getAllStudents() {
        List<Student> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM STUDENT INNER JOIN CLASS ON STUDENT.classID = CLass.classID ";
            Connection conn = new DBUtils().getConnectionn();

            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Student student = new Student(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDouble(4), rs.getInt(5), rs.getString(7));
                list.add(student);
            }
        } catch (Exception ex) {
            Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void create(Student student) {
        try {
            String sql = "INSERT INTO [dbo].[Student]\n"
                    + "           ([name]\n"
                    + "           ,[age]\n"
                    + "           ,[mark]\n"
                    + "           ,[classid])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?)";
            Connection conn = new DBUtils().getConnectionn();

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, student.getName());
            ps.setInt(2, student.getAge());
            ps.setDouble(3, student.getMark());
            ps.setInt(4, student.getClassID());
            ps.executeUpdate();

        } catch (Exception ex) {
            Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void delete(int id) {
        try {
            String sql = "DELETE FROM [dbo].[Student]\n"
                    + "      WHERE id = ?";
            Connection conn = new DBUtils().getConnectionn();

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            ps.executeUpdate();

        } catch (Exception ex) {
            Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Student getStudentByID(int id) {

        try {
            String sql = "SELECT * FROM STUDENT INNER JOIN CLASS ON STUDENT.classID = CLass.classID WHERE ID = ?";
            Connection conn = new DBUtils().getConnectionn();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Student student = new Student(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDouble(4), rs.getInt(5), rs.getString(7));
                return student;
            }
        } catch (Exception ex) {
            Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void update(Student student) {
        try {
            String sql = "UPDATE [dbo].[Student]\n"
                    + "   SET [name] = ?\n"
                    + "      ,[age] =  ?\n"
                    + "      ,[mark] =  ?\n"
                    + "      ,[classid] =  ?\n"
                    + " WHERE id = ?";
            Connection conn = new DBUtils().getConnectionn();

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, student.getName());
            ps.setInt(2, student.getAge());
            ps.setDouble(3, student.getMark());
            ps.setInt(4, student.getClassID());
            ps.setInt(5, student.getId());
            ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
