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
          <li><a href="sell"><i class="fa fa-edit"></i>Sell Product</a></li>
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
						<li class="sidebar-brand"><a href="/onlineshoppe/other">All
								Other</a></li>
					</ul>

				</div>
				<div class="stepwizard">
					<div class="stepwizard-row"></div>
				</div>
				
				<c:if test="${!empty results}">
					<c:forEach items="${results}" var="prod">
						<div class="container-fluid">
						
							<div class="content-wrapper">
								<div class="item-container">
									<div class="container_search">
									<h3>${message}</h3>
										<div class="col-md-12">
											<div class="product col-md-3 service-image-left">

												<center>
													<img id="item-display" src="${prod.imageName}" height="400" width="500" alt=""></img>
												</center>
											</div>

											<div class="col-md-7">
												<div class="product-title">
													<h5>Name: ${prod.productName}</h5>
												</div>
												<div class="product-desc">
													<h5>Type: ${prod.productType}</h5>
												</div>
												<div class="product-rating">
													<i class="fa fa-star gold"></i> <i class="fa fa-star gold"></i>
													<i class="fa fa-star gold"></i> <i class="fa fa-star gold"></i>
													<i class="fa fa-star-o"></i>
												</div>
												<hr>
												<div class="product-price">
													<h5>Brand: ${prod.brand }</h5>
												</div>
												<div class="product-stock">
													<h5>Quantity : ${prod.quantity }</h5>
												</div>
												<hr>
												<div class="btn-group cart">
													<a
														href="/onlineshoppe/addtocart/<%=userId %>/${prod.productId }">
														<button type="button" class="btn btn-success">
															<b>Add to cart</b>
														</button>
													</a>
												</div>
												<div class="btn-group cart">
													<a
														href="/onlineshoppe/addtoreview/<%=userId %>/${prod.productId }">
														<button type="button" class="btn btn-success">
															<b>Add your Opinion</b>
														</button>
													</a>
												</div>
											</div>
										</div>
										<hr>
										<hr>
										<div class="col-md-12 product-info">
											<ul id="myTab" class="nav nav-tabs nav_tabs">

												<li class="active"><a href="#service-one"
													data-toggle="tab"><h3>DESCRIPTION & REVIEWS</h3></a></li>

											</ul>
											<div id="myTabContent" class="tab-content">
												<div class="tab-pane fade in active" id="service-one">

													<!-- <div class="container"> -->
													<h3>State: ${prod.state }</h3>
													<li><h4>Model: ${prod.model }</h4></li>
													<li><h4>${prod.description }</h4></li>
													<!-- 	</div> -->

												</div>

											</div>
											</div>
											<hr>
											<!-- </div></div></div></div> -->
					</c:forEach>
				</c:if>
				<h3>
					<i>Review and Ratings</i>
				</h3>
				<c:if test="${!empty results1}">
					<c:forEach items="${results1}" var="rev">
						<%int count = 0; %>
						<h4>*****************************************************************************</h4>
						<h4>Review : ${rev.review}</h4>
						<h4>Rate : ${rev.rate}</h4>
					</c:forEach>
				</c:if>

			</div>
			<br>

		</div>
	</div>

  </body> 
</html>
