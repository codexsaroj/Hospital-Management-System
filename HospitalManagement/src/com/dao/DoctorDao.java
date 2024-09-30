package com.dao;

import com.conn.DbConnect;
import com.entity.Appointment;
import com.entity.Doctor;

import javax.print.Doc;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DoctorDao {
    private Connection conn = null;
    private String ADD_DOC = "INSERT INTO doctor VALUES(?,?,?,?,?,?,?,?,?)";
    private String UPDATE_DOC = "UPDATE doctor SET docname=?, dob=?, qualification=?,specialization=?, email=?, password=?, phone=?, gender=? WHERE id=?";
    private String SELECT_ALL_DOC = "SELECT * FROM doctor";
    private String SELECT_DOC_BY_ID = "SELECT * FROM doctor WHERE id = ?";
    private String DELETE_DOC = "DELETE FROM doctor WHERE id = ?";
    private String LOGIN_DOC = "SELECT * FROM doctor WHERE email = ? AND password = ?";


    public DoctorDao(Connection conn) {
        this.conn = DbConnect.getConnection();
    }

    public boolean addDoctor(Doctor doc) {
        boolean flag = false;
        try {
            // preparing the prepared statement
            PreparedStatement ps = conn.prepareStatement(ADD_DOC);
            // setting up the values
            ps.setString(1, doc.getId());
            ps.setString(2, doc.getDocname());
            ps.setString(3, doc.getDob());
            ps.setString(4, doc.getQualification());
            ps.setString(5, doc.getSpecialization());
            ps.setString(6, doc.getEmail());
            ps.setString(7, doc.getPassword());
            ps.setString(8, doc.getPhone());
            ps.setString(9, doc.getGender());
            // executing the query
            ps.executeUpdate();
            flag = true;
            return flag;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }


    public List<Doctor> displayAllDoctors() {
        List<Doctor> listDoctors = new ArrayList<>();
        try {
            // preparing the prepared statement
            PreparedStatement ps = conn.prepareStatement(SELECT_ALL_DOC);
            // executing the query
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Doctor doctor = new Doctor();
                doctor.setId(rs.getString("id"));
                doctor.setDocname(rs.getString("docname"));
                doctor.setDob(rs.getString("dob"));
                doctor.setQualification(rs.getString("qualification"));
                doctor.setSpecialization(rs.getString("specialization"));
                doctor.setEmail(rs.getString("email"));
                doctor.setPassword(rs.getString("password"));
                doctor.setPhone(rs.getString("phone"));
                doctor.setGender(rs.getString("gender"));
                // adding the doctor into the list
                listDoctors.add(doctor);
            }
            return listDoctors;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public Doctor displayDoctorById(String id) {
        Doctor doctor = null;
        try {
            // preparing the prepared statement
            PreparedStatement ps = conn.prepareStatement(SELECT_DOC_BY_ID);
            // setting up the id value
            ps.setString(1, id);
            // executing the query
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                doctor = new Doctor();
                doctor.setId(rs.getString("id"));
                doctor.setDocname(rs.getString("docname"));
                doctor.setDob(rs.getString("dob"));
                doctor.setQualification(rs.getString("qualification"));
                doctor.setSpecialization(rs.getString("specialization"));
                doctor.setEmail(rs.getString("email"));
                doctor.setPassword(rs.getString("password"));
                doctor.setPhone(rs.getString("phone"));
                doctor.setGender(rs.getString("gender"));
            }
            return doctor;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public boolean updateDoc(Doctor doc) {
       boolean flag = false;
       int rowUpdated = 0;
        try {
            // preparing the stmnt
            PreparedStatement ps = conn.prepareStatement(UPDATE_DOC);
            // setting up the values
            ps.setString(1, doc.getDocname());
            ps.setString(2, doc.getDob());
            ps.setString(3, doc.getQualification());
            ps.setString(4, doc.getSpecialization());
            ps.setString(5, doc.getEmail());
            ps.setString(6, doc.getPassword());
            ps.setString(7, doc.getPhone());
            ps.setString(8, doc.getGender());
            ps.setString(9, doc.getId());
            // executing the query
            rowUpdated = ps.executeUpdate();
            flag = ( rowUpdated > 0);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        return flag;
    }


    public boolean deleteDoctor(String id) {
        boolean flag = false;
        try {
            // preparing the prepared statement
            PreparedStatement ps = conn.prepareStatement(DELETE_DOC);
            // setting up the id value
            ps.setString(1, id);
            // executing the query
            ps.executeUpdate();
            flag = true;
            return flag;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Doctor login(String email, String password) {
        Doctor doctor = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            ps = conn.prepareStatement(LOGIN_DOC);
            // setting up the values
            ps.setString(1, email);
            ps.setString(2, password);
            // executing the query
            rs = ps.executeQuery();
            if(rs.next()){
                doctor = new Doctor();
                doctor.setId(rs.getString("id"));
                doctor.setDocname(rs.getString("docname"));
                doctor.setDob(rs.getString("dob"));
                doctor.setQualification(rs.getString("qualification"));
                doctor.setSpecialization(rs.getString("specialization"));
                doctor.setEmail(rs.getString("email"));
                doctor.setPassword(rs.getString("password"));
                doctor.setPhone(rs.getString("phone"));
                doctor.setGender(rs.getString("gender"));
            }
        }catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close(); // Consider not closing connection if it is managed externally
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return doctor;
    }


    public int countDoctors() {
        int count = 0;
        // preparing the statement
        String COUNT_QUERY = "SELECT * FROM Doctor";
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


    public boolean checkPassword(String docId, String oldPassword){
        boolean flag = false;
        String query = "select * from doctor where id = ? and password = ?";
        // preparing the stmnt
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, docId);
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

    public boolean changePassword(String docId, String newPassword){
        boolean flag = false;
        String query = "UPDATE doctor SET password = ? where id = ?";
        // preparing the stmnt
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, newPassword);
            ps.setString(2, docId);
            int rowUpdated = ps.executeUpdate();
            flag = (rowUpdated == 1);
            return flag;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}






