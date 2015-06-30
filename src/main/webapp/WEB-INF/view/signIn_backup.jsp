<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel='stylesheet' href='/stylesheets/style.css' />
    <link rel='stylesheet' href='//netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css' />
  <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.0/css/font-awesome.css" />
<title>login</title>
</head>
<body background="http://10steps.sg/wp-content/uploads/2012/11/White-christmas-light-background.jpg">
<nav class="navbar navbar-default">
    <div class="container">
      <div class="navbar-header">
        <a class="navbar-brand" href="/onlineshoppe/home"><img src="http://media.merchantcircle.com/19482392/Onlineshoppe_full.gif"  height="100" width="200"></a>
      </div>
      <ul class="nav navbar-nav navbar-right">
      <li><a href="/onlineshoppe/adminLogin"><i class="fa fa-check"></i>admin login</a></li>
        <li><a href="/onlineshoppe"><i class="fa fa-edit"></i>Sign up </a></li>
      </ul>
    </div>
 </nav>   
</hr>
    <div id="login-overlay" class="modal-dialog">
      <div class="modal-content">
          <div class="modal-header">
             
              <h4 class="modal-title" id="myModalLabel">Login to OnlineShoppe</h4>
          </div>
          <div class="modal-body">
      <div class="row">		
     <h4 style="color:red"> ${message }		</h4>																																																																																																																																																																																																																																																																																																																																																								
                  <div class="col-xs-6">
                      <div class="well">
                          <form id="loginForm" method="POST" action="signIn" novalidate="novalidate">
                              <div class="form-group">
                                  <label for="Email-id" class="control-label">Email Id</label>
                                  <input type="text" class="form-control" id="email" name="email" value="" required="true" title="Please enter you email" placeholder="example@gmail.com">
                                  <span class="help-block"></span>
                              </div>
                              <div class="form-group">
                                  <label for="password" class="control-label">Password</label>
                                  <input type="password" class="form-control" id="password" name="password" value="" required="true" title="Please enter your password">
                                  <span class="help-block"></span>
                              </div>
                              <div id="loginErrorMsg" class="alert alert-error hide">Wrong username or password</div>
                               <button type="submit" class="btn btn-success btn-block">Login</button>
                          </form>
                      </div>
                  </div>
                  <div class="col-xs-6">
                      <ul class="list-unstyled" style="line-height: 2">
                          <li><span class="fa fa-check text-success"></span> Don't have an account</li>
                          <li><span class="fa fa-check text-success"></span> Click here to register</li>
                          </ul>
                      <p><a href="/onlineshoppe" class="btn btn-info btn-block">Register now!</a></p>
                  </div>
			<div class="col-xs-6">
                      <ul class="list-unstyled" style="line-height: 2">
                          <li><span class="fa fa-pencil "></span> Forgot password ?</li>
                          <li><span class="fa fa-pencil "></span> Click below to reset</li>
                          </ul>
                      <p><a href="/onlineshoppe/resetPassword" class="btn btn-info btn-block">Reset Password</a></p>
                  </div>
              </div>
          </div>
      </div>
  </div>
</body>
</html>