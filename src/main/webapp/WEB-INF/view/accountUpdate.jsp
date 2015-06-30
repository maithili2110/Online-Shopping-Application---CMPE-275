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
</head>
<script type="text/javascript">
function init()
{
var password = document.getElementById("password")
, password2 = document.getElementById("password2");

function validatePassword(){
if(password.value != password2.value) {
	password2.setCustomValidity("Passwords Don't Match");
} else {
	password2.setCustomValidity('');
}
}

password.onchange = validatePassword;
password2.onkeyup = validatePassword;
}
</script>
<script>
    function initialize()
    {
    //var x = document.getElementById("form").elements.length;
    var first = document.getElementById("firstname").value;
    var last = document.getElementById("lastname").value;
    var email = document.getElementById("email").value;
    var phoneno = document.getElementById("phoneno").value;
    
    
         if(first == "" || last == "" || email == "" || phoneno == "")
         {
         alert("values missing");
         return false;
         }
    
         
        if(document.getElementById("email").value != "")
         {
		        var x = document.getElementById("email").value;
		    	var atpos = x.indexOf("@");
		   		var dotpos = x.lastIndexOf(".");
		    	if (atpos< 1 || dotpos<atpos+2 || dotpos+2>=x.length) {
		        alert("Not a valid e-mail address");
		        return false;
		  		  }
		         
         }
         if(document.getElementById("phoneno").value != "")
         {
         var mobile = document.getElementById("phoneno").value;
          if (/^\d{10}$/.test(mobile))
            return true;
            else
            {
            alert("Enter valid mobile number with 10 digits");
            return false;
            }
         
         }
         
     
    	return true;
   
    }
    
    </script>
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
                        <li><a href="#"><i class="fa fa-edit"></i>Logged in as : <%=userName %></a></li><br>
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
   
        <hr>
    <section id="contact">
        <div class="container">
            <div class="row">
          
                <div class="col-lg-12 text-center">
               
                    <h4>Personal Information</h4>
                    <hr class="star-primary">
                </div>
            </div>


			
<div class="row">
                <div class="col-lg-8 col-lg-offset-2" >
                
              
                    <!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19. -->
                    <!-- The form should work on most web servers, but if the form is not working you may need to configure your web server differently. -->
			<c:forEach items="${results}" var="user">
			<form:form id="form" method="post" action="${user.id }" commandName="user" onsubmit="return initialize()">
				<%-- <form id="loginform" role="form"
					action="<%= session.getAttribute("id") %>" method="POST"> --%>
 <div class="row control-group" >
					<!--  <div id="signupalert" style="display: none"
						class="alert alert-danger">
						<p>Error:</p>
						<span></span>
					</div> --> 
					
					<div class="form-group col-xs-12 floating-label-form-group controls ">
					<form:label path="firstname" > <spring:message code="label.firstname"/></form:label>
        <form:input path="firstname" class="form-control input-lg" placeholder="First name" value="${user.firstname }" />
						
					</div>
				
					<div class="form-group col-xs-12 floating-label-form-group controls ">
					<form:label path="lastname" > <spring:message code="label.lastname"/></form:label>
        <form:input path="lastname" class="form-control input-lg" placeholder="Last name" value="${user.lastname }"/>
						
					</div>
					<div class="form-group col-xs-12 floating-label-form-group controls ">
					<form:label path="email" > <spring:message code="label.email"/></form:label>
        <form:input path="email" class="form-control input-lg" placeholder="Email"value="${user.email }"/>
						
					</div>
					<div class="form-group col-xs-12 floating-label-form-group controls ">
					<form:label path="address" > <spring:message code="label.address"/></form:label>
        <form:input path="address" class="form-control input-lg" placeholder="Address" value="${user.address }"/>
			
					</div>
					
					<div class="form-group col-xs-12 floating-label-form-group controls ">
					<form:label path="city" > <spring:message code="label.city"/></form:label>
        <form:input path="city" class="form-control input-lg" placeholder="City" value="${user.city }"/>
					
					</div>
					
					<div class="form-group col-xs-12 floating-label-form-group controls ">
					<form:label path="zipcode" > <spring:message code="label.zipcode"/></form:label>
        <form:input path="zipcode" class="form-control input-lg" placeholder="Zipcode" value="${user.zipcode }"/>
						
					</div>
					
					<div class="form-group col-xs-12 floating-label-form-group controls ">
					<form:label path="state" > <spring:message code="label.state"/></form:label>
        <form:input path="state" class="form-control input-lg" placeholder="State" value="${user.state }"/>
						
					</div>
					<div class="form-group col-xs-12 floating-label-form-group controls ">
					<form:label path="phoneno" > <spring:message code="label.phoneno"/></form:label>
        <form:input path="phoneno" class="form-control input-lg" placeholder="Phone no." value="${user.phoneno }"/>
						
					</div>
					<div class="form-group">
        <form:input path="password" type="hidden" class="form-control input-lg" value="${user.password }" readonly="true"/>
											</div>
											
											<div class="form-group">
        <form:input path="password2" type="hidden" class="form-control input-lg" value="${user.password2 }" readonly="true"/>
											</div>
											<div class="row">
                            <div class="form-group col-xs-12">
<input type="submit" value="<spring:message code="label.accountUpdate" /> " class="btn btn-success btn-lg"/>
</div> </div>
				</form:form>
			</div>
		</div>
		</div>
		</c:forEach>
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