<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
	response.setHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0"); // HTTP 1.1.
	response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
	response.setDateHeader("Expires", 0); // Proxies.
%>

<%
	
	int userId = 0;
	String userName="";
	Cookie[] cookies = request.getCookies();
	boolean flag=false;
	if(cookies !=null)
	{
	
			for(Cookie cookie : cookies)
			{
    			if(cookie.getName().equals("user")) 
    			{
    				System.out.println("cookie.getValue()----->"+cookie.getValue());
    				String[] idname = cookie.getValue().split(":");
    				userId = Integer.parseInt(idname[0]);
    				userName = idname[1];
    				
					flag= true;
    			}
    		}
	}
	
	if(!(flag)) 
	{
	System.out.println("no cookie");
	response.sendRedirect("/onlineshoppe/signIn");
	}
%>

<html>
  <head>
  <meta charset="utf-8">
 <!--    <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>  
 	
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
 <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>  
	<title>Online Shoppe</title>

    <!-- Bootstrap Core CSS -->
     <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet"> 
    <!-- Custom CSS -->
    <link href="<c:url value="/resources/css/shop-homepage.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/freelancer.css" />"rel="stylesheet">
    <link href="<c:url value="/resources/css/agent.css" />"rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="<c:url value="/resources/css/font-awesome.min.css"/>"rel="stylesheet"type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

<script src="<c:url value="/resources/js/formvalidation.js" />"></script>


</head>

<body id="page-top" class="index" >


    <!-- Navigation -->
   <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="<%=request.getContextPath()%>/home">Online Shoppe</a>
            </div>
  </div>
  <div class ="container_search">
  
    <div class="col-md-6">
       <form:form action="/onlineshoppe/search" method="get" commandName="product" class="navbar-form">
        <div class="input-group">
            <input type="text" class="form-control" align="center" id="productName" name="productName" value="" >
            <div class="input-group-btn">
            <div class= "container_searchbtn"></div>
                <button  type="submit" class="btn btn-success btn-block">
								Search
							</button>
							</div>
            </div>
            </form:form>
        </div>
       
    </div>
  
    
    <div class="container_right_href">
      <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                   
                  
       <li><i class="fa fa-edit"></i><a> Logged in as: <%=userName %></a></li><br>
        <li><a href="/onlineshoppe/signout"><i class="fa fa-edit"></i>Sign Out</a></li>
      
    
                </ul>
            </div>
    
    
    </div>
    
    <div class="container_search">
    <div class="btn-group" align="center" role="group">
    <form action="/onlineshoppe/accountUpdate/<%=userId %>">
&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-primary" type="button" onclick="this.form.submit()">
  Update Account
</button></form>
   </div>  
   <div class="btn-group" align="center" role="group">  
   <form action="/onlineshoppe/deleteAccount/<%=userId %>">
&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-primary" type="button" onclick="this.form.submit()">
 Delete Account
</button>

	</form>	</div>

  <div class="btn-group" align="center" role="group"> 
   <form action="/onlineshoppe/orderHistory/<%=userId %>" method="get">
&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-primary" type="button" onclick="this.form.submit()">
 Order History
</button>

	</form>	</div>

	</div>
</nav>

<hr>

 <section id="contact">
        <div class="container">


    <div class="">
    <div class="row">
    <hr>
        <!-- <div class="col-md-3" well> -->
        <div id="sidebar-wrapper">
           <!--  <ul class="nav nav-list bs-docs-sidenav affix"> -->
           <ul class="sidebar-nav">
                <li class="sidebar-brand"><a href="/onlineshoppe/home">Home</a></li>
            
                <li class="sidebar-brand"><a href="/onlineshoppe/electronics">Electronics</a></li>
                <li class="sidebar-brand"><a href="/onlineshoppe/clothes">Clothes</a></li>
                <li class="sidebar-brand"><a href="/onlineshoppe/automobiles">AutoMobiles</a></li>
                <li class="sidebar-brand"><a href="/onlineshoppe/accessories">Accessories</a></li>
                <li class="sidebar-brand"><a href="/onlineshoppe/other">All Other</a></li>
            </ul>
	
        </div>
        
      <div class="container"><h3>Items Bought</h3>
        	<div class="panel-body">
				<c:if  test="${!empty results}">
				<c:forEach items="${results}" var="prod">
					<div class="row">
					
						<div class="col-xs-2"><img class="img-responsive" src="${prod.imageName}">
						</div>
						<div class="col-xs-4">
							<h4 class="product-name"><strong>${prod.productName}</strong></h4><h4><small>Product description</small></h4><h4><small>State: ${prod.state}</small></h4><h4><small>Brand: ${prod.brand }</small></h4>
						   </div>
						<div class="col-xs-6">
							<div class="col-xs-6 text-right">
								<h4>PRICE: $ <strong>${prod.price }</strong></h4>
							</div>
							<div class="col-xs-4">
								<h6>Quantity: <strong>${prod.quantity }</strong></h6>
							</div>
							<div class="col-xs-2">
					
								
							</div>
						</div>
						</div>
					<hr>
					</c:forEach>
					</c:if>
					
				<div class="panel-footer">
					<div class="row text-center">
						<div class="col-xs-3">
							<c:if  test="${empty results}">
						<h4 style="color:red"> 	You haven't bought anything yet! </h4>
							</c:if>
						</div>
					</div>
				</div>
			</div>
       </div>
      
        </div>
    </div>
	
  </body>
</html>
