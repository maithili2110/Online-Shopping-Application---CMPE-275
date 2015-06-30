<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<title>Sell Product</title>

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
                        <li><a href="#"><i class="fa fa-check"></i>Logged in as : <%=userName %></a></li>
         <li><a href="/onlineshoppe/signout"><i class="fa fa-check"></i>SignOut</a></li>
                    </li>
                   
                </ul>
                <br>
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
            
            <!-- /.navbar-collapse -->
       
        <!-- /.container-fluid -->
    </nav>
	<hr>
    <!-- Header -->
   <br>

        
    <section id="contact">
        <div class="container">
            <div class="row">
          
                <div class="col-lg-12 text-center">
               
                    <h4>Product details</h4>
                    <hr class="star-primary">
                </div>
            </div>


			
<div class="row">
                <div class="col-lg-8 col-lg-offset-2" >
              
                    <!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19. -->
                    <!-- The form should work on most web servers, but if the form is not working you may need to configure your web server differently. -->
			<form:form action="addproduct" method="post" commandName="product">

               <div class="row control-group" >
                <div class="form-group col-xs-12 floating-label-form-group controls ">
               
		<input type="text" class="form-control input-lg" name="productName" value="" placeholder="ProductName" id="product"></input>
                </div>

		<div class="form-group col-xs-12 floating-label-form-group controls ">
			
		<input type="text" class="form-control input-lg" name="productType" value="" placeholder="ProductType" id="productType" ></input>
		</div>
		<div class="form-group col-xs-12 floating-label-form-group controls ">
		
                 <select class="button dropdown" id="category" name="category" value=" " require="true">
  							<option value="Electronics">Electronics</option>
  							 <option value="Clothes">Clothes</option>
    							<option value="Luggage">Luggage</option>
    							<option value="Movies">Movies</option>
    							<option value="Auto Mobiles">Auto Mobiles</option>
    							<option value="All Other">All Other</option>   					
  							</select>
                 
                </div>
			<div class="form-group col-xs-12 floating-label-form-group controls ">
		<input type="text" class="form-control input-lg" name="quantity" value="" id="quantity" placeholder="Quantity" ></input>
 		</div>
			<div class="form-group col-xs-12 floating-label-form-group controls ">
		<input type="text" class="form-control input-lg" name="brand" value="" id="brand" placeholder="Brand" ></input>
            </div>     
		<div class="form-group col-xs-12 floating-label-form-group controls ">
		
                 <select id="state" name="state" value=" " require="true">
  							<option value="New">New</option>
  							 <option value="Used">Used</option>
    							<option value="Refurbished">Refurbished</option>  					
  							</select>
</div>
		<div class="form-group col-xs-12 floating-label-form-group controls ">
		<input type="text" class="form-control input-lg" name="model" value="" id="model" placeholder="Model"></input>
</div>
		<div class="form-group col-xs-12 floating-label-form-group controls ">
		<textarea type="text" class="form-control input-lg" name="description" value="" id="textarea"  placeholder="Description"></textarea>
              </div>
               <div class="form-group col-xs-12 floating-label-form-group controls ">
		<input type="text" class="form-control input-lg" name="price" value="" id="price"  placeholder="Price	"></input>
                </div>
             <div class="row">
                            <div class="form-group col-xs-12">
            <button type="submit" class="btn btn-success btn-l">Submit</button>
          </div>
	</form:form>
			</div>
		</div>
	</div>
	</div>
	</section>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
 <!-- Footer -->
    <footer class="text-center">
        <div class="footer-above">
            <div class="container">
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
            <div class="container">
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