package com.servlet;

import com.conn.DbConnect;
import com.dao.DoctorDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/changeDocPassword")
public class changeDocPassword extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // retrieving the values
        String oldPassword = req.getParameter("oldPassword");
        String newPassword = req.getParameter("newPassword");
        String id = (req.getParameter("docId"));

        DoctorDao dao = new DoctorDao(DbConnect.getConnection());
        HttpSession session = req.getSession();

        if(dao.checkPassword(id, oldPassword)){
            if(dao.changePassword(id, newPassword)){
                session.setAttribute("suc_msg", "Password Changed Successfully!!, Log In again");
                resp.sendRedirect("doctor_login.jsp");
            }
            else{
                session.setAttribute("fail_msg", "Password Change Failed!!");
                resp.sendRedirect("doctor/profile.jsp");
            }
        }
        else{
            session.setAttribute("fail_msg", "Old password didn't match!");
            resp.sendRedirect("doctor/profile.jsp");
        }
    }
}
