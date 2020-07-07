<%@page import="com.techblog.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>

	<head>
	<meta charset="ISO-8859-1">
	<title>LogIn</title>

	<!-- css -->
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
		crossorigin="anonymous">

	<link href="MyCSS.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
           .banner-background{clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 100%, 76% 95%, 50% 100%, 23% 96%, 0 100%, 0% 35%, 0 0);}
    </style>
</head>



<body>
	<%@include file="navbar.jsp" %>

		<main class="d-flex align-items-center  banner-background" style="background-color: #00b0ff;height: 100vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">

                        <div class="card">
                            <div class="card-header   text-center"style="background-color: #40c4ff">
                                <span class="fa fa-user-plus fa-3x"></span>
                                <br>
                                <p>Login here</p>
                            </div>
                            
							<!-- Displaying some message like invalid credentials, successful logout -->
                         	<% 
                                Message m = (Message) session.getAttribute("msg");
                                if (m != null) 
                                {
                            %>
		                            <div class="alert <%= m.getCssClass() %>" role="alert">
		                                <%= m.getContent() %>
		                            </div>
                            <%        
                                    session.removeAttribute("msg");
                                }
                            %> 
					


                            <div class="card-body"> 
                                
                                <!-- Login Form -->
                                <form action="LoginServlet" method="post">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Email">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input name="password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                    </div>
                                    
									<h6>No Account?<a href="Register_page.jsp">  Register here</a></h6>
									
									
                                    <div class="container text-center">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </form>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </main>



		<script src="https://code.jquery.com/jquery-3.5.0.min.js"
				integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ="
				crossorigin="anonymous"></script>
		<script
				src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
				integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
				crossorigin="anonymous"></script>
		<script
				src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
				integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
				crossorigin="anonymous"></script>
		<script
				src="js/MyJS.js"
				type="text/javascript"></script>
			
</body>
</html>