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
	<title>Cart</title>

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
                <a class="navbar-brand" href="<%=request.getContextPath()%>/home">Online Shoppe</a>
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
	<hr>
	<hr>
    <!-- Header -->
   <br>

<section id="contact">
        <div class="container_search">
            
            <div class="row">
          
                <div class="col-lg-12 text-center">
               
                    <h2>MY CART</h2>
                    <hr class="star-primary">
                </div>
            </div>
         </div>
         
			<div class="panel-body">
				<form action="/onlineshoppe/checkOut/<%=userId %>" method="post" id="billingform" accept-charset="utf-8">
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
							<a href = "/onlineshoppe/deleteProductFromCart/<%=userId %>/${prod.cartItemId }">
								<button type="button" class="btn btn-link btn-xs">
									<span class="glyphicon glyphicon-trash"> </span>
								</button>
								</a>
								
							</div>
						</div>
						</div>
					<hr>
					</c:forEach>
					</c:if>
					
				<div class="panel-footer">
					<div class="row text-center">
						<div class="col-xs-3">
						<c:if  test="${!empty results}">
							<button  type="submit" class="btn btn-success btn-block">
								Checkout
							</button>
							</c:if>
							<c:if  test="${empty results}">
						<h4 style="color:red"> 	No items in the cart! </h4>
							</c:if>
						</div>
					</div>
				</div>
              </form>
			</div>
		</div>
	</div>
</div>
</section>
 <!-- Footer -->
    <footer class="text-center">
        <div class="footer-above">
            <div class="container_footer">
                <div class="row">
                    <div class="footer-col col-md-4">
                       
                    </div>
                   
                    <div class="footer-col col-md-4">
                        
                    </div>
                    
                     <div class="footer-col col-md-4">
                        
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-below">
            <div class="container_footer">
                <div class="row">
                    <div class="col-lg-12">
                        
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
    <div class="scroll-top page-scroll visible-xs visble-sm">
        <a class="btn btn-primary" href="#page-top">
            <i class="fa fa-chevron-up"></i>
        </a>
    </div>

    <!-- Portfolio Modals Removed -->
    
    
  
 
    <!-- jQuery -->
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="<c:url value="/resources/js/jquery.js" />"></script>
<script src="<c:url value="/resources/js/formvalidation.js" />"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>

    <!-- Plugin JavaScript -->
    <script src="<c:url value="/resources/js/jquery.easing.min.js" />"></script>
    <script src="<c:url value="/resources/js/classie.js" />"></script>
    <script src="<c:url value="/resources/js/cbpAnimatedHeader.js" />"></script>

    <!-- Contact Form JavaScript -->
    <script src="<c:url value="/resources/js/jqBootstrapValidation.js" />"></script>
   <script src="<c:url value="/resources/js/jquery.js" />"></script>

    <!-- Custom Theme JavaScript -->
    <script src="<c:url value="/resources/js/freelancer.js" />"></script>
    
    


</body>
</html>
