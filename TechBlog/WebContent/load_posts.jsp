<%@page import="com.techblog.dao.LikeDao"%>
<%@page import="com.techblog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.techblog.helpers.ConnectionProvider"%>
<%@page import="com.techblog.dao.PostDao"%>
<%@page import="com.techblog.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>



<div class="row">

    <%
        
        User uuu=(User)session.getAttribute("currentUser");
        
        
        PostDao d = new PostDao(ConnectionProvider.getConnection());
        
        int cid = Integer.parseInt(request.getParameter("cid"));
        List<Post> posts = null;
        if (cid == 0) {
            posts = d.getAllPosts();
        } else {
            posts = d.getPostByCatId(cid);
        }
        
        if (posts.size() == 0) {
            out.println("<h4 class='display-3 text-center'>No Posts in this category..</h4>");
            return;
        }
        
        for (Post p : posts) {
    %>

    <div class="col-md-6 mt-4 ">
        <div class="card flex-fill">
            <%--  <img class="card-img-top" src="blog_pics/<%= p.getpPic()%>" alt="Card image cap"> --%>  
            <div class="card-body ">
                <b><%= p.getpTitle()%></b>
                <p><%= p.getpContent()%></p> 

            </div>
           <div class="card-footer bg-light text-center">
           <%--      <% 
                    LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                %> 

                <a href="#!" onclick="doLike(<%= p.getPid()%>,<%= uuu.getId()%>)" class="btn btn-outline-dark btn-sm"> <i class="fa fa-thumbs-o-up"></i> <span class="like-counter"><%= ld.countLikeOnPost(p.getPid())%> </span>  </a>
			--%>
				<% if(uuu==null)
					{
				%>
					<a href="login.jsp" class="btn btn-outline-dark btn-sm">Read More...</a>
				<%
					}
					else
					{
				%>
                <a href="show_blog_page.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-dark btn-sm">Read More...</a>
                <%
					}
                %>
              <%--   <a href="#!" class="btn btn-outline-dark btn-sm"> <i class="fa fa-commenting-o"></i> <span>20</span>  </a>--%>
            </div> 

        </div>


    </div>


    <%
        }
        
    %>

</div>
