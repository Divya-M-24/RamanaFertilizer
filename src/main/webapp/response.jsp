<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Cookie cookie[] = request.getCookies();
System.out.println(cookie[1]);
String resp = cookie[0].getValue().toString();
%>
<input type="hidden" id="resp" value="<%=resp%>">
<script>
let message = document.getElementById("resp").value;
window.alert(message);
</script>
<%@include file="index.jsp" %>
</body>
</html>