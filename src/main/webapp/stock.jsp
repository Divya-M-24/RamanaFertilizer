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
    <link rel="stylesheet" href="./css/stock.css">
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
<center><h1>STOCK DETAILS</h1></center>
   <div class="container">
    <table class="table table-striped">
        <thead>
          <tr>
            <th scope="col">Sl</th>
            <th scope="col">Fertilizer</th>
            <th scope="col">Company</th>
            <th scope="col">InStock</th>
          </tr>
        </thead>
        <tbody>
        <%! dbconnect stock = new dbconnect(); %>
        <%
        int sl =1;
        ResultSet rs = stock.getFertilizers();
        while(rs.next())
        {%>
          <tr>
            <th scope="row"><%=sl %></th>
            <td><%=rs.getString("name") %></td>
            <td><%=rs.getString("company") %></td>
            <td><%=rs.getInt("qty") %></td>
          </tr>
      <%
      	sl++;
      } %>
        </tbody>
      </table>
      <center><button class="btn btn-primary" onclick="Print()">Print</button></center>
   </div>
   <script>
   function Print()
   {
	   window.print();
   }
   </script>
</body>
</html>