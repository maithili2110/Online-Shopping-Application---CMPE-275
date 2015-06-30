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
       <form:form action="/onlineshoppe/search" method="get" commandName="product" class="navbar-form">
        <div class="input-group">
            <input type="text" class="form-control" id="productName" name="productName" value="" >
            <div class="input-group-btn">
                <button  type="submit" class="btn btn-success btn-block">
								Search
							</button>
            </div>
        </div>
       </form:form>
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
    <div class="col-md-1" align="center">
    <form action="/onlineshoppe/accountUpdate/<%=userId %>">
&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-primary" type="button" onclick="this.form.submit()">
  Update Account
</button></form>
   </div> 
   <div class="col-md-1" align="center"> 
   <form action="/onlineshoppe/deleteAccount/<%=userId %>" >
&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-primary" type="button" onclick="this.form.submit()">
 Delete Account
</button>

	</form>	</div>

  <div class="col-md-1" align="center"> 
   <form action="/onlineshoppe/orderHistory/<%=userId %>" method="get">
&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-primary" type="button" onclick="this.form.submit()">
 Order History
</button>

	</form>	</div>

	
</nav>
<div class="container">
    <div class="">
    <div class="row">
        <div class="col-md-3">
            <ul class="nav nav-pills nav-stacked">
                <li ><a href="/onlineshoppe/home"><i class="fa fa-home fa-fw"></i>Home</a></li>
                <li><a href="/onlineshoppe/electronics"><i class="fa fa-camera fa-fw"></i>Electronics</a></li>
                <li><a href="/onlineshoppe/clothes"><i class="fa fa-female fa-fw"></i>Clothes</a></li>
                <li><a href="/onlineshoppe/automobiles"><i class="fa fa-suitcase fa-fw"></i>AutoMobiles</a></li>
                <li><a href="/onlineshoppe/accessories"><i class="fa fa-video-camera fa-fw"></i>Accessories</a></li>
                <li><a href="/onlineshoppe/other"><i class="fa fa-cog  fa-fw"></i>All Other</a></li>
            </ul>
	
        </div>
        <div class="col-md-9 well">
            <div class="row">
		<ul class="thumbnails">
		
		<h3>Items Bought</h3>
		<c:if  test="${!empty results}">
		<c:forEach items="${results}" var="prod">
            <li class="span4">
              <a href = "/onlineshoppe/product/${prod.productId}">
             
             <div class="row col-md-6 col-md-offset-2 custyle">
			<table class="table table-striped custab">
				
				<tr>
				<td>
					${prod.productName}</td>
				</tr>
				</table>
			</div>
             
              </a>
            </li>
            </c:forEach>
            </c:if>
          </ul>
	</div>
</div>
        </div>
    </div>
	
  </body>
</html>
