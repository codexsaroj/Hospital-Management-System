package com.admin.servlet;

import com.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/adminLogin")
public class AdminLogin extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String uemail = req.getParameter("uemail");
            String password = req.getParameter("password");

            if((uemail.equals("admin@gmail.com") || uemail.equals("admin")) && password.equals("admin123")){
                // setting up the session object of the admin
                req.getSession().setAttribute("adminObj", new User());
                req.getSession().setAttribute("suc_msg", "Welcome back Admin 🫡" );
                resp.sendRedirect("admin/adminDashboard.jsp");
            }
            else{
                req.getSession().setAttribute("msg", "Admin login unsuccessful 😞" );
                resp.sendRedirect("admin_login.jsp");

            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
