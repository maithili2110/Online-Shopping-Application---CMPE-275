<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel='stylesheet' href='/stylesheets/style.css' />
    <link rel='stylesheet' href='//netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css' />
  <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.0/css/font-awesome.css" />
<title>Reset Password</title>
<style>
h1 {
    text-shadow:5px 5px 10px black;
}

h2 {
    text-shadow:5px 5px 10px black;
}
 </style>
</head>
<body background="http://10steps.sg/wp-content/uploads/2012/11/White-christmas-light-background.jpg">
<nav class="navbar navbar-default">
    <div class="container">
      <div class="navbar-header">
        <a class="navbar-brand" href="/onlineshoppe/home"><img src="http://media.merchantcircle.com/19482392/Onlineshoppe_full.gif"  height="100" width="200"></a>
      </div>
      <ul class="nav navbar-nav navbar-right">
      <li><a href="/onlineshoppe/signIn"><i class="fa fa-check"></i>Login</a></li>
        <li><a href="/onlineshoppe"><i class="fa fa-edit"></i>Sign up </a></li>
      </ul>
    </div>
 </nav>
 <script>
 
 function initialize()
 {
 var x = document.getElementById("form").elements.length;
 for(var i =0; i<x-1;i++)
 {
      var field = document.getElementById("form").elements[i].value ;
      if(field == "")
      {
      alert("Values are missing.");
      return false;
      }
 }

      if (document.getElementById("password"))
      {
    	 
      	if(document.getElementById("password").value.length<6)
      	{
      alert("Password must be atleast 6 characters long.");
      return false;
      	}
     	 else if(document.getElementById("password").value != document.getElementById("password2").value)
     	 {
      alert("Passwords do not match.");
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
     
      
  
 	return true;

 }
 </script>   
</hr>
<div class="container" id="wrap">
	  <div class="row">
	  
        <div class="col-md-6 col-md-offset-3">
            <form:form method="post" id="form" action="resetPassword" commandName="user" onsubmit= "return initialize();">   
                    <h2 style="color:blue">Password Reset</h2>
                    ${message}
                    <div>
                    <form:label path="email" > <spring:message code="label.email"/></form:label>
        <form:input path="email" id="email" class="form-control input-lg" />
        </div>
                    <form:label path="password"  > <spring:message code="label.password"/></form:label>
        <form:input type="password" id="password" path="password" class="form-control input-lg" />
		   
		   <form:label path="password2" ><spring:message code="label.password2"/></form:label>
        <form:input type="password" path="password2" id="password2" class="form-control input-lg"/>
                    
                   <div><p>
                   
                   
                   </p>
                   
                   </div>
                <input type="submit" value="<spring:message code="label.reset" /> "  class="btn btn-lg btn-primary btn-block signup-btn"/>
            </form:form>
           
          </div>
</div>
</div>
</div>

</body>
</html>