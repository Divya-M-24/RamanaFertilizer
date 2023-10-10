<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBConnect.*,java.sql.ResultSet" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script
      src="https://kit.fontawesome.com/64d58efce2.js"
      crossorigin="anonymous"
    ></script>
    <link rel="stylesheet" href="./css/style.css" />
    <title>Login</title>
        <!--  <link rel="manifest" href="manifest.json">
        <script src="./js/regSW.js"></script> -->
  </head>
  <body>
    <div class="container">
      <div class="forms-container">
        <div class="signin-signup">
          <form action="Login" class="sign-in-form">
            <h2 class="title">Sign in</h2>
            <div class="input-field">
              <i class="fas fa-user"></i>
              <input type="text" placeholder="Username" name="username_old" required/>
            </div>
            <div class="input-field">
              <i class="fas fa-lock"></i>
              <input type="password" placeholder="Password" name="password_old" id="password_old" required/>
            </div>
            <input type="submit" value="Login" class="btn solid" />
            <!-- <p class="social-text">Or Sign in with social platforms</p>
            <div class="social-media">
              <a href="#" class="social-icon">
                <i class="fab fa-facebook-f"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-twitter"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-google"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-linkedin-in"></i>
              </a>
            </div> -->
          </form>
          <form action="Register" class="sign-up-form">
            <h2 class="title">Register</h2>
            <div class="input-field">
              <i class="fas fa-user"></i>
              <input type="text" placeholder="Username" name="username_new" id="username_new" required/>
            </div>
            <div class="input-field">
              <i class="fas fa-envelope"></i>
              <input type="email" placeholder="Email" name="email" id="email"/>
            </div>

          <div class="input-field">
            <i class="fas fa-id-badge"></i>            
            <input type="text" placeholder="License" name="license" id="license" required/>
            </div>


            <div class="input-field">
              <i class="fas fa-lock"></i>
              <input type="password" placeholder="Password" name="password_new" id="password_new" required/>
            </div>
            
                <%
			    dbconnect db = new dbconnect();
			    ResultSet rs = db.getAdmins();
			    String users="";
			    String license="";
			    while(rs.next())
			    {
			    	users+= rs.getString("username") + " ";
			    	license += rs.getString("license") + " ";
			    }
			    %>
			    <input type="hidden" value="<%=users%>" id="usernames">
			    <input type="hidden" value="<%=license%>" id="licenses">





            <input type="submit" class="btn" value="Register" />
            <!-- <p class="social-text">Or Sign up with social platforms</p>
            <div class="social-media">
              <a href="#" class="social-icon">
                <i class="fab fa-facebook-f"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-twitter"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-google"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-linkedin-in"></i>
              </a>
            </div> -->
          </form>
        </div>
      </div>

      <div class="panels-container">
        <div class="panel left-panel">
          <div class="content">
            <h3>New User ?</h3>
            <p>
              Enter your details and start your journey 
            </p>
            <button class="btn transparent" id="sign-up-btn">
              Register
            </button>
          </div>
          <img src="./images/logo.png" class="image" alt="" />
        </div>
        <div class="panel right-panel">
          <div class="content">
            <h3>One of us ?</h3>
            <p>
               Please login with your personal info
            </p>
            <button class="btn transparent" id="sign-in-btn">
              Sign in
            </button>
          </div>
          <img src="./images/logo.png" class="image" alt="" />
        </div>
      </div>
    </div>
    <script src="./js/app.js"></script>
  </body>
</html>
