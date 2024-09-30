package com.dao;

import com.entity.Appointment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AppointmentDao {

    private Connection conn;
    private static String ADD_APPOINTMENT = "INSERT INTO appointment(userId, fName, age, appointDate, email, phone, disease,doctorId, address, gender, status) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
    private static String SELECT_ALL_APPOINT = "SELECT * FROM appointment";
    private static String SELECT_APPOINT_BY_USER_ID = "SELECT * FROM appointment where userId = ?";
    private String SELECT_ALL_PATIENT = "SELECT * FROM appointment WHERE doctorId = ?";
    private static String SELECT_APPOINT = "SELECT * FROM appointment where appointmentId = ?";
    private static String UPDATE_APPOINT = "UPDATE appointment SET userId=?, fName=?, age=?, appointDate=?, email=?, phone=?, disease=?,doctorId=?, address=?, gender=?, status=? WHERE appointmentId = ?";


    public AppointmentDao(Connection conn) {
        this.conn = conn;
    }

    public boolean bookAppointment(Appointment appointment) {
        PreparedStatement ps = null;
        int rowUpdated = 0;
        boolean flag = false;
        try {
            // let's prepare the stmnt
            ps = conn.prepareStatement(ADD_APPOINTMENT);
            // setting up the values
            ps.setInt(1, appointment.getUserId());
            ps.setString(2, appointment.getfName());
            ps.setInt(3, appointment.getAge());
            ps.setString(4, appointment.getAppointDate());
            ps.setString(5, appointment.getEmail());
            ps.setString(6, appointment.getPhone());
            ps.setString(7, appointment.getDisease());
            ps.setString(8, appointment.getDoctorId());
            ps.setString(9, appointment.getAddress());
            ps.setString(10, appointment.getGender());
            ps.setString(11, appointment.getStatus());
            // executing the query
            rowUpdated = ps.executeUpdate();
            flag = ( rowUpdated > 0);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return flag;
    }


    public List<Appointment> displayAppointmentsByUserId(int userId) {
        List<Appointment> listappointments = new ArrayList<>();
        try {
            // preparing the prepared statement
            PreparedStatement ps = conn.prepareStatement(SELECT_APPOINT_BY_USER_ID);
            // setting up the value
            ps.setInt(1, userId);
            // executing the query
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Appointment app = new Appointment();
                app.setAppointmentId(rs.getInt("appointmentId"));
                app.setUserId(rs.getInt("userId"));
                app.setfName(rs.getString("fName"));
                app.setAge(rs.getInt("age"));
                app.setAppointDate(rs.getString("appointDate"));
                app.setEmail(rs.getString("email"));
                app.setPhone(rs.getString("phone"));
                app.setDisease(rs.getString("disease"));
                app.setDoctorId(rs.getString("doctorId"));
                app.setAddress(rs.getString("address"));
                app.setGender(rs.getString("gender"));
                app.setStatus(rs.getString("status"));
                // adding the appointment into the list
                listappointments.add(app);
            }
            return listappointments;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Appointment> displayAppointmentsByDocId(String docId) {
        List<Appointment> listAppointments = new ArrayList<>();
        try {
            // preparing the prepared statement
            PreparedStatement ps = conn.prepareStatement(SELECT_ALL_PATIENT);
            // setting up the value
            ps.setString(1, docId);
            // executing the query
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Appointment app = new Appointment();
                app.setAppointmentId(rs.getInt("appointmentId"));
                app.setUserId(rs.getInt("userId"));
                app.setfName(rs.getString("fName"));
                app.setAge(rs.getInt("age"));
                app.setAppointDate(rs.getString("appointDate"));
                app.setEmail(rs.getString("email"));
                app.setPhone(rs.getString("phone"));
                app.setDisease(rs.getString("disease"));
                app.setDoctorId(rs.getString("doctorId"));
                app.setAddress(rs.getString("address"));
                app.setGender(rs.getString("gender"));
                app.setStatus(rs.getString("status"));
                // adding the appointment into the list
                listAppointments.add(app);
            }
            return listAppointments;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }



    public Appointment displayAppointmentById(int appointmentId) {
        Appointment app = null;
        try {
            // preparing the prepared statement
            PreparedStatement ps = conn.prepareStatement(SELECT_APPOINT);
            // setting up the value
            ps.setInt(1, appointmentId);
            // executing the query
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                app = new Appointment();
                app.setAppointmentId(rs.getInt("appointmentId"));
                app.setUserId(rs.getInt("userId"));
                app.setfName(rs.getString("fName"));
                app.setAge(rs.getInt("age"));
                app.setAppointDate(rs.getString("appointDate"));
                app.setEmail(rs.getString("email"));
                app.setPhone(rs.getString("phone"));
                app.setDisease(rs.getString("disease"));
                app.setDoctorId(rs.getString("doctorId"));
                app.setAddress(rs.getString("address"));
                app.setGender(rs.getString("gender"));
                app.setStatus(rs.getString("status"));
            }
            return app;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }



    public boolean updateAppointmentById(Appointment app) {
        boolean flag = false;
        try {
            // preparing the prepared statement
            PreparedStatement ps = conn.prepareStatement(UPDATE_APPOINT);
            // setting up the value
            ps.setInt(1, app.getUserId());
            ps.setString(2, app.getfName());
            ps.setInt(3, app.getAge());
            ps.setString(4, app.getAppointDate());
            ps.setString(5, app.getEmail());
            ps.setString(6, app.getPhone());
            ps.setString(7, app.getDisease());
            ps.setString(8, app.getDoctorId());
            ps.setString(9, app.getAddress());
            ps.setString(10, app.getGender());
            ps.setString(11, app.getStatus());
            ps.setInt(12, app.getAppointmentId());
            // executing the query
            int rowUpdated = ps.executeUpdate();
            flag = ( rowUpdated > 0);
            return flag;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public List<Appointment> displayAllAppointments() {
        List<Appointment> listAppointments = new ArrayList<>();
        try {
            // preparing the prepared statement
            PreparedStatement ps = conn.prepareStatement(SELECT_ALL_APPOINT);
            // executing the query
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Appointment app = new Appointment();
                app.setUserId(rs.getInt("userId"));
                app.setfName(rs.getString("fName"));
                app.setAge(rs.getInt("age"));
                app.setAppointDate(rs.getString("appointDate"));
                app.setEmail(rs.getString("email"));
                app.setPhone(rs.getString("phone"));
                app.setDisease(rs.getString("disease"));
                app.setDoctorId(rs.getString("doctorId"));
                app.setAddress(rs.getString("address"));
                app.setGender(rs.getString("gender"));
                app.setStatus(rs.getString("status"));
                // adding the appointment into the list
                listAppointments.add(app);
            }
            return listAppointments;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int countAppointments() {
        int count = 0;
        // preparing the statement
        String COUNT_QUERY = "SELECT * FROM appointment";
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

    public int countAppointmentsByDocId(String docId) {
        int count = 0;
        // preparing the statement
        String COUNT_QUERY = "SELECT * FROM appointment WHERE doctorId = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(COUNT_QUERY);
            ps.setString(1, docId);
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

}
