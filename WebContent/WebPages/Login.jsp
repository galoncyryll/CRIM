<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Sign-Up/Login Form</title>

  
      <link rel="stylesheet" href="/Capstone/WebResources/style.css">
	 <link rel="stylesheet" href="/Capstone/WebResources/w3test.css">
<script>
history.forward();
</script>
  
</head>


<% if(session.getAttribute("status") != null && session.getAttribute("status").toString().equals("UserAdded")){%>
<body onload="document.getElementById('id01').style.display='block';">
<% session.removeAttribute("status"); } else if(session.getAttribute("status") != null && session.getAttribute("status").toString().equals("UserExists")){%>
<body onload="document.getElementById('id02').style.display='block';">
<% session.removeAttribute("status"); } else if(session.getAttribute("status") != null && session.getAttribute("status").toString().equals("AccountActive")){%>
<body onload="document.getElementById('id03').style.display='block';">
<% session.removeAttribute("status"); } else if(session.getAttribute("status") != null && session.getAttribute("status").toString().equals("Wrong")){%>
<body onload="document.getElementById('id04').style.display='block';">
<% }else{ %>
<body>
<%} %>
  <div class="form">
      
      <ul class="tab-group">
        <li class="tab active"><a href="#login">Log In</a></li>
        <li class="tab"><a href="#signup">Sign Up</a></li>
      
      </ul>
      
      <div class="tab-content">
      <div id="login">   
          <h1>Please Log In!</h1>
          
          <form action="/Capstone/Login" method="post">
          
            <div class="field-wrap">
            <label>
              User ID<span class="req">*</span>
            </label>
            <input type="text" name="userid" autocomplete="off" required/>
          </div>
          
          <div class="field-wrap">
            <label>
              Password<span class="req">*</span>
            </label>
            <input type="password" name="password" autocomplete="off" required/>
          </div>
          
          
          <button type="submit" class="button button-block">Log In</button>
          
          </form>

        </div>
      
        <div id="signup">   
          <h1>Sign Up</h1>
          
          <form action="/Capstone/Register" method="post">
          
          <div class="top-row">
            <div class="field-wrap">
              <label>
                First Name<span class="req">*</span>
              </label>
              <input type="text" required name="fname" autocomplete="off" />
            </div>
            
            <div class="field-wrap">
              <label>
                Middle Name<span class="req">*</span>
              </label>
              <input type="text" required name="mname" autocomplete="off" />
            </div>
        
            <div class="field-wrap">
              <label>
                Last Name<span class="req">*</span>
              </label>
              <input type="text"required name="lname" autocomplete="off"/>
            </div>
          </div>

          <div class="field-wrap">
            <label>
              User ID<span class="req">*</span>
            </label>
            <input type="text"required name="userid" autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label>
              Set A Password<span class="req">*</span>
            </label>
            <input type="password" required name="password" autocomplete="off"/>
          </div>
          
          <button type="submit" name="register" class="button button-block">Get Started</button>
          
          </form>

        </div>
              
      </div>
      <!-- tab-content -->
      
      <div id="id01" class="w3-modal">
  <div class="w3-modal-content w3-animate-top w3-card-8">
    <header class="w3-container w3-white">
      <span onclick="document.getElementById('id01').style.display='none'"
      class="w3-closebtn">&times;</span>
      <h2>Success</h2>
    </header>
    <div class="w3-container">
      <p>User Added!</p>
    </div>
  </div>
</div>

<div id="id02" class="w3-modal">
  <div class="w3-modal-content w3-animate-top w3-card-8">
    <header class="w3-container w3-white">
      <span onclick="document.getElementById('id02').style.display='none'" class="w3-closebtn">&times;</span>
      <h2>Oops Sorry</h2>
    </header>
    <div class="w3-container">
      <p>User Exists! Please try another user ID</p>
    </div>
  </div>
</div>

<div id="id03" class="w3-modal">
  <div class="w3-modal-content w3-animate-top w3-card-8">
    <header class="w3-container w3-white">
      <span onclick="document.getElementById('id03').style.display='none'" class="w3-closebtn">&times;</span>
      <h2>Warning</h2>
    </header>
    <div class="w3-container">
      <p>Account Active!</p>
    </div>
  </div>
</div>

<div id="id04" class="w3-modal">
  <div class="w3-modal-content w3-animate-top w3-card-8">
    <header class="w3-container w3-white">
      <span onclick="document.getElementById('id04').style.display='none'" class="w3-closebtn">&times;</span>
      <h2>Warning</h2>
    </header>
    <div class="w3-container">
      <p>Incorrect Username or Password!</p>
    </div>
  </div>
</div>
      
</div> <!-- /form -->
  <script src='/Capstone/WebResources/jquery.js'></script>

    <script src="/Capstone/WebResources/index.js"></script>

</body>
</html>
