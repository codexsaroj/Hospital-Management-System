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
import java.sql.SQLException;

@WebServlet("/register")
public class Register extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		boolean flag = false;
		try {
			// retrieving the user details
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String password = req.getParameter("password");

			// instantiating the user
			User user = new User(name, email, password);
			int rowUpdated = 0;
			// adding the user into db
			UserDao dao = new UserDao(DbConnect.getConnection());
			flag = dao.addUser(user);

			HttpSession session = req.getSession();
			if(flag == true){
				session.setAttribute("success_msg", "User successfully registered!");
				resp.sendRedirect("user_login.jsp");
			}
			else{
				session.setAttribute("failure_msg", "User registration failed!");
				resp.sendRedirect("sign_up.jsp");
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
