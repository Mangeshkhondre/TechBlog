<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>ERROR</title>
			<link rel="stylesheet"
					href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
					integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
					crossorigin="anonymous">
		
			<link href="css/MyCSS.css" rel="stylesheet" type="text/css">
			<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
			
			<style>
				.banner-background {
				clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 100%, 76% 95%, 50% 100%, 23% 96%,0 100%, 0% 35%, 0 0);
				}
			</style>
 	</head>
	<body>
		<div class="container text-center">
			<img src="Images/error1.png" class="image-fluid" width="300" height="300" >
			<h3 class="display-3">Sorry! Something went wrong...</h3>
			<%= exception%>
            <a href="index.jsp" class="btn btn-primary text-white mt-3">Home </a>
		</div>
	
	</body>
</html>