<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Registration</title>

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
	<!-- navigation bar -->
	<%@include file="navbar.jsp" %>

    <main class="d-flex align-items-center banner-background p-5 "  style="  background-color: #00b0ff;height: 100vh">
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">

                    <div class="card">
                        <div class="card-header   text-center"style="background-color: #40c4ff">
                            <span class="fa fa-user-plus fa-3x"></span>
                            <br>
                            <p>Register here</p>
                        </div>
	                   
	                    <div class="card-body">
	                        <form id="reg-form" action="RegisterServlet" method="POST">
	
	                            <div class="form-group">
	                                <label for="user_name">User Name</label>
	                                <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter name">
	                            </div>
	
	                            <div class="form-group">
	                                <label for="exampleInputEmail1">Email address</label>
	                                <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
	                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
	                            </div>
	
	
	
	                            <div class="form-group">
	                                <label for="exampleInputPassword1">Password</label>
	                                <input  name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
	                            </div>
	
	
	                            <div class="form-group">
	                                <label for="gender">Select Gender</label>
	                                <br>
	                                <input type="radio"  id="gender" name="gender" value="male" >Male
	                                <input type="radio"  id="gender" name="gender" value="famale">Female
	                            </div>
	
	                            <div class="form-check">
	                                <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
	                                <label class="form-check-label" for="exampleCheck1">Accept Terms And Conditions</label>
	                            </div>
	
	                            <br>
								                            
				    			<button id="sumbimt-btn" type="submit" class="btn btn-primary">Submit</button>
				    			
				    			<!-- loader , to show processing -->
	                            <div class="container text-center" id="loader" style="display: none;">
	                                <span class="fa fa-refresh fa-spin fa-4x"></span>
	                                <h4>Please wait..</h4>
	                            </div>
	                            
	                        </form>
	                    </div>
                	</div>
                </div>
            </div>
        </div>
    </main>


        <!--javascripts-->
   
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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	
	<!--For further processing after clicking submit button :  -->
	<script >
		$(document).ready(function () {
								        $('#reg-form').on('submit', function (event) {
																			            event.preventDefault();
																			            let form = new FormData(this);
																			            $("#sumbimt-btn").hide();  //button will get hidden
																			            $("#loader").show();	   //loader will be shown
																			            //send register servlet:
																			            $.ajax({
																					                url: "RegisterServlet",
																					                type: 'POST',
																					                data: form,
																					                success: function (data, textStatus, jqXHR) 
																					                {
																					                    console.log(data)
																					                    $("#sumbimt-btn").show(); // back to previous state
																					                    $("#loader").hide();
																					                    if (data.trim() === 'done') // if data is correct 
																					                    {
																					                        swal("Registered successfully \n Redirecting to Login")
																					                                .then((value) => {
																					                                    window.location = "login_page.jsp"
																					                                });
																					                    } 
																					                    else  // if data is not correct
																					                    {
																					                        swal(data);
																					                    }
																					              	},
																					                error: function (jqXHR, textStatus, errorThrown) // if some error
																					                {
																					                    $("#sumbimt-btn").show();  // back to previous state	
																					                    $("#loader").hide();
																					                    swal("something went wrong..try again");
																					                },
																					                processData: false,
																					                contentType: false
																			            		});
								       	 												});
	   											 }); 
	
	</script>
		
</body>
</html>