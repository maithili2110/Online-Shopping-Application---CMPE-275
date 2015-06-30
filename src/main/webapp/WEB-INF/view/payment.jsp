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
  <!-- <head>
    <title> Payment</title>
     <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel='stylesheet' href='/stylesheets/style.css' />
    <link rel='stylesheet' href='//netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css' /> 
    <link rel='stylesheet' href='http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css' />
    <link rel="shortcut icon" href="favicon.ico">
<link rel="icon" type="image/gif" href="animated_favicon1.gif">
<style>
h2 {
    text-shadow:5px 5px 10px black;
}

h3 {
    text-shadow:5px 5px 10px black;
}
 </style>
  </head> -->
  <head>
 <meta charset="utf-8">
 <!--    <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>  
 	
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
 <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>  
	<title>Account Update</title>

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
  
  <script>
    function initialize()
    {
    var x = document.getElementById("form").elements.length;
    for(var i =0; i<x-1;i++)
    {
         var field = document.getElementById("form").elements[i].value ;
         if(field == "")
         {
         alert("values missing");
         return false;
         }
    }
         
    if (document.getElementById("cardNumber"))
    {
    	if(document.getElementById("cardNumber").value.length<16 || document.getElementById("cardNumber").value.length>16)
    	{
    alert("Card Number must be  16 characters long");
    return false;
    	}
   	 
    
    }
    if (document.getElementById("cvc"))
    {
    	if(document.getElementById("cvc").value.length<3 || document.getElementById("cvc").value.length>3 )
    	{
    alert("cvc must be 3 characters long");
    return false;
    	}
    	
    	var re = /^\d{2}\/\d{4}$/;

        if(form.startdate.value != '' && !form.startdate.value.match(re)) {
          alert("Invalid date format: " + form.startdate.value);
          form.startdate.focus();
          return false;
        }
    
    }
    }  
          
         
    </script>
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
                <a class="navbar-brand" href="<%=request.getContextPath()%>/">Online Shoppe</a>
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
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
	<hr>
    <!-- Header -->
   
        
    <section id="contact">
        <div class="container">
            <div class="row">
          
                <div class="col-lg-12 text-center">
               
                    <h4>Please fill the bank details to complete the payment process</h4>
                    <hr class="star-primary">
                </div>
            </div>

    
  
<%--   <body background="http://10steps.sg/wp-content/uploads/2012/11/White-christmas-light-background.jpg">
<nav class="navbar navbar-default" role="navigation">
  <div class="navbar-header" class="col-md-6">
     <a class="navbar-brand" href="/onlineshoppe/home"><img src="http://media.merchantcircle.com/19482392/Onlineshoppe_full.gif" height="100" width="200"></a>  
  </div>
     <div class="col-md-6">
        <form class="navbar-form" role="search" action="search">
        <div class="input-group">
            <div class="input-group-btn">
            </div>
        </div>
        </form>
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
   <form action="/onlineshoppe/deleteAccount/<%=userId %>">
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
           <div class="stepwizard">
    <div class="stepwizard-row">
    </div>
</div>
<div class="container">
<h2 class='text-center'><span class="label label-primary">Please fill the bank details to complete the payment process</span></h2>
<br><br>
    <div class='row'>
        <div class='col-md-4'></div>
        <div class='col-md-4'> --%>
          <script src='/routes/toPay.js' type='text/javascript'></script>
          <div class="row">
                <div class="col-lg-8 col-lg-offset-2" >
         <form method="POST" action="${user.id }" novalidate="novalidate" name="form" id="form" onsubmit="return initialize()">
           <!--  <div class='form-row'> -->
              <div class='col-xs-12 form-group required'>
                <label class='control-label'>Name on Card</label>
                <input class='form-control' size='4' type='text' name="cardName" id="cardName">
              <!-- </div> -->
            </div>
            <div class='form-row'>
              <div class='col-xs-12 form-group card required'>
                <label class='control-label'>Card Number</label>
                <input autocomplete='off' class='form-control card-number' size='20' type='text' name="cardNumber" id="cardNumber">
              </div>
            </div>
            <div class='form-row'>
              <div class='col-xs-12 form-group cvc required'>
                <label class='control-label'>CVC</label>
                <input autocomplete='off' class='form-control card-cvc' placeholder='ex. 311' size='4' type='text'name="cvc" id="cvc">
              </div>
              <div class='col-xs-12 form-group expiration required'>
                <label class='control-label'>Expiration</label>
                <input class='form-control card-expiry-year' placeholder='MM/YYYY' size='8' type='text' name="startdate" id="startdate">
              </div>
    <br>
            <div class='form-row'>
              <div class='col-md-12 form-group'>
                <button class='form-control btn btn-primary submit-button' type='submit'>Pay</button>
              </div>
            </div>
            <div class='form-row'>
              <div class='col-md-12 error form-group hide'>
                <div class='alert-danger alert'>
                  Please correct the errors and try again.
                </div>
              </div>
            </div>
          </form>
        </div>
        <div class='col-md-4'></div>
    </div>
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
