<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="./css/newItem.css">
        <!-- <link rel="manifest" href="manifest.json">
        <script src="./js/regSW.js"></script> -->
    <title>Add to Stock</title>
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
        <h1>ADD NEW STOCK</h1>
        <form action="dataToDB.jsp">
            <input type = "text" placeholder="Fertilizer Name" name="fname" class="form-control" required>
    
            <input type = "text" placeholder="Company/Manufacturer" name="Company" class="form-control" required>
    
            <input type = "number" step="0.01" placeholder="Price(Rs)" name="Price" class="form-control" required> 
    
            <input type = "number" placeholder="Qty(Kg/Litre)" name="Qty" class="form-control"  id="qty" onchange="checkQty()"> 
    
            <button type = "submit" class="btn btn-outline-success" onclick="alertMessage()">Add Stock</button> 
        </form> 
    </div>
    
    <script>
    function checkQty()
    {
    	qty = parseInt(document.getElementById("qty").value)
    	if(qty<=0)
    		{
    		window.alert("Invalid Quantity..!");
    		document.getElementById("qty").value="";    		
    		}
    }
    
    function alertMessage()
    {
    	window.alert("Stock added successfully..!");
    }
    </script>
</body>
</html>