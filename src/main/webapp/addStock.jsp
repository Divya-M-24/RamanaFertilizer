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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="./css/addStock.css">
         <link rel="manifest" href="manifest.json">
        
    <title>Add Stock</title>
</head>
<body id="bdy">
<%
if(session.getAttribute("username")==null)
{
	response.sendRedirect("index.jsp");	
}	
%>
<%@include file="navbar.jsp" %><br>
<div class="container">
        <h1>ADD STOCK</h1>
        <form action="dataToDB.jsp">
            <select name="fname"  id="itemName" tabindex="1" class="form-control" onchange="getPrice()" required>
                <option selected="selected">--Select--</option>
                
                 <%!dbconnect db = new dbconnect();%>
                    <%
				        ResultSet rs = db.getFertilizers();
				        //rs.next();
				        while(rs.next())
				        {%>
				        	<option  value = "<%=rs.getString("name")%> <%=rs.getFloat("price")%> <%=rs.getString("company")%>" label="<%=rs.getString("name")%>"><%=rs.getString("name")%></option>
				        	
				      <%}%>
            </select>
    
            <input type = "text" placeholder="Company/Manufacturer" name="Company" class="form-control" id="Company" disabled>
    
            <input type = "number" step="0.01" placeholder="Price(Rs)" name="Price" class="form-control" id="Price" required> 
    
            <input type = "number" placeholder="Qty(Kg/Litre)" name="Qty" class="form-control"  id="qty" onchange="checkQty()" required> 
    
           <button type = "submit" class="btn btn-outline-success" onclick="alertMessage()">Add Stock</button>
        </form> 
        <div><a href="newItem.jsp">New Item?</a></div>

    </div>
    
    <script src="/regSW.js"></script>
    <script>
    //document.getElementById("Price").value= "hello";
    function getPrice()
    {
    	let sel = document.getElementById("itemName");
    	let price = sel.value;
    	let p = parseFloat(price.split(" ",3)[1]);
    	document.getElementById("Price").value= p.toFixed(2);
    	document.getElementById("Company").value= price.split(" ",3)[2];
    	
    }
    function checkQty()
    {
    	qty = parseInt(document.getElementById("qty").value)
    	if(qty<=0)
    		{
    		window.alert("Invalid Quantity..!");
    		document.getElementById("qty").value="";    		
    		}
    }
    
    
	let priceCheck = document.getElementById("Price");
	priceCheck.addEventListener('change',()=>{
		let val = parseFloat(priceCheck.value);
		if(val<=0)
			{
			 window.alert("Invalid price...!");
			 priceCheck.value="";
			}
			
	})

    </script>
</body>
</html>