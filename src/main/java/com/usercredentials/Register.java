package com.usercredentials;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DBConnect.*;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String usernmae = request.getParameter("username_new");
		String email = request.getParameter("email");
		String license = request.getParameter("license").toUpperCase();
		String password = request.getParameter("password_new");
		dbconnect db = new dbconnect();
		try {
			db.Register(usernmae, email, license, password);
			response.sendRedirect("index.jsp");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}


}
