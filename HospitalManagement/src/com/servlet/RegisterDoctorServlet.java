package com.servlet;

import com.conn.DbConnect;

import com.dao.DoctorDao;
import com.entity.Doctor;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


@WebServlet("/addDoctor")
public class RegisterDoctorServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // retrieving the values from the form
        String id = req.getParameter("id");
        String name = req.getParameter("docname");
        String dob = req.getParameter("dob");
        String qualification = req.getParameter("qualification");
        String specialization = req.getParameter("specialization");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String gender = req.getParameter("gender");
        String phone = req.getParameter("phone");

        // instantiating the doctor object
        Doctor doc = new Doctor(id,name,dob, qualification, specialization, email, password, phone, gender);
        // instantiating the dao obj to create connection with db
        DoctorDao docDao = new DoctorDao(DbConnect.getConnection());
        // registering the doctor
        boolean flag = docDao.addDoctor(doc);
        // setting up a session
        HttpSession session = req.getSession();
        if(flag){
            session.setAttribute("suc_msg", "Doctor registered successfully!!");
            resp.sendRedirect("admin/doctorDashboard.jsp");
        }
        else{
            session.setAttribute("failure_msg", "Registration failed!!");
            resp.sendRedirect("admin/doctorDashboard.jsp");
        }
    }
}
