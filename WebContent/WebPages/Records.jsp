<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="common.DataRow"
	import="common.DataRowCollection"
	import="common.Logger"
	import="common.SystemInfo"
	import="java.text.SimpleDateFormat"
	import="java.util.ArrayList"
	import= "java.sql.*"
    %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Records</title>

   	<!-- Custom CSS -->
    <link href="/Capstone/WebResources/bootstrap.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/Capstone/WebResources/modern-business.css" rel="stylesheet">
    <link href="/Capstone/WebResources/jquery.dataTables.css" rel="stylesheet">
	<link href="/Capstone/WebResources/recordstable.css" rel="stylesheet">
	<link href="/Capstone/WebResources/w3.css" rel="stylesheet">
    

    <!-- Custom Fonts -->
  

	
	<!--Custom Scripts-->
	<script src="/Capstone/WebResources/jquery.js"></script>
	<script src="/Capstone/WebResources/jquery.dataTables.js"></script>
	<script src="/Capstone/WebResources/bootstrap.min.js"></script>
	
	<!-- Exporter scripts -->
	<script src="/Capstone/WebResources/tableExport.js"></script>
	<script src="/Capstone/WebResources/jquery.base64.js"></script>
	
	<script src="/Capstone/WebResources/jspdf/libs/sprintf.js"></script>
	<script src="/Capstone/WebResources/jspdf/jspdf.js"></script>
	<script src="/Capstone/WebResources/jspdf/libs/base64.js"></script>
    <script src="/Capstone/WebResources/jspdf/html2canvas.js"></script>
    

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

<% if(session.getAttribute("status") != null && session.getAttribute("status").toString().equals("UserAdded")){%>
<body onload="document.getElementById('id01').style.display='block';">
<% session.removeAttribute("status"); } else if(session.getAttribute("status") != null && session.getAttribute("status").toString().equals("UserUpdated")){%>
<body onload="document.getElementById('id02').style.display='block';">
<% session.removeAttribute("status"); } else{%>
<body>
<% } %>
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
                <%} else{response.sendRedirect("/Capstone/WebPages/Login.jsp");}%>
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
                    Records
            </font>
				<button type="button" data-toggle="modal"  class="btn btn-success" data-target="#testModal">View Records</button>
			</div>
				<!--view patient modal-->
	<div class="modal fade" id="testModal" tabindex="-1" role="dialog" aria-labelledby="largeModal" aria-hidden="true">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true" >&times;</button>
            <h4 class="modal-title" id="myModalLabel">View Records</h4>
          </div>
          <div class="modal-body">
		  <!--modal body-->

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
									<th>Patient ID</th>
									<th>Lname</th>
									<th>Fname</th>
									<th>MI </th>
									<th>Gender </th>
									<th>Birthdate </th>
									<th>Age </th>
									<th>Contact	</th>
									<th>Address </th>
								</tr>
							</thead>
							
							<tfoot>
								<tr>
									<th>Patient ID</th>
									<th>Lname</th>
									<th>Fname</th>
									<th>MI </th>
									<th>Gender </th>
									<th>Birthdate </th>
									<th>Age </th>
									<th>Contact	</th>
									<th>Address </th>
								</tr>
							</tfoot>
							
							<tbody>
		<% 
        	String a = "";
        	DataRowCollection rows = SystemInfo.getDb().QueryDataRows("SELECT * FROM patient_records");
        	for(DataRow row : rows){
        %>
        	<tr>
	        	<td><%=row.getString("patient_number") %></td>
	        	<td><%=row.getString("lname") %></td>
	        	<td><%=row.getString("fname") %></td>
	        	<td><%=row.getString("mi") %></td>
	        	<td><%=row.getString("gender") %></td>
	        	<td><%=row.getString("birthdate") %></td>
	        	<td><%=row.getString("age") %></td>
	        	<td><%=row.getString("contact") %></td>
	        	<td><%=row.getString("address") %></td>
        	</tr>
        
         <% 		
        	}
        %> 
							</tbody>
					
					
						</table>

		  
		  <!--end modal body-->
		  </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>
	<!-- END VIEW PATIENT MODAL-->


       <form action="/Capstone/Records" method="post" class="data-form">
      <div class="formsc">
        <h1 id="h01">Personal Details</h1>
        
        
        <p>
         <label for="name">Patient ID:</label>
          <input type="text" id="name" name="patient_id" readonly placeholder="Patient ID will be automatically given">
          
          <label for="name">Last Name:</label>
          <input type="text" id="name" name="lname" required>
          
          <label for="lname">First Name:</label>
          <input type="text" id="lname" name="fname" required>
		  
		   <label for="lname">Middle Initial:</label>
          <input type="text" id="mi" name="mi" required>
          
     	 <label>Gender:(Male or Female)</label>
          <input type="text" id="gender" name="gender" required>
          
		  <label>Birthdate:(mm/dd/yyyy)</label>
          <input type="text" id="birthdate" name="birthdate" required>
          
          <label>Age:</label>
          <input type="text" id="age" name="age" required>
          
          <label>Contact No.</label>
          <input type="text" id="contact" name="contact" required>
        </p>
        <p>
          <label>Address</label>
          <input type="text" id="address" name="address" required>
          </fieldset>
          
        </p>
       
        
        <br><br><br><br><br>
    
          

        </fieldset>
        <button type="submit" class="buttonActive" name="btnAdd" id="btnAdd">Add Patient</button>
        <button type="submit" class="buttonAdd" name="btnUpdate" id="btnUpdate" disabled>Update Record</button>
        </form>
		</div>
            </div>
          </div>
		  
		  
            </div>
        </div>
     

      

    </div>
    <!-- /.container -->

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

	
	 $("td", this).on("click", function () {
	        var tds = $(this).parents("tr").find("td");
	        $.each(tds, function (i, v) {
	            $($(".data-form input")[i]).val($(v).text());
	            $('#testModal').modal('hide');
	            document.getElementById('btnAdd').disabled = true;
	            document.getElementById('btnAdd').style.backgroundColor = "#77766A";
	            document.getElementById('btnUpdate').style.backgroundColor = "#33ae3d";
	            document.getElementById('btnUpdate').disabled = false;            
	        });
	    });

var index = '-1';
 
var table = $('#reservationTable').DataTable({
	"dom": '<"top"l>rt<"bottom"ip><"clear"> '
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
      <p>User Added!</p>
    </div>
  </div>
</div>

<div id="id02" class="w3-modal">
  <div class="w3-modal-content w3-animate-top w3-card-8">
    <header class="w3-container w3-white">
      <span onclick="document.getElementById('id02').style.display='none'" class="w3-closebtn">&times;</span>
      <h2>Success</h2>
    </header>
    <div class="w3-container">
      <p>User updated!</p>
    </div>
  </div>
</div>

</body>

</html>
