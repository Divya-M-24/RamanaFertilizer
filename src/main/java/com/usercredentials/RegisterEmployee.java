package com.usercredentials;

import java.io.IOException;
import java.sql.SQLException;

import DBConnect.dbconnect;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterEmployee
 */
@WebServlet("/RegisterEmployee")
public class RegisterEmployee extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String emp_name = request.getParameter("fname")+" " + request.getParameter("lname");
		String gender = request.getParameter("gender");
		String dob = request.getParameter("dob");
//		System.out.println(dob);
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String bank = request.getParameter("bank");
		String branch = request.getParameter("branch");
		String ifsc = request.getParameter("ifsc");
		String ac_number = request.getParameter("ac_number");
		String pan = request.getParameter("pan");
		String aadhar = request.getParameter("aadhar");
		String role = request.getParameter("role");
		
		dbconnect db = new dbconnect();
		
		try {
			db.RegisterEmployee(emp_name, gender, dob, phone, address, bank, branch, ifsc, ac_number, pan, aadhar, role);
			response.sendRedirect("addStaff.jsp");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
	}

}
