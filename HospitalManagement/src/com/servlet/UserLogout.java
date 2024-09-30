package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/userLogout")
public class UserLogout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // invalidating the ongoing session
        HttpSession session = req.getSession();
        session.removeAttribute("userObj");
        // setting up the session for logout msg
        session.setAttribute("success_msg", "User logged out successfully!!");
        resp.sendRedirect("user_login.jsp");
    }
}
