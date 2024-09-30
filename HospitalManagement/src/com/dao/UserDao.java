package com.dao;

import com.entity.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {

    private static String INSERT_SQL_USER = "insert into userdetails(name, email, password) values(?,?,?)";

    private Connection conn;

    public UserDao(Connection conn){
        this.conn = conn;
    }

    public boolean addUser(User user) throws SQLException {
        boolean flag = false;
        // let's prepare the statement
        try {
            PreparedStatement ps = conn.prepareStatement(INSERT_SQL_USER);
            // setting the values
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            // executing the query
            ps.executeUpdate();
            flag = true;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return flag;
    }

    public User login(String email, String password){
        User user = null;
        try {
            // extracting data from db
            String query = "select * from userdetails where email = ? and password = ?";
            // preparing the statement
            PreparedStatement ps = conn.prepareStatement(query);
            // setting up the params
            ps.setString(1, email);
            ps.setString(2, password);
            // executing the query
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                user = new User();
                user.setId(rs.getByte("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
            }
            return user;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public int countUsers() {
        int count = 0;
        // preparing the statement
        String COUNT_QUERY = "SELECT * FROM userdetails";
        try {
            PreparedStatement ps = conn.prepareStatement(COUNT_QUERY);
            // executing the query
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                count++;
            }
            return count;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public boolean checkPassword(int userId, String oldPassword){
        boolean flag = false;
        String query = "select * from userdetails where id = ? and password = ?";
        // preparing the stmnt
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            ps.setString(2, oldPassword);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                flag = true;
            }
            return flag;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public boolean changePassword(int userId, String newPassword){
        boolean flag = false;
        String query = "UPDATE userdetails SET password = ? where id = ?";
        // preparing the stmnt
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, newPassword);
            ps.setInt(2,  userId);
            int rowUpdated = ps.executeUpdate();
            flag = (rowUpdated == 1);
            return flag;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


}
