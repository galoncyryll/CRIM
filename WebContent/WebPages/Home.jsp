<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
	
    <title>Home</title>

    <!-- Bootstrap Core CSS -->
    <link href="/Capstone/WebResources/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/Capstone/WebResources/modern-business.css" rel="stylesheet">
    <link href="/Capstone/WebResources/w3test.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/Capstone/WebResources/Fonts/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

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


<% if(session.getAttribute("report") != null && session.getAttribute("report").toString().equals("report")){%>
<body onload="document.getElementById('id01').style.display='block';">
<%session.removeAttribute("status");}else{ %>
<body>
<% }%>

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
    <header id="myCarousel" class="carousel slide">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <div class="item active">
                <div class="fill" style="background-image:url('/Capstone/WebResources/Images/Dent1.JPG');"></div>
                <div class="carousel-caption">
                </div>
            </div>
            <div class="item">
                <div class="fill" style="background-image:url('/Capstone/WebResources/Images/Dent3.JPG');"></div>
                <div class="carousel-caption">
                </div>
            </div>
            <div class="item">
                <div class="fill" style="background-image:url('/Capstone/WebResources/Images/Dent2.JPG');"></div>
                <div class="carousel-caption">
                </div>
            </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="icon-prev"></span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="icon-next"></span>
        </a>
    </header>

    <!-- Page Content -->
     <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    Did You Know?
                </h1>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i> Interesting Facts about Teeth and
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Dentistry</h4>
                    </div>
                    <div class="panel-body">
                        <p>1. The average American spends 38.5 total days brushing their teeth over a lifetime.
 <br>                      
2. People who drink 3 or more glasses of soda each day have 62% more tooth decay, fillings and tooth loss than others. Put down the pop and sports drinks and pick up some nice fresh water instead.
<br>
3. Tooth enamel is the hardest substance in the human body. However, we do not recommend that you use your pearly whites to open bottle caps!
If you don’t floss, you miss cleaning 40% of your tooth surfaces. Make sure you brush and floss twice a day!
<br>
4. If you're right handed, you will chew your food on your right side. If you're left handed, you will tend to chew your food on your left side.
<br>
5. Every year, kids in North America spend close to half a million dollars on chewing gum.
More people use blue toothbrushes than red ones.
Like fingerprints, everyone's tongue print is different
<br>
6. The average woman smiles 62 times a day. The average man smiles about 8 times a day.
Kids laugh around 400 times a day, adults just 15 times a day.
<br>
7. Giraffes only have bottom teeth.
Just like finger prints, tooth prints are unique to each individual.
<br>
8. The average person only brushes for 45 to 70 seconds a day, the recommended amount of time is 2-3 minutes.
<br>
9. 78% of Americans have had at least 1 cavity by age 17.
<br>
10. 1882 was the year commercial floss was first manufactured.
</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i>Facts about Dental History</h4>
                    </div>
                    <div class="panel-body">
                        <p>1. In 1866, Lucy Beaman Hobbs became the first licensed female dentist.
                        <br>
2. In 1986, the winner of the National Spelling Bee won by spelling ODONTALGIA (which means toothache)
<br>
3. The average amount of money left by the tooth fairy in 1950 was 25 cents. In 1988 it was $1.00, the going rate now is $2.00.
<br>
4. The earliest dentist known by name is Hesi-Re. He lived in Egypt over 5,000 years ago.
The first toothbrushes were tree twigs. Chewing on the tips of the twigs spread out the fibers, which were then used to clean the teeth.
<br>
5. Ancient Greeks used pumice, talc, alabaster, coral powder or iron rust as toothpaste.
George Washington never had wooden teeth. His dentures were made from gold, hippopotamus tusk, elephant ivory and human teeth!
<br>
6. In 1905, Dental Assistant Irene Newman was trained to clean teeth. She became the first Dental Hygienist.
</p>
                       
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i> Healthy Teeth for Life</h4>
                    </div>
                    <div class="panel-body">
                        <p>1. Brush at least twice a day. The best time to brush teeth is after meals. Choose a toothbrush with a small head for better access to back teeth. Soft bristles are kinder on your gums.
<br>
2. Use fluoridated toothpaste. Fluoride helps to harden tooth enamel and reduces your risk of decay.
<br>
3. Brush thoroughly. Tooth brushing should take between two and three minutes.
<br>
4. Floss your teeth daily. Use a slow and gentle sawing motion.
<br>
5. Limit acidic drinks like soft drinks, cordials and fruit juices. Food acids soften tooth material and dissolve the minerals in tooth enamel, causing holes (cavities or caries). In severe cases, teeth may be ‘eaten’ right down to the gum.
<br>
6. Limit sugary foods. Bacteria in dental plaque change sugars into acids.
<br>
7. Protect your teeth from injury. Wear a mouthguard or full-face helmet when playing sports.
<br>
8. Try to save a knocked out tooth. If possible, hold the tooth back in place while you seek immediate dental advice. If this is not possible, wrap the tooth in plastic or place it in milk and seek dental advice immediately.
<br>
9. Avoid using your teeth for anything other than chewing food. If you use them to crack nuts, remove bottle tops or rip open packaging, you risk chipping or even breaking your teeth.
<br>
10. See your dentist for regular check-ups. You should also visit your dentist if you have a dental problem such as a toothache or bleeding gums.
<br>
 
</p>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.row -->

       
    <!-- jQuery -->
    <script src="/Capstone/WebResources/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/Capstone/WebResources/bootstrap.min.js"></script>

    <!-- Script to Activate the Carousel -->
    <script>
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    });
    </script>
<div id="id01" class="w3-modal">
  <div class="w3-modal-content w3-animate-top w3-card-8">
    <header class="w3-container w3-white">
      <span onclick="document.getElementById('id01').style.display='none'"
      class="w3-closebtn">&times;</span>
      <h2>Warning!</h2>
    </header>
    <div class="w3-container">
      <p>You are not allowed to access to page</p>
    </div>
  </div>
</div>
</body>

</html>
