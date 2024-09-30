package com.conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnect{
    private static Connection conn = null;

    // method for retrieving the connection
    public static Connection getConnection(){
        try {
            //loading the driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            // creating the connection
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hospital", "root", "Crockroz434");

            return conn;
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}