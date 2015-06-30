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
	
	int userId=0;
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
	response.sendRedirect("/onlineshoppe/adminLogin");
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
	<title>Admin Homepage</title>

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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel='stylesheet' href='/stylesheets/style.css' />
    <link rel='stylesheet' href='//netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css' />
  <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.0/css/font-awesome.css" />
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
                <a class="navbar-brand" href="<%=request.getContextPath()%>/adminHome">Online Shoppe</a>
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
    </nav>
    <hr>
    <hr>
    <hr>
    
    <section id="contact">
        <div class="panel-body">
			<c:if  test="${empty results}">
						<h3 style="color:red">	No new items to approve!</h3>
							</c:if>
				<%-- <form action="/onlineshoppe/productApproved/${prod.productId }"  method="post"  id="billingform" accept-charset="utf-8"> --%>
				<c:if  test="${!empty results}">
				<c:forEach items="${results}" var="prod">
				<%-- <form action="/onlineshoppe/productApproved/${prod.productId }"  method="post"  id="billingform" accept-charset="utf-8"> --%>
					<div class="row">
					
						<div class="col-xs-2"><img class="img-responsive" src="${prod.imageName}" align="right">
						</div>
						<div class="col-xs-4">
							<h4 class="product-name"><strong>${prod.productName}</strong></h4><h4><small>Product description</small></h4><h4><small>State: ${prod.state}</small></h4><h4><small>Brand: ${prod.brand }</small></h4>
						   </div>
						<div class="col-xs-6">
							<div class="col-xs-6-adminhome text-left">
								<h4>PRICE: $ <strong>${prod.price }</strong></h4>
							</div>
							<div class="col-xs-4-adminhome text-left">
								<h6>Quantity: <strong>${prod.quantity }</strong></h6>
							</div>
							<div class="col-xs-2">
							 <a href = "/onlineshoppe/ProductDisapproved/${prod.productId }">
								<button type="button" class="btn btn-link btn-lg">
									<span class="glyphicon glyphicon-trash"> </span>
								</button>
								</a> 
								
							</div>
							</br>
							<div class="col-xs-2">
							 <a href = "/onlineshoppe/productApprove/${prod.productId }">
								<button  type="submit" class="btn btn-success btn-block">
								Approve
							</button>
								</a> 
								
							</div>
						</div>
						</div>
					<hr>
<%-- 					  </form> --%>
					</c:forEach>
					</c:if>
					
				
            
			</div>
		</section>
	</div>
</div>
</body>
</html>
