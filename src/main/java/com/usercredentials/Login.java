package com.usercredentials;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DBConnect.dbconnect;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String username = request.getParameter("username_old");
		String password = request.getParameter("password_old");
		PrintWriter out = response.getWriter();
		ResultSet rs;
		response.setContentType("text/html");
		
		dbconnect db = new dbconnect();
		
		
		
		try {
			 rs = db.getAdmins();
			 while(rs.next()) 
			 {
				 if(username.equals(rs.getString("username")))
				 {
						if(username.equals(rs.getString("username")) && password.equals(rs.getString("password")))
						{
							session.setAttribute("username", username);
							session.setAttribute("password", password);
//							Cookie resp = new Cookie("resp","Login Successfull..");
//							response.addCookie(resp);
							response.sendRedirect("home.jsp");
						}
						else
						{
//							out.println("<script>window.alert('Invalid username and password');</script>");
							session.setAttribute("resp","Invalid Username and Password..");
							response.sendRedirect("index.jsp");
							break;
						}
				 }

			 }
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		

			
	}


}
