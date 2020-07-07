<%@page import="com.techblog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.techblog.helpers.ConnectionProvider"%>
<%@page import="com.techblog.dao.PostDao"%>
<%@page import="com.techblog.entities.User"%>
<%
	User user = (User) session.getAttribute("currentUser");
%>
<nav class="navbar fixed-top navbar-expand-lg navbar-light  fornav" style="background-color: #00b0ff">

	<a class="navbar-brand" href="index.jsp"><span class="fa fa-graduation-cap"></span> Codegram</a>
  	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
   		 <span class="navbar-toggler-icon"></span>
  	</button>

  	<div class="collapse navbar-collapse" id="navbarSupportedContent" >
    	
    	<ul class="navbar-nav mr-auto">
      		
      		 <%
				if (user == null) 
				{
			%>
      		<li class="nav-item ">
        		<a class="nav-link active-page" href="index.jsp"><span class="fa fa-home"></span>Home <!-- <span class="sr-only">(current)</span> --></a>
      		</li>
	     	 <%
				}else{
            %>
            <li class="nav-item ">
        		<a class="nav-link active-page" href="profile.jsp"><span class="fa fa-home"></span>Home <!-- <span class="sr-only">(current)</span> --></a>
      		</li>
            <%
				}
            %>
	     	
      		
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
		    
		    <li class="nav-item">
		       <a class="nav-link " href="about.jsp"><span class="fa fa-user-circle-o"></span>About</a>
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

<%@include file="do_post_modal.jsp" %>

