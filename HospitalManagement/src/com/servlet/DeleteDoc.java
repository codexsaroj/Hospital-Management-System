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


@WebServlet("/deleteDoc")
public class DeleteDoc extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // retrieving the id value
        String id = (req.getParameter("id"));
        System.out.println(id);
        // instantiating the DoctorDao obj
        DoctorDao dao = new DoctorDao(DbConnect.getConnection());
        // calling the delete method
        boolean flag = dao.deleteDoctor(id);
        HttpSession session = req.getSession();
        if(flag){
            session.setAttribute("success_msg", "Deletion Successful!!");
            resp.sendRedirect("admin/viewDoctor.jsp");
        }
        else{
            session.setAttribute("fail_msg", "Deletion Failed!!");
            resp.sendRedirect("admin/viewDoctor.jsp");
        }
    }
}
