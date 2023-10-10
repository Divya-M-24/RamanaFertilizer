<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="DBConnect.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%! dbconnect stock = new dbconnect(); %>
<%
String sel = request.getParameter("fname");
String[] fnp = sel.split(" ",3);

String comp = request.getParameter("Company");
double price = Double.parseDouble(request.getParameter("Price"));
int qty = Integer.parseInt(request.getParameter("Qty"));
stock.addStock(fnp[0], comp, price, qty);
%>

<%@ include file="addStock.jsp" %>
</body>
</html>