package com.servlet;

import com.conn.DbConnect;
import com.dao.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/changePassword")
public class changePasswordServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // retrieving the data
        String oldPassword = req.getParameter("oldPassword");
        String newPassword = req.getParameter("newPassword");
        int userId = Integer.parseInt(req.getParameter("userId"));

        // checking if the old password is correct or not
        UserDao dao = new UserDao(DbConnect.getConnection());
        HttpSession session = req.getSession();
        if(dao.checkPassword(userId, oldPassword)) {
            if(dao.changePassword(userId, newPassword)) {
                session.setAttribute("success_msg", "Password changed successfully!!");
                resp.sendRedirect("user_login.jsp");
            }
            else{
                session.setAttribute("fail_msg", "Oops!, something went wrong!!");
                resp.sendRedirect("changePassword.jsp");
            }
            dao.changePassword(userId, newPassword);
        }
        else{
            session.setAttribute("fail_msg", "Old password didn't match!!");
            resp.sendRedirect("changePassword.jsp");
        }
    }
}
