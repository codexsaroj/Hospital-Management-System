package com.admin.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/adminLogout")
public class AdminLogout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // invalidating the ongoing session
        HttpSession session = req.getSession();
        session.removeAttribute("adminObj");
        // setting up the session for logout msg
        session.setAttribute("msg", "You have successfully logged out!!");
        resp.sendRedirect("admin_login.jsp");
    }
}
