package com.usercredentials;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DBConnect.dbconnect;

/**
 * Servlet implementation class FetchStaffDetails
 */
@WebServlet("/FetchStaffDetails")
public class FetchStaffDetails extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String emp_id = request.getParameter("emp_id");
		dbconnect db = new dbconnect();
//		Cookie emp_name = null;
//		Cookie gender = null;
//		Cookie dob = null;
//		Cookie phone =null;
//		Cookie address = null;
//		Cookie bank = null;
//		Cookie branch = null;
//		Cookie ifsc =null;
//		Cookie ac_number =null;
//		Cookie pan=null;
//		Cookie aadhar=null;
//		Cookie role=null;
		ResultSet rs=null;
		try {
			rs = db.getStaffInfo(emp_id);
			rs.next();

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			Cookie emp_name = new Cookie("emp_name",rs.getString("emp_name"));
			Cookie gender = new Cookie("gender",rs.getString("gender"));
			Cookie dob = new Cookie("dob",rs.getString("date_of_birth"));
			Cookie phone = new Cookie("phone",rs.getString("phone_number"));
			Cookie address = new Cookie("address",rs.getString("address"));
			Cookie bank = new Cookie("bank",rs.getString("bank"));
			Cookie branch = new Cookie("branch",rs.getString("branch"));
			Cookie ifsc = new Cookie("ifsc",rs.getString("ifsc"));
			Cookie ac_number = new Cookie("result",rs.getString("account_number"));
			Cookie pan = new Cookie("pan",rs.getString("pan_number"));
			Cookie aadhar = new Cookie("aadhar",rs.getString("aadhar_number"));
			Cookie role = new Cookie("role",rs.getString("role"));
			response.addCookie(emp_name);
			response.addCookie(gender);
			response.addCookie(dob);
			response.addCookie(phone);
			response.addCookie(address);
			response.addCookie(bank);
			response.addCookie(branch);
			response.addCookie(ifsc);
			response.addCookie(ac_number);
			response.addCookie(pan);
			response.addCookie(aadhar);
			response.addCookie(role);
//			response.sendRedirect("updateStaff.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
	}

}
