/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Thiep Ngo
 */
public class DBUtils {

    public static Connection getConnectionn() throws SQLException, ClassNotFoundException {
        Connection conn = null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = "jdbc:sqlserver://localhost:1433;dataBaseName=PRJ321_DB";
        conn = DriverManager.getConnection(url, "sa", "thieppro123");
        return conn;
    }

}
