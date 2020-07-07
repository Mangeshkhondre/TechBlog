<%@page import="com.techblog.entities.Category"%>
<%@page import="com.techblog.entities.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.techblog.helpers.ConnectionProvider"%>
<%@page import="com.techblog.dao.PostDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
	User user = (User) session.getAttribute("currentUser");


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>About</title>
<!-- css -->
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
		crossorigin="anonymous">

	<link href="MyCSS.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>


	<nav class="navbar navbar-expand-lg navbar-light fornav" style="background-color: #00b0ff">

	<a class="navbar-brand" href="index.jsp"><span class="fa fa-graduation-cap"></span> Codegram</a>
  	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
   		 <span class="navbar-toggler-icon"></span>
  	</button>

  	<div class="collapse navbar-collapse " id="navbarSupportedContent" >
    	
    	<ul class="navbar-nav mr-auto">
      		
      		<li class="nav-item ">
        		<a class="nav-link " href="profile.jsp"><span class="fa fa-home"></span>Home <!-- <span class="sr-only">(current)</span> --></a>
      		</li>
	     	
	     	
      		
      		<%-- <li class="nav-item dropdown" >
        		<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
       		  	Category
		        </a>
		        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
			  
			          <%                                
                            	PostDao d = new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Category> list1 = d.getAllCategories();
                                for (Category cc : list1) 
                                {
                            %>
                            <a class="dropdown-item" href="#" onclick="getPosts(<%= cc.getCid()%>, this)" class=" c-link list-group-item list-group-item-action"><%= cc.getName()%></a>
                            <%  
                            	}
                            %>
		        </div>
		    </li> --%>
		    
		    <li class="nav-item active-page">
		       <a class="nav-link  " href="about.jsp"><span class="fa fa-user-circle-o"></span>About</a>
		    </li>
		    
		    
		    <%
				if (user == null) 
				{
			%>
			<li class="nav-item">
		    	    <a class="nav-link " href="login_page.jsp"><span class="fa fa-user-circle "></span>Login</a>
		    </li>
		    <li class="nav-item">
		    	    <a class="nav-link " href="Register_page.jsp"><span class="fa fa-user-circle "></span>Sign Up</a>
		    </li>
            <%
				}
            %>
             <li class="nav-item">
         	<a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal" > <span class="fa fa-file-text"></span> Do Post</a>
            </li>
            
          </ul>  
          <%
				if (user != null) 
				{
			%>
          
			 <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"> <span class="fa fa-user"></span> <%= user.getName()%> </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"> <span class="fa fa-sign-out"></span> Logout</a>
                    </li>
         	</ul>
            <%
				}
            %>
	   
    	
  	</div>
</nav>




	<h2 style="text-align:center">Mangesh Khondre</h2>




		<!--add post modal-->



        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide the post details..</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form id="add-post-form" action="AddPostServlet" method="post">

                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disabled>---Select Category---</option>

                                   <%
                                        PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = postd.getAllCategories();
                                        for (Category c : list) 
                                        {
                                    %>
                                    <option value="<%= c.getCid()%>"><%= c.getName()%></option>

                                    <%
                                        }
                                    %>
                            	</select>
                            </div>

                            <div class="form-group">
                                <input name="pTitle" type="text" placeholder="Enter post Title" class="form-control"/>
                            </div>

                            <div class="form-group">
                                <textarea name="pContent" class="form-control" style="height: 200px;" placeholder="Enter your content"></textarea>
                            </div>
                            <div class="form-group">
                                <textarea name="pCode" class="form-control" style="height: 200px;" placeholder="Enter your program (if any)"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Select your pic..</label>
                                <br>
                                <input type="file" name="pic"  >
                            </div>

                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-primary">Post </button>
                            </div>

                        </form>


                    </div>

                </div>
            </div>
        </div>


        <!--END add post modal-->
	
	
		     <!--now add post js-->
        <script>
            $(document).ready(function (e) {
                //
                $("#add-post-form").on("submit", function (event) {
                    //this code gets called when form is submitted....
                    event.preventDefault();
                    console.log("you have clicked on submit..")
                    let form = new FormData(this);
                    //now requesting to server
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //success ..
                            console.log(data);
                            if (data.trim() == 'done')
                            {
                                swal("Done!", "Posted Successfully", "success");
                            } else
                            {
                                swal("Error!!", "Something went wrong try again...", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //error..
                            swal("Error!!", "Something went wrong try again...", "error");
                        },
                        processData: false,
                        contentType: false
                    })
                })
            })
        </script>
		
</body>
</html>