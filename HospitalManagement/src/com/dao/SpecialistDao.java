package com.dao;

import com.entity.Specialist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SpecialistDao {
    private Connection conn = null;
    private String ADD_SPECIALIST = "insert into specialist(specialistname) values(?)";
    private String SELECT_ALL_SPECIALIST = "select * from specialist";


    public SpecialistDao(Connection conn){
        this.conn = conn;
    }

    // method to add the specialist to the database
    public boolean addSpecialist(String specialistname) {
        boolean flag = false;

        try {
            // preparing the statement
            PreparedStatement ps = conn.prepareStatement(ADD_SPECIALIST);
            // setting up the values
            ps.setString(1, specialistname);
            // executing the query
            ps.executeUpdate();
            flag = true;
            return flag;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public List<Specialist> getAllSpecialist() {
        List<Specialist> specialists = new ArrayList<>();
        try {
            // preparing the statement
            PreparedStatement ps = conn.prepareStatement(SELECT_ALL_SPECIALIST);
            // executing the sql query
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Specialist sp = new Specialist();
                sp.setId(rs.getInt("id"));
                sp.setSpecialistName(rs.getString("specialistname"));
                specialists.add(sp);
            }
            return specialists;
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int countSpecialists() {
        int count = 0;
        // preparing the statement
        try {
            PreparedStatement ps = conn.prepareStatement(SELECT_ALL_SPECIALIST);
            // executing the query
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                count++;
            }
            return count;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
