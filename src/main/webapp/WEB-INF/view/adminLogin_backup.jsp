<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel='stylesheet' href='/stylesheets/style.css' />
    <link rel='stylesheet' href='//netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css' />
  <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.0/css/font-awesome.css" />
<title>adminLogin</title>
</head>
<body background="http://10steps.sg/wp-content/uploads/2012/11/White-christmas-light-background.jpg">
<nav class="navbar navbar-default">
    <div class="container">
      <div class="navbar-header">
        <a class="navbar-brand" href="/onlineshoppe/home"><img src="http://media.merchantcircle.com/19482392/Onlineshoppe_full.gif"  height="100" width="200"></a>
      </div>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="/onlineshoppe/signIn"><i class="fa fa-check"></i>User Login</a></li>
      </ul>
    </div>
 </nav>   
</hr>
    <div id="login-overlay" class="modal-dialog">
      <div class="modal-content">
          <div class="modal-header">
             
              <h4 class="modal-title" id="myModalLabel">AdminLogin to OnlineShoppe</h4>
          </div>
          <div class="modal-body">
      <div class="row">																																																																																																																																																																																																																																																																																																																																																												
                  <div class="col-xs-6">
                      <div class="well">
                          <form id="loginForm" method="POST" action="adminLogin" novalidate="novalidate">
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
                  
              </div>
          </div>
      </div>
  </div>
</body>
</html>