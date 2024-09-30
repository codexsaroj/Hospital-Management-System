package com.servlet;

import com.conn.DbConnect;
import com.dao.AppointmentDao;
import com.entity.Appointment;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/bookAppointment")
public class AppointmentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // retrieving the details
        int userId = Integer.parseInt(req.getParameter("userId"));
        String fName = req.getParameter("fName");
        int age = Integer.parseInt(req.getParameter("age"));
        String appointDate = req.getParameter("appointDate");
        String email = req.getParameter("email");
        String phone = (req.getParameter("phone"));
        String disease = req.getParameter("disease");
        String doctorId = req.getParameter("doctorId");
        String gender = req.getParameter("gender");
        String address = req.getParameter("address");



        // instantiating the appointment object
        Appointment app = new Appointment(userId, fName, age, appointDate, email, phone, disease, doctorId, gender, address, "Pending");
        // instantiating the dao object
        AppointmentDao dao = new AppointmentDao(DbConnect.getConnection());
        // calling the method to bookAppointment
        boolean flag = dao.bookAppointment(app);
        HttpSession session = req.getSession();
        if( flag ){
            session.setAttribute("suc_msg", "Appointment Booked Successfully!!");
            resp.sendRedirect("userAppointment.jsp");
        }
        else{
            session.setAttribute("fail_msg", "Appointment booking failed!!");
            resp.sendRedirect("userAppointment.jsp");
        }
    }
}
