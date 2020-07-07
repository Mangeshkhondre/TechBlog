<%@page import="com.techblog.dao.LikeDao"%>
<%@page import="com.techblog.entities.User"%>
<%@page import="java.util.List"%>
<%@page import="com.techblog.dao.PostDao"%>
<%@page import="com.techblog.entities.Post"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.techblog.helpers.*"%>

<!-- We included navbar.jsp and user validation is done on that jsp so no need to do again. otherwise ambiguity happen for "user"  -->

<%
	User uuu = (User) session.getAttribute("currentUser");
%>
<!DOCTYPE html>
<html>

<head>

	<meta charset="ISO-8859-1"> 
	<title>Home</title>
	
	<!-- css -->
	<link rel="stylesheet"
			href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
			integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
			crossorigin="anonymous">

	<link  rel="stylesheet" type="text/css" href="MyCSS.css"/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<style>
		.banner-background {clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 100%, 76% 95%, 50% 100%, 23% 96%,0 100%, 0% 35%, 0 0);}
		
	</style>
	
	
</head>



<body>
	<!-- navigation bar -->
	
		<%@include file="navbar.jsp" %>

	<div class="container-fluid p-0 m-0">

            <div class="jumbotron  text-black banner-background" style="background-color: #00b0ff;">
                <div class="container">
                <%
						if (user == null) {
					%>
                    <h3 class="display-4">Welcome to Codegram. </h3>

                    <p>Welcome to this technical blog - Codegram, world of technology
                        A programming language is a formal language, which comprises a set of instructions that produce various kinds of output. Programming languages are used in computer programming to implement algorithms.
                    </p>
                    <p>
                        Most programming languages consist of instructions for computers. There are programmable machines that use a set of specific instructions, rather than general programming languages. 
                    </p>
					
					
					
					<div>
						<a href="Register_page.jsp"class="btn btn-outline-light btn-lg"> <span class="fa fa-user-plus"></span>  Let's Start</a>
    	                <a href="login_page.jsp" class="btn btn-outline-light btn-lg"> <span class="fa fa-user-circle fa-spin"></span>  Login</a>	
					</div>
                   
                    <%
						}
                    %>
                </div>
            </div>
    </div>
     


<div class="container">
	<div class="row">

    <%
        PostDao dd = new PostDao(ConnectionProvider.getConnection());
        List<Post> posts = null;
        posts = dd.getAllPosts();
        for (Post p : posts) {
    %>

    <div class="col-md-6 mt-4">
        <div class="card">
            <%--  <img class="card-img-top" src="blog_pics/<%= p.getpPic()%>" alt="Card image cap"> --%>  
            <div class="card-body">
                <b><%= p.getpTitle()%></b>
                <p><%= p.getpContent()%></p> 

            </div>
          <%--  <div class="card-footer bg-light text-center">
                <% 
                    LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                %> 

                <a href="#!" onclick="doLike(<%= p.getPid()%>,<%= uuu.getId()%>)" class="btn btn-outline-dark btn-sm"> <i class="fa fa-thumbs-o-up"></i> <span class="like-counter"><%= ld.countLikeOnPost(p.getPid())%> </span>  </a>
			 --%>
                <a href="show_blog_page.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-dark btn-sm">Read More...</a>
              <%--   <a href="#!" class="btn btn-outline-dark btn-sm"> <i class="fa fa-commenting-o"></i> <span>20</span>  </a>--%>
            </div> 

        </div>


    </div>


    <%
        }
        
    %>

</div>
</div>
<div>
	<pre>
	
	
	
	
	
	</pre>
</div>






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