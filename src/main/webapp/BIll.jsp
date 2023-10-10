<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBConnect.dbconnect.*" %>
<%@ page import="DBConnect.*" %>
<%@ page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generate Bill</title>
    <link rel="stylesheet" href="./css/bill.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
        <!-- <link rel="manifest" href="manifest.json">
        <script src="./js/regSW.js"></script> -->
</head>

<body id="bdy">
<%
if(session.getAttribute("username")==null)
{
	response.sendRedirect("index.jsp");	
}	
%>
<%@include file="navbar.jsp" %>
<div class="container">
<form action="sell.jsp">
    <h3>RAMANA FERTILEZERS</h3>
    <p>GSTIN : 29ANPPA3453P1ZF</p>
    <p>Phone : 9902985750</p>	
    <h3>Invoice</h3>
    <%
    long millis=System.currentTimeMillis();  
    // creating a new object of the class Date  
    java.sql.Date date = new java.sql.Date(millis);  
    %>
    <table>
        <tr>
            <td><input type="text" class="form-control" placeholder="Name of the customer" id="c_name" name="c_name" required="required">
            </td>
            <td id="date"><b>Date :</b><%=date%>
            </td>
        </tr>
    </table>
    <h3>Bill Details</h3>
    <table class="o-desc" id="tbody">
        <tr>
            <th class="desc">Item Name</th>
            <th class="desc">Price</th>
            <th class="desc">Quantity</th>
            <th class="desc">Total</th>
            <th class="desc"> Delete Item</th>
        </tr>
    </table>

    <table>
        <tr>
            <td class="item">    <div class="form-group">
               
                <select name="fname"  id="itemName" tabindex="1" class="form-control">
        <option selected="selected" value="0">--Select--</option>
        <%!dbconnect db = new dbconnect(); %>
        <%
        ResultSet rs = db.getFertilizers();
        //rs.next();
        while(rs.next())
        {
        	if(rs.getInt("qty")>0)
        	{%>
        	<option  value= "<%=rs.getFloat("price")%> <%=rs.getInt("qty")%>"><%=rs.getString("name")%></option>
        	
      		<%}
        }%>
       
        
        </select>
            </div></td>
            <td><input type="number" class="form-control" id="qty" placeholder="Enter Quantity" name="qty" ></td>
            <td class="btns"><input type="button" class=" btn btn-outline-primary" value="Add Item" onclick="addItem()"></td>
        </tr>
    </table>
    <div>
    <label>Total : </label><input type="text" id ="sumTotal" value=0 disabled name="amountTotal">
    </div>
    
    <div class="hide">
	    <input type="text" id="fertilizers" name = "fertilizers" class="totalvalues">
	    <input type="text" id="quantity" name = "quantity" class="totalvalues">
	    <input type="text" id="price" name = "price" class="totalvalues">
	</div>
<div class="final">
    <input type="submit" class="btn btn-outline-success" value="Submit" >
</div>

</form>
</div>
<input type="hidden" id="hiddenQty"/>
<script>
function addItem()
{
	let sel = document.getElementById("itemName");
	let value1 = sel
	let item = sel.options[sel.selectedIndex].text;
	let priceQty = sel.value.split(" ",2);
	let price = parseFloat(priceQty[0]);
	let qty = parseInt(priceQty[1]);
	let qtyIn = parseInt(document.getElementById("qty").value);

   if(qtyIn>qty || qtyIn<=0 || isNaN(qtyIn))
   {
		window.alert("Current stock is "+qty+"\nEnter Valid Quantity..!");
	}
   else
   {
		qty = qty - qtyIn;
		value1.options[value1.selectedIndex].value = price +" "+qty;
		price = price + (price*0.05);
		tbody = document.getElementById("tbody");
	    let total = price*qtyIn;
	    content = '<tr id="addItems"><td class="items">'+item+'</td><td class="price">'+price+'</td><td class="qnty">'+qtyIn+'</td><td class="desc">'+total.toFixed(2)+'</td><td class="desc"><input class= "btn btn-outline-danger" type="button" value="Delete" onclick="deleteItem()"></td></tr>';
	    tbody.innerHTML += content;
	    
	    document.getElementById("qty").value = null;
	    sel.selectedIndex=0;
	    
	    let sum =  parseFloat(document.getElementById("sumTotal").value);
   	sum += price*qtyIn;
    	document.getElementById("sumTotal").value = sum.toFixed(2);     	
	   	document.getElementById('fertilizers').value += item + " ";
    	document.getElementById('quantity').value += qtyIn + " ";
   	document.getElementById('price').value += price + " ";
		
	}
    
}
</script>
</body>
</html>