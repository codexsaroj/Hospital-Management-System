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


@WebServlet("/updateAppointment")
public class updateAppointmentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // retrieving the values
        int appointmentId = Integer.parseInt(req.getParameter("appointmentId"));
//        System.out.println(appointmentId);
//
        int userId = Integer.parseInt(req.getParameter("userId"));
//        System.out.println(userId);

        String fName = req.getParameter("fName");
//        System.out.println(fName);

        int age = Integer.parseInt(req.getParameter("age"));
//        System.out.println(age);

        String appointDate = req.getParameter("appointDate");
//        System.out.println(appointDate);

        String email = req.getParameter("email");
//        System.out.println(email);

        String phone = (req.getParameter("phone"));
//        System.out.println(phone);

        String disease = req.getParameter("disease");
//        System.out.println(disease);

        String doctorId = req.getParameter("doctorId");
//        System.out.println(doctorId);

        String gender = req.getParameter("gender");
//        System.out.println(gender);

        String address = req.getParameter("address");
//        System.out.println(address);

        String status = req.getParameter("status");
//        System.out.println(status);


        Appointment app = new Appointment(appointmentId, userId, fName, age, appointDate, email ,phone, disease, doctorId, address,gender, status);
        System.out.println(app.toString());
        AppointmentDao dao = new AppointmentDao(DbConnect.getConnection());

        boolean flag = dao.updateAppointmentById(app);
        HttpSession session = req.getSession();
        if (flag) {
            session.setAttribute("success_msg", "Appointment updated successfully");
            resp.sendRedirect("doctor/patient.jsp");
        }
        else{
            session.setAttribute("failure_msg", "Appointment update failed");
            resp.sendRedirect("doctor/patient.jsp");
        }
    }
}
