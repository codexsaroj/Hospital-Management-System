package com.servlet;

import com.conn.DbConnect;
import com.dao.UserDao;
import com.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/userLogin")
public class UserLogin extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // retrieving the values
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        // Creating the connection with database
        UserDao userDao = new UserDao(DbConnect.getConnection());
        // authorization of the user
        User user = userDao.login(email, password);
        // setting up a session
        HttpSession session = req.getSession();
        if (user != null){
            session.setAttribute("userObj", user);
            session.setAttribute("success_msg", "User logged in successfully!!");
            resp.sendRedirect("user_profile.jsp");
        }
        else{
            session.setAttribute("failure_msg", "User login failed!!");
            resp.sendRedirect("user_login.jsp");
        }




    }
}
