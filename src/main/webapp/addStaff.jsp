<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <title>Add Employee</title>
    <link rel="stylesheet" href="css/addStaff.css">
 
</head>
<body>
<%
if(session.getAttribute("username")==null)
{
	response.sendRedirect("index.jsp");	
}	
%>

<%@include file="navbar.jsp" %>
    <form action="RegisterEmployee">
    <div class="container">
        <h1><center>ADD NEW EMPLOYEE</center></h1>
        <div class="lines head">
            <h3>PERSONAL DETAILS</h3>
        </div>
        <div class="lines split">
            <input type="text" class="form-control" placeholder="First Name" name="fname" required/>
            <input type="text" class="form-control" placeholder="Last Name" name="lname" required/>
        </div>

        <div class="lines split">
            <label>Date of Birth:</label>
        </div>

        <div class="lines split">
            <input type="date" class="form-control"  name="dob" placeholder="Date of Birth"  required/>
            <input type="number" class="form-control" placeholder="Phone number" name="phone"  required/>
        </div>
        <div class="lines split">
            <select name="gender"  id="gender"  class="form-control" required>
                 <option selected="selected" value="0">--Select Gender--</option>
                        <option  value ="male">Male</option>
                        <option  value ="female">Female</option>
                        <option  value ="other">Other</option>
            </select>
            <textarea name="address" placeholder="Address" class="form-control" rows="4"  required></textarea>
        </div>
    </div>

    <div class="container">
        <div class="lines head">
            <h3>BANK AND OTHER DETAILS</h3>
        </div>
        <div class="lines split">
            <input type="text" class="form-control" placeholder="Bank Name" name="bank" required/>
            <input type="text" class="form-control" placeholder="Branch" name="branch" required/>
        </div>
        <div class="lines split">
            <input type="text" class="form-control" placeholder="IFSC" name="ifsc" required/>
            <input type="text" class="form-control" placeholder="Account Number" name="ac_number" required/>
        </div>

        <div class="lines split">
            <input type="text" class="form-control" placeholder="PAN" name="pan" required/>
            <input type="text" class="form-control" placeholder="Aadhar Number" name="aadhar" required/>
        </div>

        <div class="lines split">
            <label>Role:</label>
        </div>
        <div class="lines split">
           <select name="role"  class="form-control" required>
                <!-- <option selected="selected" value="0">--Select Role--</option> -->
                        <option  value ="male">Helper</option>
                        <option  value ="female">Clerk</option>
                        <option  value ="other">Other</option>
            </select>
        </div>

        <div class="lines">
            <button type="submit" class="btn btn-success">Submit</button>
        </div>
    </div>
</form>
</body>
</html>

