<!--  <!DOCTYPE html>
<html>
  <head>
    <title>Signup page- Online Shoppe </title>
    <link rel='stylesheet' href='/stylesheets/style.css' />
    <link rel='stylesheet' href='/stylesheets/button.css' />
      <link href="http://fonts.googleapis.com/css?family=Pacifico" rel="stylesheet" type="text/css">
  </head>
  <body>

  

 
 <img src="http://blog.solopress.com/wp-content/uploads/2014/08/social-shopping.jpg"  class="blur"/> 
  <img src="/images/shopping-11645.jpg"  class="blur"/>
  <style>
  img.blur { width:auto; height:auto; -webkit-filter: blur(3px); filter: blur(3px);

 }
  </style>
 
  </body>
</html>


 -->

 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
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
         if (document.getElementById("password"))
         {
         	if(document.getElementById("password").value.length<6)
         	{
         alert("password must be atleast 6 characters long");
         return false;
         	}
        	 else if(document.getElementById("password").value != document.getElementById("password2").value)
        	 {
         alert("Passwords do not match");
         return false;
         	}
         
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


<!-- <body id="page-top" class="index" background="http://ariesideas.com/wp-content/uploads/2014/01/bg-shopping.jpg"> --> 
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
                    </li>
                   
                  
        <li><a href="/onlineshoppe/signIn"><i class="fa fa-check"></i> login</a></li>
    
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
               
                    <h4>New to Online Shoppe ? Register below.</h4>
                    <hr class="star-primary">
                </div>
               
            </div>
          
           <h3 style="color:black"> ${message}</h3>
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2" >
              
                    <!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19. -->
                    <!-- The form should work on most web servers, but if the form is not working you may need to configure your web server differently. -->
                     <form method="post" action="add" id="form" commandName="user" 
                    
                    onsubmit="return initialize()"> 
     
                  
                        <div class="row control-group" >
                        
                     
                            <!-- <div class="form-group col-xs-12 floating-label-form-group controls"> -->
                              
                               <div class="form-group col-xs-12 floating-label-form-group controls ">
                                <label>First Name</label>
                                <input type="text" class="form-control"  placeholder="First Name" id="firstname" name="firstname" path="firstname" 
                                />
                              
                            </div>
                        </div>
                        
                        <div class="row control-group">
                           <!--  <div class="form-group col-xs-12 floating-label-form-group controls"> -->
                               <div class="form-group col-xs-12 floating-label-form-group controls has-success has-feedback">
                                <label>Last Name</label>
                                <input type="text" class="form-control" placeholder="Last Name" id="lname" name="lastname" path="lastname"
                                 />
                                 
                               
                            </div>
                        </div>    
                         <div class="row control-group">
                            <!-- <div class="form-group col-xs-12 floating-label-form-group controls"> -->
                            <div class="form-group col-xs-12 floating-label-form-group controls has-success has-feedback">
                                <label>Email</label>
                                <input type="text" class="form-control" placeholder="Email" id="email" name="email" path="email"
                                />
                           
                              
                            </div>
                        </div>                     
                     
                        
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Password</label>
                                <input type="password" class="form-control" placeholder="Password" id="password" name="password" 
                                />
                                <span class="help-block">Minimum of 6 characters</span>
                                
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Confirm Password</label>
                                <input type="password" class="form-control" placeholder="Confirm Password" id="password2" name="password2" 
                                />
                              
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Phone number</label>
                                <input type="text" class="form-control" placeholder="Phone number" id="phoneno" name="phoneno" 
                                />
                              
                            </div>
                        </div>
                        
                        <br>
                     
                        <div class="row">
                            <div class="form-group col-xs-12">
                                <%-- <input type="submit" value="<spring:message code="label.add" /> " class="btn btn-success btn-lg"/> --%> 
                                <button type="submit" name="register" id="register" class="btn btn-success btn-lg">Register</button> 
                            </div>
                        </div>
                    </form>
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
                        <h3>Location</h3>
                        <p>San Jose, California</p>
                    </div>
                   
                    <div class="footer-col col-md-4">
                        <h3>About OnlineShoppe</h3>
                        <p>Online Shoppe is a developing e-business zone.</p>
                    </div>
                    
                     <div class="footer-col col-md-4">
                        <h3>Any Suggestions. Please Contact Us</h3>
                        <p>cmpe275project.onlineshoppe@gmail.com</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-below">
            <div class="container_footer">
                <div class="row">
                    <div class="col-lg-12">
                        Copyright@OnlineShoppe
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
