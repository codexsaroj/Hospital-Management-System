package com.servlet;

import com.conn.DbConnect;
import com.dao.SpecialistDao;
import com.entity.Specialist;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/specialist")
public class SpecialistServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // retrieving the values of Specialist params
        String specialistName = req.getParameter("specialistName");

        // instantiating the obj for SpecialistDao
        SpecialistDao sd = new SpecialistDao(DbConnect.getConnection());

        // adding the specialistDetails into db
        boolean flag = sd.addSpecialist(specialistName);
        // setting up a session
        HttpSession session = req.getSession();
        if(flag){
            session.setAttribute("specialistObj", new Specialist());
            session.setAttribute("suc_msg", "Specialist added successfully!!");
            resp.sendRedirect("admin/adminDashboard.jsp");
        }
        else{
            session.setAttribute("msg", "Something went wrong!!");
            resp.sendRedirect("admin/adminDashboard.jsp");
        }

    }
}
