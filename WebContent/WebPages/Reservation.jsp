<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="common.DataRow"
	import="common.DataRowCollection"
	import="common.Logger"
	import="common.SystemInfo"
	import="java.text.SimpleDateFormat"
	import="java.util.ArrayList"
    %>
    <!DOCTYPE>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, user-scalable=no" />

	<title>Reservation</title>
	
	
	<!-- Bootstrap Core CSS -->
    <link href="/Capstone/WebResources/bootstrap.css" rel="stylesheet">
    
	
	<!-- Custom CSS -->
    <link href="/Capstone/WebResources/bootstrap.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/Capstone/WebResources/modern-business.css" rel="stylesheet">
    <link href="/Capstone/WebResources/jquery.dataTables.css" rel="stylesheet">
	<link href="/Capstone/WebResources/reservation.css" rel="stylesheet">
	<link rel="stylesheet" href="/Capstone/WebResources/w3test.css">
    

    <!-- Custom Fonts -->
    <link href="/Capstone/WebResources/Fonts/font-awesome.min.css" rel="stylesheet" type="text/css">

	
	<!--Custom Scripts-->
	<script src="/Capstone/WebResources/jquery.js"></script>
	<script src="/Capstone/WebResources/jquery.dataTables.js"></script>
	<script src="/Capstone/WebResources/bootstrap.min.js"></script>

	

	
	
	<script>  
var request;  
function sendInfo()  
{ 
var v2=document.dummy.dateselect.value;
var v=document.dummy.seatname.value;  
var url="/Capstone/WebPages/searcher.jsp?val="+v+"&val2="+v2;  
  
if(window.XMLHttpRequest){  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try{  
request.onreadystatechange=getInfo;  
request.open("GET",url,true);  
request.send();  
}catch(e){alert("Unable to connect to server");}  
}  
  
function getInfo(){  
if(request.readyState==4){  
var val=request.responseText;  
document.getElementById('time').innerHTML=val;  
}  
}  
  
</script>  


	<!-- Exporter scripts -->
	<script src="/Capstone/WebResources/tableExport.js"></script>
	<script src="/Capstone/WebResources/jquery.base64.js"></script>
	
	<script src="/Capstone/WebResources/jspdf/libs/sprintf.js"></script>
	<script src="/Capstone/WebResources/jspdf/jspdf.js"></script>
	<script src="/Capstone/WebResources/jspdf/libs/base64.js"></script>
	
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


<%if(session.getAttribute("status") != null && session.getAttribute("status").toString().equals("Book")){%>
<body onload="document.getElementById('id01').style.display='block';">
<% session.removeAttribute("status"); } else{%>
<body>
<%} %>


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
                    Reservation
                </font>
					<button type="button" data-toggle="modal" data-target="#reserveModal" class="btn btn-success">Make Reservation</button>
					
				<form id="dummy" name="dummy" method="post" action="/Capstone/Reservation">
				<input type="hidden" value="<%=session.getAttribute("user")%>" name="userid"></input>
					<div class="modal fade" id="reserveModal" tabindex="-1" role="dialog" aria-labelledby="largeModal" aria-hidden="true">
						<div class="modal-dialog modal-sm">
							<div class="modal-content">
								<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true" >&times;</button>
								<h4 class="modal-title" id="myModalLabel">Add Reservation</h4>
								</div>
								<div class="modal-body">
									<!--modal body-->
									<label> DATE:</label>
									<input type="date" id="dateselect" name="dateselect" onchange="sendInfo()"></input>
									<br>
									<br>
									
								<label> SEAT NAME: </label>
								<% 
    	String aaa = "";
    	DataRowCollection rowss = SystemInfo.getDb().QueryDataRows("SELECT * FROM module_table");
    	ArrayList<String> mod = new ArrayList<String>();
    	for(DataRow row : rowss){
    		mod.add(String.valueOf(row.getString("module_name")));
    	}
    	%>
				
									<select id="seatname" name="seatname" onchange="sendInfo()">
										<%for(int aa=0; aa < mod.size();aa++){%> <option><%=(mod.get(aa))%> </option><%}%>
										</select>
										
										<br>
										<br>
									<div id="time"></div>

									<!--end modal body-->
								</div>
								<div class="modal-footer">
								<button type="submit" class="btn btn-success">Book</button>
								<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
								</div>
								</form>
							</div>
						</div>
					</div>
											
					
				</div>
					<div class="form1">
					
						<div id="align-div" style="float:right;">
							<div id="div0" style="display:inline;">
								<label>Search by:</label>
								<select id="searchid" name="searhcColumn">
									<option value="-1">ALL</option>
							</select>
							</div>
							<div id="div1" style="display:inline-block;">
								<input class="w3-input w3-hover-green" type="text" name="search" id="searchh" placeholder="input here..">
							</div>			
						</div>

							
						<a href="#" class="btn btn-default" onClick ="$('#reservationTable').tableExport({type:'pdf',escape:'false'});">PDF</a>
						<a href="#" class="btn btn-default" onClick ="$('#reservationTable').tableExport({type:'excel',escape:'false'});">XLS</a>
						
						<table id="reservationTable" class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>Reservation ID</th>
									<th>User ID</th>
									<th>Date Reserved</th>
									<th>Seat Name</th>
									<th>Time Reserved</th>
								</tr>
							</thead>
							
							<tfoot>
								<tr>
									<th>Reservation ID</th>
									<th>User ID</th>	
									<th>Date Reserved</th>
									<th>Seat Name</th>
									<th>Time Reserved</th>
								</tr>
							</tfoot>
							
							<tbody>
		<% 
        	String a = "";
        	DataRowCollection rows = SystemInfo.getDb().QueryDataRows("SELECT * FROM reservation_table");
        	for(DataRow row : rows){
        %>
        	<tr>
	        	<td><%=row.getString("reservation_id") %></td>
	        	<td><%=row.getString("user_id") %></td>
	        	<td><%=row.getString("reserve_date") %></td>
	        	<td><%=row.getString("seat_name") %></td>
	        	<td><%=row.getString("reserve_time") %></td>
        	</tr>
        
         <% 		
        	}
        %> 
							</tbody>
					
					
						</table>
						
						
					</div>
<script>


	$(document).ready(function(){
	$('#genpdf').click(function(){
		$('#hidtype').val("pdf");
        $('#formReport').submit();
    });
	$('#genexcel').click(function(){
		$('#hidtype').val("excel");
        $('#formReport').submit();
    });
}); 

var index = '-1';
 
var table = $('#reservationTable').DataTable({
	"dom": '<"top"Bl>rt<"bottom"ip><"clear">'
});

$('#searchid').on('change', function() {
	 //alert( this.value ); // or $(this).val()
	 index = this.value;
});

$('#searchh').keyup(function(){
	if(index==='-1'){
		table.search($(this).val()).draw() ;
	} else{
		table.columns(index).search($(this).val()).draw() ;
	}
}); 

</script>
 
 <div id="id01" class="w3-modal">
  <div class="w3-modal-content w3-animate-top w3-card-8">
    <header class="w3-container w3-white">
      <span onclick="document.getElementById('id01').style.display='none'"
      class="w3-closebtn">&times;</span>
      <h2>Success</h2>
    </header>
    <div class="w3-container">
      <p>Record Added!</p>
    </div>
  </div>
</div>               
            </div>
        </div>
        
  <!-- Features Section -->
    

<!--dasfasdfasdfasdfasdfasdfasdf-->

</body>
</html>