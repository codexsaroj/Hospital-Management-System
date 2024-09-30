package com.doctor_authorization_servlet;

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

@WebServlet("/docLogin")
public class DoctorLogin extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // retrieving the login details
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        DoctorDao dao = new DoctorDao(DbConnect.getConnection());

        Doctor doctor = dao.login(email, password);

        HttpSession session = req.getSession();

        if (doctor != null) {
            session.setAttribute("suc_msg", "Login Successful!!");
            session.setAttribute("docObj", doctor);
            resp.sendRedirect("doctor/home.jsp");
        }
        else{
            session.setAttribute("fail_msg", "Invalid email or password!!");
            resp.sendRedirect("doctor_login.jsp");
        }
    }
}
