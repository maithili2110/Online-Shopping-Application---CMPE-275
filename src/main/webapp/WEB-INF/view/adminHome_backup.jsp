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
    <title> home</title>
     <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel='stylesheet' href='/stylesheets/style.css' />
    <link rel='stylesheet' href='//netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css' /> 
    <link rel='stylesheet' href='http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css' />
    <link rel="shortcut icon" href="favicon.ico">
<link rel="icon" type="image/gif" href="animated_favicon1.gif">
  </head>
  
  <body background="http://10steps.sg/wp-content/uploads/2012/11/White-christmas-light-background.jpg">
<nav class="navbar navbar-default" role="navigation">
  <div class="navbar-header" class="col-md-6">
     <a class="navbar-brand" href="/onlineshoppe/home"><img src="http://media.merchantcircle.com/19482392/Onlineshoppe_full.gif" height="100" width="200"></a>  
  </div>
    <div class="col-md-6">
        <%-- <form class="navbar-form" role="search" action="search">
        <div class="input-group">
            <input type="text" class="form-control" placeholder="Search" name="search" id="search">
            <div class="input-group-btn">
                <button class="btn btn-default" type="submit">Search<i class="glyphicon glyphicon-search"></i></button>
            </div>
        </div>
        </form> --%>
    </div>
    <div class="col-md-3">
    <ul class="nav navbar-nav navbar-right">
        <li><i class="fa fa-check"></i> Logged in as: <%=userName %></a></li><br/>
    </ul>
    </div>
  </div> 
 <ul>	
 <li><a href="/onlineshoppe/signout"><i class="fa fa-edit"></i>Sign Out</a></li>
 </ul>
    
	
</nav>
<div class="container">
    <div class="">
    <div class="row">
           <div class="stepwizard">
    <div class="stepwizard-row">
    </div>
</div>

			<div class="panel-body">
			<c:if  test="${empty results}">
						<h3 style="color:red">	No new items to approve!</h3>
							</c:if>
				<%-- <form action="/onlineshoppe/productApproved/${prod.productId }"  method="post"  id="billingform" accept-charset="utf-8"> --%>
				<c:if  test="${!empty results}">
				<c:forEach items="${results}" var="prod">
				<%-- <form action="/onlineshoppe/productApproved/${prod.productId }"  method="post"  id="billingform" accept-charset="utf-8"> --%>
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
							 <a href = "/onlineshoppe/ProductDisapproved/${prod.productId }">
								<button type="button" class="btn btn-link btn-xs">
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
		</div>
	</div>
</div>
</body>
</html>
