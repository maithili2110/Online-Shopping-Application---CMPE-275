<%-- <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
                
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel='stylesheet' href='/stylesheets/style.css' />
    <link rel='stylesheet' href='//netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css' />
  <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.0/css/font-awesome.css" />
<title>Sign up</title>
<style>
h1 {
    text-shadow:5px 5px 10px black;
}

h2 {
    text-shadow:5px 5px 10px black;
}
 </style>
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

<body background="http://10steps.sg/wp-content/uploads/2012/11/White-christmas-light-background.jpg">
<nav class="navbar navbar-default">
    <div class="container">
      <div class="navbar-header">
        <a class="navbar-brand" href="/onlineshoppe/home"><img src="http://media.merchantcircle.com/19482392/Onlineshoppe_full.gif"  height="100" width="200"></a>
      </div>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="/onlineshoppe/signIn"><i class="fa fa-check"></i> login</a></li>
      </ul>
    </div>
 </nav>  
<div class="container" id="wrap">
	  <div class="row">
	  
        <div class="col-md-6 col-md-offset-3">
            <form:form method="post" action="add" id="form" commandName="user" onsubmit="return initialize()">   
            <h1 class='text-center'><span class="label label-primary">Create your Online Shoppe Account today</span></h1>
            
                   <h3 style="color:red"> ${message}</h3>
                    <div class="row">
                        <div class="col-xs-6 col-md-6">
                            <form:label path="firstname" id="firstname"><spring:message code="label.firstname"/></form:label>
       					    <form:input path="firstname" id="firstname" class="form-control input-lg" />               
                       </div>
                        <div class="col-xs-6 col-md-6">
                            <form:label path="lastname" ><spring:message code="label.lastname"/></form:label>
       						<form:input path="lastname" id="lastname" class="form-control input-lg"/>
                        </div>
                    </div>
                    	<form:label path="email" > <spring:message code="label.email"/></form:label>
        				<form:input path="email" id="email" class="form-control input-lg" />
		   
                    	<form:label path="password" ><spring:message code="label.password"/></form:label>
        				<form:input type="password" id="password" path="password" class="form-control input-lg"/>
        				
        				<form:label path="password2" > <spring:message code="label.password2"/></form:label>
        				<form:input type="password" path="password2" id="password2" class="form-control input-lg" />
		   
                    	<form:label path="phoneno" ><spring:message code="label.phone"/></form:label>
        				<form:input type="phoneno" id="phoneno" path="phoneno" class="form-control input-lg"/>
                   <div><p>
                   
                   
                   </p>
                   
                   </div>
                <input type="submit" value="<spring:message code="label.add" /> " class="btn btn-lg btn-primary btn-block signup-btn"/>
            </form:form>
           
          </div>
</div>
</div>

</body>
</html> --%>