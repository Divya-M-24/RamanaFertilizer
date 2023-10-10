<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page import="DBConnect.dbconnect.*" %>
    <%@ page import="DBConnect.*" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/reports.css">
        <!-- <link rel="manifest" href="manifest.json">
        <script src="./js/regSW.js"></script> -->
    <title>Document</title>

</head>
<body>
<%
if(session.getAttribute("username")==null)
{
	response.sendRedirect("index.jsp");	
}	
%>
<%@include file="navbar.jsp" %>
<%! dbconnect reports = new dbconnect(); %>
<%
String from = request.getParameter("from");
String to = request.getParameter("to");
ResultSet pr = reports.productWise(from,to);
ResultSet cstr = reports.customerWise(from,to);
%>
  <center><label>From :<%=from %>  To :<%=to %>  </label> </center>
 
   <div class="container">
     <center><h3>Product-wise Transaction Details</center></h3>
    <table class="table table-striped">
        <thead>
          <tr>
            <th scope="col">Fertilizer</th>
            <th scope="col">Date</th>
            <th scope="col">Nos</th>
            <th scope="col">Price</th>
            <th scope="col">Total(Rs)</th>
          </tr>
        </thead>
        <tbody>

            <%
            double prTotal=0;
       
            
            while(pr.next()){
            	double sum=pr.getInt("qty")*pr.getFloat("sp");
            	prTotal+=sum;
            %>
          <tr>
            <td><%=pr.getString("fertilizer")%></td>
            <td><%=pr.getDate("s_date") %></td>
            <td><%=pr.getInt("qty")%></td>
            <td><%=pr.getFloat("sp")%></td>
            <td><%=Math.round(sum)%></td>
          </tr>
          <%} %>
          <tr>
          <th>TOTAL</th><th><%=Math.round(prTotal) %></th>
          </tr>
        </tbody>
        
      </table><br><br>

      <center><h3>Customer-wise Transaction Details</center></h3>
      <table class="table table-striped">
          <thead>
            <tr>
              <th scope="col">Transaction ID</th>
              <th scope="col">Customer Name</th>
              <th scope="col">Date</th>
              <th scope="col">Total(Rs)</th>
            </tr>
          </thead>
          <tbody>
          
          <%
          double ctotal=0;
          while(cstr.next()){ 
          ctotal+=cstr.getFloat("total");
          %>
            <tr>
              <td>RMNF<%=cstr.getInt("tid") %></td>
              <td><%=cstr.getString("c_name") %></td>
              <td><%=cstr.getDate("t_date") %></td>
              <td><%=cstr.getFloat("total") %><td>
              
            </tr>
            <%} %>
             <tr>
          <th>TOTAL</th><th><%=Math.round(ctotal) %></th>
          </tr>
          </tbody>
        </table>
        <center><button class="btn btn-success" onclick="Print()">Print</button></center>
   </div>
   <script>
     function Print()
     {
       window.print();
     }
   </script>
</body>
</html>