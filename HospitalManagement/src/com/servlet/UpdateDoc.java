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


@WebServlet("/updateDoc")
public class UpdateDoc extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // retrieving the id value
        String id = req.getParameter("id");
        String name = req.getParameter("docname");
        String dob = req.getParameter("dob");
        String qualification = req.getParameter("qualification");
        String specialization = req.getParameter("specialization");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String phone = req.getParameter("phone");
        String gender = req.getParameter("gender");

        try {
            // instantiating the object for doctor
            Doctor doctor = new Doctor(id, name, dob, qualification, specialization, email, password, phone, gender);
            // instantiating the DoctorDao obj
            DoctorDao dao = new DoctorDao(DbConnect.getConnection());
            // calling the update method
            boolean flag = dao.updateDoc(doctor);
            HttpSession session = req.getSession();
            if(flag){
                session.setAttribute("success_msg","Doctor details updated successfully!!");
                resp.sendRedirect("admin/viewDoctor.jsp");
            }
            else{
                session.setAttribute("fail_msg","Could not update doctor details, please try again!!");
                resp.sendRedirect("admin/updateDoc.jsp");
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
