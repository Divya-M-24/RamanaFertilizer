<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="DBConnect.dbconnect.*" %>
<%@ page import="java.sql.*" %>
    <%@ page import="DBConnect.*" %>
<!DOCTYPE html>
<!-- Designined by CodingLab | www.youtube.com/codinglabyt -->
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <!--<title> Responsiive Admin Dashboard | CodingLab </title>-->
    <link rel="stylesheet" href="./css/home.css">
    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- <link rel="manifest" href="manifest.json">
        <script src="./js/regSW.js"></script> -->
   </head>
<body>
<%
if(session.getAttribute("username")==null)
{
	response.sendRedirect("index.jsp");	
}	
%>
<%! dbconnect dashboard = new dbconnect(); %>
<%
ResultSet rsd = dashboard.recentSales();
ResultSet rsc = dashboard.recentSales();
ResultSet rsa = dashboard.recentSales();
ResultSet tp = dashboard.topItems();
// rsd.next();
// rsc.next();
// rsa.next();
%>
<%@include file="navbar.jsp" %>
  <div class="sidebar">	
    <div class="logo-details">
      <a  href="navbar.jsp" class="logo"><img src=""></a>
    </div>
      <ul class="nav-links">
       <!--   <li>
          <a href="navbar.jsp" class="active">
            <i class='bx bx-home' ></i>
            <span class="links_name">Home</span>
          </a>
        </li>-->
        <li>
          <a href="home.jsp" class="active">
            <i class='bx bx-grid-alt' ></i>
            <span class="links_name">Dashboard</span>
          </a>
        </li>
        <li>
          <a href="stock.jsp">
            <i class='bx bx-box' ></i>
            <span class="links_name">Product</span>
          </a>
        </li>
        <li>
          <a href="stock.jsp">
            <i class='bx bx-coin-stack' ></i>
            <span class="links_name">Stock</span>
          </a>
        </li>
        <li>

        <li class="log_out">
          <a href="Logout">
            <i class='bx bx-log-out'></i>
            <span class="links_name">Log out</span>
          </a>
        </li>
      </ul>
  </div>
  <section class="home-section">
    <nav>
      <div class="sidebar-button">
        <i class='bx bx-menu sidebarBtn'></i>
        <span class="dashboard">Dashboard</span>
      </div>
      <div class="search-box">
        <p class="heading">RAMANA FERTILIZERS</p>
      </div>
      <div class="profile-details">
        <img src="images/profile.jpg" alt="">
        <span class="admin_name"></span>
        <i class='bx bx-chevron-down' ></i>
      </div> 
    </nav>

    <div class="home-content">
      <div class="overview-boxes">
        <div class="box">
          <div class="right-side">
            <div class="number"><a href="BIll.jsp">BILLING</a></div>
          </div>
        </div>
        <div class="box">
          <div class="right-side">
            <div class="number"><a href="addStock.jsp">ADD STOCK</a></div>
          </div>
        </div>
        <div class="box">
          <div class="right-side">
            <div class="number"><a href="generateReports.jsp">REPORTS</a></div>
          </div>
        </div>
      </div>

      <div class="sales-boxes">
        <div class="recent-sales box">
          <div class="title">Recent Sales</div>
          <div class="sales-details">
            <ul class="details">
              <li class="topic">Date</li>
              <%
              while(rsd.next())
              {%>
              <li><%= rsd.getDate("t_date")%></li>
              <%} %>            
              
            </ul>
            <ul class="details">
            <li class="topic">Customer</li>
             <%
              while(rsc.next())
              {%>
              <li><%= rsc.getString("c_name")%></li>
              <%} %> 
          </ul>
          <ul class="details">
            <li class="topic">Total</li>
             <%
              while(rsa.next())
              {%>
              <li><%= rsa.getFloat("total")%></li>
              <%} %> 
          </ul>
          </div>
          <!--  <div class="button">
            <a href="#">See All</a>
          </div>-->
        </div>
        <div class="top-sales box">
          <div class="title">Top Seling Product</div>
          <ul class="top-sales-details">
          <li>
              <span class="product"><b>Fertilizer<b></span>
            <span class="price"><b>Nos</b></span>
          </li>
          <%while(tp.next()){ %>
            <li>
              <span class="product"><%=tp.getString("fertilizer") %></span>
            <span class="price"><%=tp.getInt("Quantity") %></span>
          </li>
          <%} %>
          </ul>
        </div>
      </div>
    </div>
  </section>

  <script>
   let sidebar = document.querySelector(".sidebar");
let sidebarBtn = document.querySelector(".sidebarBtn");
sidebarBtn.onclick = function() {
  sidebar.classList.toggle("active");
  if(sidebar.classList.contains("active")){
  sidebarBtn.classList.replace("bx-menu" ,"bx-menu-alt-right");
}else
  sidebarBtn.classList.replace("bx-menu-alt-right", "bx-menu");
}
 </script>

</body>
</html>

