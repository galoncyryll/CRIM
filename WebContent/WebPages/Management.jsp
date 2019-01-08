<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Management</title>

    <!-- Bootstrap Core CSS -->
    <link href="/Capstone/WebResources/bootstrap.css" rel="stylesheet">
    <!--Records Table CSS -->
    <link rel="stylesheet" href="/Capstone/WebResources/recordstable.css">

    <!-- Custom CSS -->
    <link href="/Capstone/WebResources/modern-business.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/Capstone/WebResources/Fonts/font-awesome.min.css" rel="stylesheet" type="text/css">
   

    
    

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
.check
{
    opacity:0.5;
	color:#996;
	
}

.buttonasd {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 10px 22px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
	border-radius: 4px;
}

</style>



</head>

<%

response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);
    if(session.getAttribute("user")==null){
    response.sendRedirect("/Capstone/WebPages/Login.jsp");

}
%>


<%if(session.getAttribute("authori") != null && session.getAttribute("authori").toString().equals("admin")){%>
<body>
<% }else{response.sendRedirect("/Capstone/WebPages/Home.jsp");
request.getSession().setAttribute("report","report");
}
%>

    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <% if(session.getAttribute("user") != null){%>
                <label style="padding: 10px 10px; font-size: 18px; color: #FFF;"><%=session.getAttribute("user")%></label>
                <%}else{response.sendRedirect("/Capstone/WebPages/Login.jsp");}%>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="Home.jsp">Home</a>
                    </li>
                    <li>
                        <a href="Records.jsp">Records</a>
                    </li>
                    <li>
                        <a href="Reservation.jsp">Reservation</a>
                    </li>
                    <li>
                        <a href="Consultation.jsp">Consultation</a>
                    </li>
                    <%if(session.getAttribute("authori") != null && session.getAttribute("authori").toString().equals("admin")){%>
  						<li>
                        <a href="Management.jsp">Management</a>
                    </li>
					<% }%>
                	<li>
                        <form action="/Capstone/Logout" method="post" id="formLogout">
                        <input type="hidden" value="<%=session.getAttribute("user")%>" name="userid"></input>
   				 		<button type="submit" name="btnLogout" id="btnLogout" style=" margin: 10px 10px;" class="btn btn-default">Logout</button>
						</form>
                    </li>      
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Header Carousel -->
   

    <!-- Page Content -->
    <div class="container">


	
        <!-- Marketing Icons Section -->
        <div class="row">
            <div class="col-lg-12">
			<div class="page-header">
               <font size="6.5px">
                    Management
            </font>
			</div>


	<div class="form1">
      <form action="/Capstone/Management" method="post">
      <div class="forms">
        <h1 id="h01">Add Disorder</h1>
        <button type="button" id="adddisorder" class="buttonasd">Add</button>
		<button type="button" id="deletedisorder" class="buttonasd" style="margin-bottom: 15px">Undo</button>
        <div id="disorderr">
		
		</div>
       
		 
      </div>
  
        <div class="forms">
        
        <h1 id="h01">Add Treatment</h1>
			
			<button type="button" id="addtreatment" class="buttonasd" style="margin-bottom: 15px">Add</button>
			<button type="button" id="deletetreatment" class="buttonasd">Undo</button>

          <div id="treatmentt">
		  
        </div>
        </div>
        
        
         <div class="forms">
        
        <h1 id="h01">Add Seats</h1>
			
			<button type="button" id="addseat" class="buttonasd" style="margin-bottom: 15px">Add</button>
			<button type="button" id="deleteseat" class="buttonasd">Undo</button>

          <div id="seatt">
		  
        </div>
	</div>








        
        <br><br><br><br><br>
    
         
        

      
        <button type="submit" class="buttonAdd">Save Changes</button>
        </form>
		
     </div>
    </div>	  
   </div>
</div>
     

      

    </div>
    <!-- /.container -->
    
    
     <!-- TOOTH SCRIPT -->
    <script src="/Capstone/WebResources/toothscript.js"></script>
	
    <!-- jQuery -->
    <script src="/Capstone/WebResources/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/Capstone/WebResources/bootstrap.min.js"></script>

    <script>
	
	
	$(document).ready(function() {
	var i = 0;
		
		$('#deletedisorder').click(function() {
			if(i > 0){
				$('#divdisorder' + i).remove();
				i= i-1;
			}
		});
			

		$('#adddisorder').click(function() {
		i = i+1 ;	
			$('#disorderr').append('<div id=\"divdisorder'+ i +'\"><label>Disorder Name: <input type="text" name ="inputdisorder1" ></div>');
		});

		$('#deletetreatment').click(function() {
			if(i > 0){
				$('#divtreatment' + i).remove();
				i= i-1;
			}
		});
			

		$('#addtreatment').click(function() {
		i = i+1 ;	
			$('#treatmentt').append('<div id=\"divtreatment'+ i +'\"><label>Treatment Name: <input type="text" name="inputtreatment1" ></div>');
		});

		
		$('#addseat').click(function() {
			i = i+1 ;	
				$('#seatt').append('<div id=\"divseat'+ i +'\"><label>Module Name: <input type="text" name="inputseat1" ></div>');
			});

		$('#deleteseat').click(function() {
			if(i > 0){
				$('#divseat' + i).remove();
				i= i-1;
			}
		});
	
	});
	

	
	
	</script>
    
<%
    response.setHeader( "Cache-Control", "no-store, no-cache, must-revalidate");  //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", -1); //prevents caching at the proxy server
%>

	
</body>

</html>
