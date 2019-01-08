<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="common.DataRow"
	import="common.DataRowCollection"
	import="common.Logger"
	import="common.SystemInfo"
	import="java.text.SimpleDateFormat"
	import="java.util.ArrayList"
	import="java.util.*"
	import= "java.sql.*"
	import= "javax.servlet.*"
	import= "javax.servlet.http.*"
    %>
<!DOCTYPE>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Consultation</title>

    <!-- Bootstrap Core CSS -->
    <link href="/Capstone/WebResources/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="/Capstone/WebResources/w3test.css">
    <!--Records Table CSS -->
    <link rel="stylesheet" href="/Capstone/WebResources/reservation.css">

    <!-- Custom CSS -->
    <link href="/Capstone/WebResources/modern-business.css" rel="stylesheet">
    <link href="/Capstone/WebResources/jquery.dataTables.css" rel="stylesheet">


    <!-- Custom Fonts -->
    
   
	
    <!-- jQuery -->
  	 <script src="/Capstone/WebResources/jquery.js"></script>
	<script src="/Capstone/WebResources/jquery.dataTables.js"></script>
	<script src="/Capstone/WebResources/bootstrap.min.js"></script>
    
    

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


<%if(session.getAttribute("status") != null && session.getAttribute("status").toString().equals("RecordAdd")){%>
<body onload="document.getElementById('id01').style.display='block';">
<%session.removeAttribute("status"); } else{%>
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
                    Consultation
            </font>
            <button type="button"  class="btn btn-success" data-toggle="modal" data-target="#conModal">View Consultation Records</button>
			</div>
			
			 <!--view con modal-->
	<div class="modal fade" id="conModal" tabindex="-1" role="dialog" aria-labelledby="largeModal" aria-hidden="true">
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
								<select id="searchid2" name="searhcColumn">
									<option value="-1">ALL</option>
									<option value="0">CONSULTATION ID</option>
									<option value="1">USER ID</option>
									<option value="2">PATIENT ID</option>
									<option value="3">LAST NAME</option>
									<option value="4">FIRST NAME</option>
									<option value="5">TOOTH NUMBER</option>
									<option value="6">DISORDER</option>
									<option value="7">TREATMENT</option>
									<option value="8">PRESCRIPTION</option>
									<option value="9">REMARKS</option>
								
							</select>
							</div>
							<div id="div1" style="display:inline-block;">
								<input class="w3-input w3-hover-green" type="text" name="search" id="searchh2" placeholder="input here..">
							</div>			
						</div>

							
						
						<a href="#" class="btn btn-default" onClick ="$('#conTable').tableExport({type:'pdf',escape:'false'});">PDF</a>
						<a href="#" class="btn btn-default" onClick ="$('#conTable').tableExport({type:'excel',escape:'false'});">XLS</a>
						
						<table id="conTable" class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>Consltn ID</th>
									<th>User ID </th>
									<th>Patient ID</th>
									<th>Last Name</th>
									<th>First Name</th>
									<th>Tooth Number</th>
									<th>Disorder</th>
									<th>Treatment</th>
									<th>Prescription</th>
									<th>Remarks</th>
								</tr>
							</thead>
							
							<tfoot>
								<tr>
									<th>Consltn ID</th>
									<th>User ID </th>
									<th>Patient ID</th>
									<th>Last Name</th>
									<th>First Name</th>
									<th>Tooth Number</th>
									<th>Disorder</th>
									<th>Treatment</th>
									<th>Prescription</th>
									<th>Remarks</th>
								</tr>
							</tfoot>
							
							<tbody>
		<% 
        	String c = "";
        	DataRowCollection crows = SystemInfo.getDb().QueryDataRows("SELECT * FROM consultation_table");
        	for(DataRow row : crows){
        %>
        	<tr>
	        	<th><%=row.getString("consultation_id") %></th>
	        	<th><%=row.getString("user_id") %></th>
	        	<th><%=row.getString("patient_id") %></th>
	        	<th><%=row.getString("lname") %></th>
	        	<th><%=row.getString("fname") %></th>
	        	<th><%=row.getString("tooth_number") %></th>
	        	<th><%=row.getString("disorder") %></th>
	        	<th><%=row.getString("treatment") %></th>
	        	<th><%=row.getString("prescriptions") %></th>
	        	<th><%=row.getString("remarks") %></th>
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
	<!-- END VIEW con MODAL-->
			
<div class="formconsultation">	   
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
								<select id="searchid1" name="searhcColumn">
									<option value="-1">ALL</option>
									<option value="0">PATIENT ID</option>
									<option value="1">LAST NAME</option>
									<option value="2">FIRST NAME</option>
									<option value="3">MI</option>
									<option value="4">GENDER</option>
									<option value="5">BIRTHDATE</option>
									<option value="6">AGE</option>
									<option value="7">CONTACT</option>
									<option value="8">ADDRESS</option>
								
							</select>
							</div>
							<div id="div1" style="display:inline-block;">
								<input class="w3-input w3-hover-green" type="text" name="search" id="searchh1" placeholder="input here..">
							</div>			
						</div>

							
						
						<a href="#" class="btn btn-default" onClick ="$('#reservationTable').tableExport({type:'pdf',escape:'false'});">PDF</a>
						<a href="#" class="btn btn-default" onClick ="$('#reservationTable').tableExport({type:'excel',escape:'false'});">XLS</a>
						
						<table id="reservationTable" class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th id="testclick">Patient ID </th>
									<th id="testclick">Last Name </th>
									<th id="testclick">First Name </th>
								
								</tr>
							</thead>
							
							<tfoot>
								<tr>
									<th id="testclick">Patient ID</th>
									<th id="testclick">Last Name </th>
									<th id="testclick">First Name</th>
								
								</tr>
							</tfoot>
							
							<tbody>
		<% 
        	String b = "";
        	DataRowCollection brows = SystemInfo.getDb().QueryDataRows("SELECT * FROM patient_records");
        	for(DataRow row : brows){
        %>
        	<tr id="testclick2">
	        	<td><%=row.getString("patient_number") %></td>
	        	<td><%=row.getString("lname") %></td>
	        	<td><%=row.getString("fname") %></td>
	        	
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
	
	  
		
	
<div class="formc">
	
 <form action="/Capstone/Consultation" method="post" class="data-form">

 <div class="divleft">
  		
 		<label>Patient ID: </label>
	    <button type="button" data-toggle="modal" data-target="#testModal"  class="btn btn-success" id="testModal" >Search Patient Records</button>   
	   <br>
	    <br>
	    <input type="text" id="patient_id" name="patient_id" style="margin-bottom:10px;" placeholder="Search patient records" required readonly></input><br>
	    
		<label>Last Name:</label><br>
		<input type="text" id="lname" name="lname" placeholder="Search patient records" required readonly></input><br>
		<label>First Name:</label><br>
		<input type="text" id="fname" name="fname" placeholder="Search patient records" required readonly></input><br><br>
	    <button type="button" id="add" class="buttonasd" type="button" data-toggle="modal" data-target="#largeModal">Teeth</button>
		<button type="button" id="delete" class="buttonasd">Undo</button><br><br>
         
        <div class="modal fade" id="largeModal" tabindex="-1" role="dialog" aria-labelledby="largeModal" aria-hidden="true">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true" >&times;</button>
            <h4 class="modal-title" id="myModalLabel">Please Select Teeth</h4>
          </div>
          <div class="modal-body">
         <!--MODAL BODY -->
		 
         <button type="button" class="btn btn-primary" id="tooth1" data-dismiss="modal"><img src="\Capstone\WebResources\Images\tooth1.jpg" class="img-thumbnail img-check"></button>
         
         <button type="button" class="btn btn-primary" id="tooth2" data-dismiss="modal"><img src="\Capstone\WebResources\Images\tooth2.jpg" class="img-thumbnail img-check"></button>
         
         <button type="button" class="btn btn-primary" id="tooth3" data-dismiss="modal"><img src="\Capstone\WebResources\Images\tooth3.jpg" class="img-thumbnail img-check"></button>
         
        <button type="button" class="btn btn-primary" id="tooth4" data-dismiss="modal"><img src="\Capstone\WebResources\Images\tooth4.jpg" class="img-thumbnail img-check"></button>
         
          <button type="button" class="btn btn-primary" id="tooth5" data-dismiss="modal"><img src="\Capstone\WebResources\Images\tooth5.jpg" class="img-thumbnail img-check"></button>
          
           <button type="button" class="btn btn-primary" id="tooth6" data-dismiss="modal"><img src="\Capstone\WebResources\Images\tooth6.jpg" class="img-thumbnail img-check"></button>
           
           <button type="button" class="btn btn-primary" id="tooth7" data-dismiss="modal"><img src="\Capstone\WebResources\Images\tooth7.jpg" class="img-thumbnail img-check"></button>
            
           <button type="button" class="btn btn-primary" id="tooth8" data-dismiss="modal"><img src="\Capstone\WebResources\Images\tooth8.jpg" class="img-thumbnail img-check"></button>
             
            <button type="button" class="btn btn-primary" id="tooth9" data-dismiss="modal"><img src="\Capstone\WebResources\Images\tooth9.jpg" class="img-thumbnail img-check"></button>
              
             <button type="button" class="btn btn-primary" id="tooth10" data-dismiss="modal"><img src="\Capstone\WebResources\Images\tooth10.jpg" class="img-thumbnail img-check"></button>
               
            <button type="button" class="btn btn-primary" id="tooth11" data-dismiss="modal"><img src="\Capstone\WebResources\Images\tooth11.jpg" class="img-thumbnail img-check"></button>
                
             <button type="button" class="btn btn-primary" id="tooth12" data-dismiss="modal"><img src="\Capstone\WebResources\Images\tooth12.jpg" class="img-thumbnail img-check"></button>
                
             <button type="button" class="btn btn-primary" id="tooth13" data-dismiss="modal"><img src="\Capstone\WebResources\Images\tooth13.jpg" class="img-thumbnail img-check"></button>
                
             <button type="button" class="btn btn-primary" id="tooth14" data-dismiss="modal"><img src="\Capstone\WebResources\Images\tooth14.jpg" class="img-thumbnail img-check"></button>
                
             <button type="button" class="btn btn-primary" id="tooth15" data-dismiss="modal"><img src="\Capstone\WebResources\Images\tooth15.jpg" class="img-thumbnail img-check"></button>
                
             <button type="button" class="btn btn-primary" id="tooth16" data-dismiss="modal"><img src="\Capstone\WebResources\Images\tooth16.jpg" class="img-thumbnail img-check"></button>
                
                <br>
                <br>
                <br>
                
                
             <button type="button" class="btn btn-primary" id="tooth32" data-dismiss="modal"><img src="\Capstone\WebResources\Images\tooth32.jpg" class="img-thumbnail img-check"></button>
                
             <button type="button" class="btn btn-primary" id="tooth31" data-dismiss="modal"><img src="\Capstone\WebResources\Images\tooth31.jpg" class="img-thumbnail img-check"></button>
                
             <button type="button" class="btn btn-primary" id="tooth30" data-dismiss="modal"><img src="\Capstone\WebResources\Images\tooth30.jpg" class="img-thumbnail img-check"></button>
                
              <button type="button" class="btn btn-primary" id="tooth29" data-dismiss="modal"><img src="\Capstone\WebResources\Images\tooth29.jpg" class="img-thumbnail img-check"></button>
                
             <button type="button" class="btn btn-primary" id="tooth28" data-dismiss="modal"><img src="\Capstone\WebResources\Images\tooth28.jpg" class="img-thumbnail img-check"></button>
                
             <button type="button" class="btn btn-primary" id="tooth27" data-dismiss="modal"><img src="\Capstone\WebResources\Images\tooth27.jpg" class="img-thumbnail img-check"></button>
                
             <button type="button" class="btn btn-primary" id="tooth26" data-dismiss="modal"><img src="\Capstone\WebResources\Images\tooth26.jpg" class="img-thumbnail img-check"></button>
                
             <button type="button" class="btn btn-primary" id="tooth25" data-dismiss="modal"><img src="\Capstone\WebResources\Images\tooth25.jpg" class="img-thumbnail img-check"></button>
                
             <button type="button" class="btn btn-primary" id="tooth24" data-dismiss="modal"><img src="\Capstone\WebResources\Images\tooth24.jpg" class="img-thumbnail img-check"></button>
                
             <button type="button" class="btn btn-primary" id="tooth23" data-dismiss="modal"><img src="\Capstone\WebResources\Images\tooth23.jpg" class="img-thumbnail img-check"></button>
                
             <button type="button" class="btn btn-primary" id="tooth22" data-dismiss="modal"><img src="\Capstone\WebResources\Images\tooth22.jpg" class="img-thumbnail img-check"></button>
                
             <button type="button" class="btn btn-primary" id="tooth21" data-dismiss="modal"><img src="\Capstone\WebResources\Images\tooth21.jpg" class="img-thumbnail img-check"></button>
                
             <button type="button" class="btn btn-primary" id="tooth20" data-dismiss="modal"><img src="\Capstone\WebResources\Images\tooth20.jpg" class="img-thumbnail img-check"></button>
                
             <button type="button" class="btn btn-primary" id="tooth19" data-dismiss="modal"><img src="\Capstone\WebResources\Images\tooth19.jpg" class="img-thumbnail img-check"></button>
                
             <button type="button" class="btn btn-primary" id="tooth18" data-dismiss="modal"><img src="\Capstone\WebResources\Images\tooth18.jpg" class="img-thumbnail img-check"></button>
              
             <button type="button" class="btn btn-primary" id="tooth17" data-dismiss="modal"><img src="\Capstone\WebResources\Images\tooth17.jpg" class="img-thumbnail img-check"></button>
       
         <!-- END MODAL BODY-->
          </div>
          <div class="modal-footer">
            
          </div>
        </div>
      </div>
    </div>
</div>
 <input type="hidden" value="<%=session.getAttribute("user")%>" name="userid" ></input>
<div id="trytest" class="divtest">
</div> 
	</div>	

	  <button type="submit" class="buttonAdd" name="btnAdd">Save Changes</button>
	   
	  </form>
	  
	<!-- end div consultation-->
	</div>
</div>
  
        <br><br><br><br><br>
          
      </div>
    
   </div>


    <!-- /.container -->
    
    
  

   <script>
   $(document).ready(function () {
	   $("td", this).on("click", function () {
	        var tds = $(this).parents("tr").find("td");
	        
	        $.each(tds, function (i, v) {
	            $($(".data-form input")[i]).val($(v).text());
	            $('#testModal').modal('hide');	 
	        });
	    });
	});
	
	$(document).ready(function() {
		
		var i = 1;
		
		$('#delete').click(function() {
			if(i > 1){
				$('#addtooth' + i).remove();
				i= i-1;
			}
		});

		

		<% 
    	String a = "";
    	DataRowCollection rows = SystemInfo.getDb().QueryDataRows("SELECT * FROM disorder_table");
    	DataRowCollection rowss = SystemInfo.getDb().QueryDataRows("SELECT * FROM treatment_table");
    	ArrayList<String> dsrd = new ArrayList<String>();
    	ArrayList<String> treat = new ArrayList<String>();
    	for(DataRow row : rows){
    		dsrd.add(String.valueOf(row.getString("disorder_name")));
    	}
    	for(DataRow row : rowss){
    		treat.add(String.valueOf(row.getString("treatment_name")));
    	}
    	%>
	
		$('#tooth1').click(function() {
		i = i+1 ;	
		
			$('#trytest').append('<div id=\"addtooth'+ i +'\" class="divappend"><input type="text" name="tooth1" value="tooth1" readonly> <select id="disorder1" name="disorder1"><%for(int aa=0; aa < dsrd.size();aa++){%> <option><%=(dsrd.get(aa))%> </option><%}%></select> <select id="treatment1" name="treatment1"><%for(int aa=0; aa < treat.size();aa++){%> <option><%=(treat.get(aa))%></option><%}%></select><br><br><label>Prescription: </label> &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;<label> Remarks:</label><br><textarea id=\"addpres'+i+'\" name="pres1" cols="25" rows="6"></textarea> <textarea id=\"remarks'+i+'\" name="remarks1" cols="25" rows="6"></textarea>  </div>');
		});
		  		
		$('#tooth2').click(function() {
		i = i+1 ;
			$('#trytest').append('<div id=\"addtooth'+ i +'\" class="divappend"><input type="text" name="tooth2" value="tooth2" readonly> <select id="disorder2" name="disorder2"><%for(int aa=0; aa < dsrd.size();aa++){%> <option><%=(dsrd.get(aa))%> </option><%}%></select> <select id="treatment2" name="treatment2"><%for(int aa=0; aa < treat.size();aa++){%> <option><%=(treat.get(aa))%></option><%}%></select><br><br><label>Prescription: </label> &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;<label> Remarks:</label><br><textarea id=\"addpres'+i+'\" name="pres2" cols="25" rows="6"></textarea> <textarea id=\"remarks'+i+'\" name="remarks2" cols="25" rows="6"></textarea>  </</div>');
		});

		$('#tooth3').click(function() {
		i = i+1 ;
			$('#trytest').append('<div id=\"addtooth'+ i +'\" class="divappend"><input type="text" name="tooth3" value="tooth3" readonly> <select id="disorder3" name="disorder3"><%for(int aa=0; aa < dsrd.size();aa++){%> <option><%=(dsrd.get(aa))%> </option><%}%></select> <select id="treatment3" name="treatment3"><%for(int aa=0; aa < treat.size();aa++){%> <option><%=(treat.get(aa))%></option><%}%></select><br><br><label>Prescription: </label> &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;<label> Remarks:</label><br><textarea id=\"addpres'+i+'\ "name="pres3" cols="25" rows="6"></textarea> <textarea id=\"remarks'+i+'\" name="remarks3" cols="25" rows="6"></textarea>  </</div>');
		});
		$('#tooth4').click(function() {
		i = i+1 ;
			$('#trytest').append('<div id=\"addtooth'+ i +'\" class="divappend"><input type="text" name="tooth4" value="tooth4" readonly> <select id="disorder4" name="disorder4"><%for(int aa=0; aa < dsrd.size();aa++){%> <option><%=(dsrd.get(aa))%> </option><%}%></select> <select id="treatment4" name="treatment4"><%for(int aa=0; aa < treat.size();aa++){%> <option><%=(treat.get(aa))%></option><%}%></select><br><br><label>Prescription: </label> &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;<label> Remarks:</label><br><textarea id=\"addpres'+i+'\" name="pres4" cols="25" rows="6"></textarea> <textarea id=\"remarks'+i+'\" name="remarks4" cols="25" rows="6"></textarea>  </div>');
		});
		
		$('#tooth5').click(function() {
		i = i+1 ;
			$('#trytest').append('<div id=\"addtooth'+ i +'\" class="divappend"><input type="text" name="tooth5" value="tooth5" readonly> <select id="disorder5" name="disorder5"><%for(int aa=0; aa < dsrd.size();aa++){%> <option><%=(dsrd.get(aa))%> </option><%}%></select> <select id="treatment5" name="treatment5"><%for(int aa=0; aa < treat.size();aa++){%> <option><%=(treat.get(aa))%></option><%}%></select><br><br><label>Prescription: </label> &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;<label> Remarks:</label><br><textarea id=\"addpres'+i+'\" name="pres5" cols="25" rows="6"></textarea> <textarea id=\"remarks'+i+'\" name="remarks5" cols="25" rows="6"></textarea>  </div>');
		});
		
		$('#tooth6').click(function() {
		i = i+1 ;
			$('#trytest').append('<div id=\"addtooth'+ i +'\" class="divappend"><input type="text" name="tooth6" value="tooth6" readonly> <select id="disorder6" name="disorder6"><%for(int aa=0; aa < dsrd.size();aa++){%> <option><%=(dsrd.get(aa))%> </option><%}%></select> <select id="treatment6" name="treatment6"><%for(int aa=0; aa < treat.size();aa++){%> <option><%=(treat.get(aa))%></option><%}%></select><br><br><label>Prescription: </label> &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;<label> Remarks:</label><br><textarea id=\"addpres'+i+'\" name="pres6" cols="25" rows="6"></textarea> <textarea id=\"remarks'+i+'\" name="remarks6" cols="25" rows="6"></textarea>  </div>');
		});
		
		$('#tooth7').click(function() {
		i = i+1 ;
			$('#trytest').append('<div id=\"addtooth'+ i +'\" class="divappend"><input type="text" name="tooth7" value="tooth7" readonly> <select id="disorder7" name="disorder7"><%for(int aa=0; aa < dsrd.size();aa++){%> <option><%=(dsrd.get(aa))%> </option><%}%></select> <select id="treatment7" name="treatment7"><%for(int aa=0; aa < treat.size();aa++){%> <option><%=(treat.get(aa))%></option><%}%></select><br><br><label>Prescription: </label> &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;<label> Remarks:</label><br><textarea id=\"addpres'+i+'\" name="pres7" cols="25" rows="6"></textarea> <textarea id=\"remarks'+i+'\" name="remarks7" cols="25" rows="6"></textarea>  </div>');
		});
		
		$('#tooth8').click(function() {
		i = i+1 ;
			$('#trytest').append('<div id=\"addtooth'+ i +'\" class="divappend"><input type="text" name="tooth8" value="tooth8" readonly> <select id="disorder8" name="disorder8"><%for(int aa=0; aa < dsrd.size();aa++){%> <option><%=(dsrd.get(aa))%> </option><%}%></select> <select id="treatment8" name="treatment8"><%for(int aa=0; aa < treat.size();aa++){%> <option><%=(treat.get(aa))%></option><%}%></select><br><br><label>Prescription: </label> &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;<label> Remarks:</label><br><textarea id=\"addpres'+i+'\" name="pres8" cols="25" rows="6"></textarea> <textarea id=\"remarks'+i+'\" name="remarks8" cols="25" rows="6"></textarea>  </div>');
		});
		
		$('#tooth9').click(function() {
		i = i+1 ;
			$('#trytest').append('<div id=\"addtooth'+ i +'\" class="divappend"><input type="text" name="tooth9" value="tooth9" readonly> <select id="disorder9" name="disorder9"><%for(int aa=0; aa < dsrd.size();aa++){%> <option><%=(dsrd.get(aa))%> </option><%}%></select> <select id="treatment9" name="treatment9"><%for(int aa=0; aa < treat.size();aa++){%> <option><%=(treat.get(aa))%></option><%}%></select><br><br><label>Prescription: </label> &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;<label> Remarks:</label><br><textarea id=\"addpres'+i+'\" name="pres9" cols="25" rows="6"></textarea> <textarea id=\"remarks'+i+'\" name="remarks9" cols="25" rows="6"></textarea>  </div>');
		});
		
		$('#tooth10').click(function() {
		i = i+1 ;
			$('#trytest').append('<div id=\"addtooth'+ i +'\" class="divappend"><input type="text" name="tooth10" value="tooth10" readonly> <select id="disorder10" name="disorder10"><%for(int aa=0; aa < dsrd.size();aa++){%> <option><%=(dsrd.get(aa))%> </option><%}%></select> <select id="treatment10" name="treatment10"><%for(int aa=0; aa < treat.size();aa++){%> <option><%=(treat.get(aa))%></option><%}%></select><br><br><label>Prescription: </label> &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;<label> Remarks:</label><br><textarea id=\"addpres'+i+'\" name="pres10" cols="25" rows="6"></textarea> <textarea id=\"remarks'+i+'\" name="remarks10" cols="25" rows="6"></textarea>  </div>');
		});
		
		$('#tooth11').click(function() {
		i = i+1 ;
			$('#trytest').append('<div id=\"addtooth'+ i +'\" class="divappend"><input type="text" name="tooth11" value="tooth11" readonly> <select id="disorder11" name="disorder11"><%for(int aa=0; aa < dsrd.size();aa++){%> <option><%=(dsrd.get(aa))%> </option><%}%></select> <select id="treatment11" name="treatment11"><%for(int aa=0; aa < treat.size();aa++){%> <option><%=(treat.get(aa))%></option><%}%></select><br><br><label>Prescription: </label> &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;<label> Remarks:</label><br><textarea id=\"addpres'+i+'\" name="pres11" cols="25" rows="6"></textarea> <textarea id=\"remarks'+i+'\" name="remarks11" cols="25" rows="6"></textarea>  </div>');
		});
		
		$('#tooth12').click(function() {
		i = i+1 ;
			$('#trytest').append('<div id=\"addtooth'+ i +'\" class="divappend"><input type="text" name="tooth12" value="tooth12" readonly> <select id="disorder12" name="disorder12"><%for(int aa=0; aa < dsrd.size();aa++){%> <option><%=(dsrd.get(aa))%> </option><%}%></select> <select id="treatment12" name="treatment12"><%for(int aa=0; aa < treat.size();aa++){%> <option><%=(treat.get(aa))%></option><%}%></select><br><br><label>Prescription: </label> &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;<label> Remarks:</label><br><textarea id=\"addpres'+i+'\" name="pres12" cols="25" rows="6"></textarea> <textarea id=\"remarks'+i+'\" name="remarks12" cols="25" rows="6"></textarea>  </div>');
		});
		
		$('#tooth13').click(function() {
		i = i+1 ;
			$('#trytest').append('<div id=\"addtooth'+ i +'\" class="divappend"><input type="text" name="tooth13" value="tooth13" readonly> <select id="disorder13" name="disorder13"><%for(int aa=0; aa < dsrd.size();aa++){%> <option><%=(dsrd.get(aa))%> </option><%}%></select> <select id="treatment13" name="treatment13"><%for(int aa=0; aa < treat.size();aa++){%> <option><%=(treat.get(aa))%></option><%}%></select><br><br><label>Prescription: </label> &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;<label> Remarks:</label><br><textarea id=\"addpres'+i+'\" name="pres13" cols="25" rows="6"></textarea> <textarea id=\"remarks'+i+'\" name="remarks13" cols="25" rows="6"></textarea>  </div>');
		});
		
		$('#tooth14').click(function() {
		i = i+1 ;
			$('#trytest').append('<div id=\"addtooth'+ i +'\" class="divappend"><input type="text" name="tooth14" value="tooth14" readonly> <select id="disorder14" name="disorder14"><%for(int aa=0; aa < dsrd.size();aa++){%> <option><%=(dsrd.get(aa))%> </option><%}%></select> <select id="treatment14" name="treatment14"><%for(int aa=0; aa < treat.size();aa++){%> <option><%=(treat.get(aa))%></option><%}%></select><br><br><label>Prescription: </label> &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;<label> Remarks:</label><br><textarea id=\"addpres'+i+'\" name="pres14" cols="25" rows="6"></textarea> <textarea id=\"remarks'+i+'\" name="remarks14" cols="25" rows="6"></textarea>  </div>');
		});
		
		$('#tooth15').click(function() {
		i = i+1 ;
			$('#trytest').append('<div id=\"addtooth'+ i +'\" class="divappend"><input type="text" name="tooth15" value="tooth15" readonly> <select id="disorder15" name="disorder15"><%for(int aa=0; aa < dsrd.size();aa++){%> <option><%=(dsrd.get(aa))%> </option><%}%></select> <select id="treatment15" name="treatment15"><%for(int aa=0; aa < treat.size();aa++){%> <option><%=(treat.get(aa))%></option><%}%></select><br><br><label>Prescription: </label> &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;<label> Remarks:</label><br><textarea id=\"addpres'+i+'\" name="pres15" cols="25" rows="6"></textarea> <textarea id=\"remarks'+i+'\" name="remarks15" cols="25" rows="6"></textarea>  </div>');
		});
		
		$('#tooth16').click(function() {
		i = i+1 ;
			$('#trytest').append('<div id=\"addtooth'+ i +'\" class="divappend"><input type="text" name="tooth16" value="tooth16" readonly> <select id="disorder16" name="disorder16"><%for(int aa=0; aa < dsrd.size();aa++){%> <option><%=(dsrd.get(aa))%> </option><%}%></select> <select id="treatment16" name="treatment16"><%for(int aa=0; aa < treat.size();aa++){%> <option><%=(treat.get(aa))%></option><%}%></select><br><br><label>Prescription: </label> &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;<label> Remarks:</label><br><textarea id=\"addpres'+i+'\" name="pres16" cols="25" rows="6"></textarea> <textarea id=\"remarks'+i+'\" name="remarks16" cols="25" rows="6"></textarea>  </div>');
		});
		
		$('#tooth17').click(function() {
		i = i+1 ;
			$('#trytest').append('<div id=\"addtooth'+ i +'\" class="divappend"><input type="text" name="tooth17" value="tooth17" readonly> <select id="disorder17" name="disorder17"><%for(int aa=0; aa < dsrd.size();aa++){%> <option><%=(dsrd.get(aa))%> </option><%}%></select> <select id="treatment17" name="treatment17"><%for(int aa=0; aa < treat.size();aa++){%> <option><%=(treat.get(aa))%></option><%}%></select><br><br><label>Prescription: </label> &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;<label> Remarks:</label><br><textarea id=\"addpres'+i+'\" name="pres17" cols="25" rows="6"></textarea> <textarea id=\"remarks'+i+'\" name="remarks17" cols="25" rows="6"></textarea>  </div>');
		});
		
		$('#tooth18').click(function() {
		i = i+1 ;
			$('#trytest').append('<div id=\"addtooth'+ i +'\" class="divappend"><input type="text" name="tooth18" value="tooth18" readonly> <select id="disorder18" name="disorder18"><%for(int aa=0; aa < dsrd.size();aa++){%> <option><%=(dsrd.get(aa))%> </option><%}%></select> <select id="treatment18" name="treatment18"><%for(int aa=0; aa < treat.size();aa++){%> <option><%=(treat.get(aa))%></option><%}%></select><br><br><label>Prescription: </label> &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;<label> Remarks:</label><br><textarea id=\"addpres'+i+'\" name="pres18" cols="25" rows="6"></textarea> <textarea id=\"remarks'+i+'\" name="remarks18" cols="25" rows="6"></textarea>  </div>');
		});
		
		$('#tooth19').click(function() {
		i = i+1 ;
			$('#trytest').append('<div id=\"addtooth'+ i +'\" class="divappend"><input type="text" name="tooth19" value="tooth19" readonly> <select id="disorder19" name="disorder19"><%for(int aa=0; aa < dsrd.size();aa++){%> <option><%=(dsrd.get(aa))%> </option><%}%></select> <select id="treatment19" name="treatment19"><%for(int aa=0; aa < treat.size();aa++){%> <option><%=(treat.get(aa))%></option><%}%></select><br><br><label>Prescription: </label> &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;<label> Remarks:</label><br><textarea id=\"addpres'+i+'\" name="pres19" cols="25" rows="6"></textarea> <textarea id=\"remarks'+i+'\" name="remarks19" cols="25" rows="6"></textarea>  </div>');
		});
		
		$('#tooth20').click(function() {
		i = i+1 ;
			$('#trytest').append('<div id=\"addtooth'+ i +'\" class="divappend"><input type="text" name="tooth20" value="tooth20" readonly> <select id="disorder20" name="disorder20"><%for(int aa=0; aa < dsrd.size();aa++){%> <option><%=(dsrd.get(aa))%> </option><%}%></select> <select id="treatment20" name="treatment20"><%for(int aa=0; aa < treat.size();aa++){%> <option><%=(treat.get(aa))%></option><%}%></select><br><br><label>Prescription: </label> &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;<label> Remarks:</label><br><textarea id=\"addpres'+i+'\" name="pres20" cols="25" rows="6"></textarea> <textarea id=\"remarks'+i+'\" name="remarks20" cols="25" rows="6"></textarea>  </div>');
		});
		
		$('#tooth21').click(function() {
		i = i+1 ;
			$('#trytest').append('<div id=\"addtooth'+ i +'\" class="divappend"><input type="text" name="tooth21" value="tooth21" readonly> <select id="disorder21" name="disorder21"><%for(int aa=0; aa < dsrd.size();aa++){%> <option><%=(dsrd.get(aa))%> </option><%}%></select> <select id="treatment21" name="treatment21"><%for(int aa=0; aa < treat.size();aa++){%> <option><%=(treat.get(aa))%></option><%}%></select><br><br><label>Prescription: </label> &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;<label> Remarks:</label><br><textarea id=\"addpres'+i+'\" name="pres21" cols="25" rows="6"></textarea> <textarea id=\"remarks'+i+'\" name="remarks21" cols="25" rows="6"></textarea>  </div>');
		});
		
		$('#tooth22').click(function() {
		i = i+1 ;
			$('#trytest').append('<div id=\"addtooth'+ i +'\" class="divappend"><input type="text" name="tooth22" value="tooth22" readonly> <select id="disorder22" name="disorder22"><%for(int aa=0; aa < dsrd.size();aa++){%> <option><%=(dsrd.get(aa))%> </option><%}%></select> <select id="treatment22" name="treatment22"><%for(int aa=0; aa < treat.size();aa++){%> <option><%=(treat.get(aa))%></option><%}%></select><br><br><label>Prescription: </label> &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;<label> Remarks:</label><br><textarea id=\"addpres'+i+'\" name="pres22" cols="25" rows="6"></textarea> <textarea id=\"remarks'+i+'\" name="remarks22" cols="25" rows="6"></textarea>  </div>');
		});
		
		$('#tooth23').click(function() {
		i = i+1 ;
			$('#trytest').append('<div id=\"addtooth'+ i +'\" class="divappend"><input type="text" name="tooth23" value="tooth23" readonly> <select id="disorder23" name="disorder23"><%for(int aa=0; aa < dsrd.size();aa++){%> <option><%=(dsrd.get(aa))%> </option><%}%></select> <select id="treatment23" name="treatment23"><%for(int aa=0; aa < treat.size();aa++){%> <option><%=(treat.get(aa))%></option><%}%></select><br><br><label>Prescription: </label> &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;<label> Remarks:</label><br><textarea id=\"addpres'+i+'\" name="pres23" cols="25" rows="6"></textarea> <textarea id=\"remarks'+i+'\" name="remarks23" cols="25" rows="6"></textarea>  </div>');
		});
		
		$('#tooth24').click(function() {
		i = i+1 ;
			$('#trytest').append('<div id=\"addtooth'+ i +'\" class="divappend"><input type="text" name="tooth24" value="tooth24" readonly> <select id="disorder24" name="disorder24"><%for(int aa=0; aa < dsrd.size();aa++){%> <option><%=(dsrd.get(aa))%> </option><%}%></select> <select id="treatment24" name="treatment24"><%for(int aa=0; aa < treat.size();aa++){%> <option><%=(treat.get(aa))%></option><%}%></select><br><br><label>Prescription: </label> &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;<label> Remarks:</label><br><textarea id=\"addpres'+i+'\" name="pres24" cols="25" rows="6"></textarea> <textarea id=\"remarks'+i+'\" name="remarks24" cols="25" rows="6"></textarea>  </div>');
		});
		
		$('#tooth25').click(function() {
		i = i+1 ;
			$('#trytest').append('<div id=\"addtooth'+ i +'\" class="divappend"><input type="text" name="tooth25" value="tooth25" readonly> <select id="disorder25" name="disorder25"><%for(int aa=0; aa < dsrd.size();aa++){%> <option><%=(dsrd.get(aa))%> </option><%}%></select> <select id="treatment25" name="treatment25"><%for(int aa=0; aa < treat.size();aa++){%> <option><%=(treat.get(aa))%></option><%}%></select><br><br><label>Prescription: </label> &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;<label> Remarks:</label><br><textarea id=\"addpres'+i+'\" name="pres25" cols="25" rows="6"></textarea> <textarea id=\"remarks'+i+'\" name="remarks25" cols="25" rows="6"></textarea>  </div>');
		});
		
		$('#tooth26').click(function() {
		i = i+1 ;
			$('#trytest').append('<div id=\"addtooth'+ i +'\" class="divappend"><input type="text" name="tooth26" value="tooth26" readonly> <select id="disorder26" name="disorder26"><%for(int aa=0; aa < dsrd.size();aa++){%> <option><%=(dsrd.get(aa))%> </option><%}%></select> <select id="treatment26" name="treatment26"><%for(int aa=0; aa < treat.size();aa++){%> <option><%=(treat.get(aa))%></option><%}%></select><br><br><label>Prescription: </label> &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;<label> Remarks:</label><br><textarea id=\"addpres'+i+'\" name="pres26" cols="25" rows="6"></textarea> <textarea id=\"remarks'+i+'\" name="remarks26" cols="25" rows="6"></textarea>  </div>');
		});
		
		$('#tooth27').click(function() {
		i = i+1 ;
			$('#trytest').append('<div id=\"addtooth'+ i +'\" class="divappend"><input type="text" name="tooth27" value="tooth27" readonly> <select id="disorder27" name="disorder27"><%for(int aa=0; aa < dsrd.size();aa++){%> <option><%=(dsrd.get(aa))%> </option><%}%></select> <select id="treatment27" name="treatment27"><%for(int aa=0; aa < treat.size();aa++){%> <option><%=(treat.get(aa))%></option><%}%></select><br><br><label>Prescription: </label> &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;<label> Remarks:</label><br><textarea id=\"addpres'+i+'\" name="pres27" cols="25" rows="6"></textarea> <textarea id=\"remarks'+i+'\" name="remarks27" cols="25" rows="6"></textarea>  </div>');
		});
		
		$('#tooth28').click(function() {
		i = i+1 ;
			$('#trytest').append('<div id=\"addtooth'+ i +'\" class="divappend"><input type="text" name="tooth28" value="tooth28" readonly> <select id="disorder28" name="disorder28"><%for(int aa=0; aa < dsrd.size();aa++){%> <option><%=(dsrd.get(aa))%> </option><%}%></select> <select id="treatment28" name="treatment28"><%for(int aa=0; aa < treat.size();aa++){%> <option><%=(treat.get(aa))%></option><%}%></select><br><br><label>Prescription: </label> &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;<label> Remarks:</label><br><textarea id=\"addpres'+i+'\" name="pres28" cols="25" rows="6"></textarea> <textarea id=\"remarks'+i+'\" name="remarks28" cols="25" rows="6"></textarea>  </div>');
		});
		
		$('#tooth29').click(function() {
		i = i+1 ;
			$('#trytest').append('<div id=\"addtooth'+ i +'\" class="divappend"><input type="text" name="tooth29" value="tooth29" readonly> <select id="disorder29" name="disorder29"><%for(int aa=0; aa < dsrd.size();aa++){%> <option><%=(dsrd.get(aa))%> </option><%}%></select> <select id="treatment29" name="treatment29"><%for(int aa=0; aa < treat.size();aa++){%> <option><%=(treat.get(aa))%></option><%}%></select><br><br><label>Prescription: </label> &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;<label> Remarks:</label><br><textarea id=\"addpres'+i+'\" name="pres29" cols="25" rows="6"></textarea> <textarea id=\"remarks'+i+'\" name="remarks29" cols="25" rows="6"></textarea>  </div>');
		});
		
		$('#tooth30').click(function() {
		i = i+1 ;
			$('#trytest').append('<div id=\"addtooth'+ i +'\" class="divappend"><input type="text" name="tooth30" value="tooth30" readonly> <select id="disorder30" name="disorder30"><%for(int aa=0; aa < dsrd.size();aa++){%> <option><%=(dsrd.get(aa))%> </option><%}%></select> <select id="treatment30" name="treatment30"><%for(int aa=0; aa < treat.size();aa++){%> <option><%=(treat.get(aa))%></option><%}%></select><br><br><label>Prescription: </label> &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;<label> Remarks:</label><br><textarea id=\"addpres'+i+'\" name="pres30" cols="25" rows="6"></textarea> <textarea id=\"remarks'+i+'\" name="remarks30" cols="25" rows="6"></textarea>  </div>');
		});
		
		$('#tooth31').click(function() {
		i = i+1 ;
			$('#trytest').append('<div id=\"addtooth'+ i +'\" class="divappend"><input type="text" name="tooth31" value="tooth31" readonly> <select id="disorder31" name="disorder31"><%for(int aa=0; aa < dsrd.size();aa++){%> <option><%=(dsrd.get(aa))%> </option><%}%></select> <select id="treatment31" name="treatment31"><%for(int aa=0; aa < treat.size();aa++){%> <option><%=(treat.get(aa))%></option><%}%></select><br><br><label>Prescription: </label> &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;<label> Remarks:</label><br><textarea id=\"addpres'+i+'\" name="pres31" cols="25" rows="6"></textarea> <textarea id=\"remarks'+i+'\" name="remarks31" cols="25" rows="6"></textarea>  </div>');
		});
		
		$('#tooth32').click(function() {
		i = i+1 ;
			$('#trytest').append('<div id=\"addtooth'+ i +'\" class="divappend"><input type="text" name="tooth32" value="tooth32" readonly> <select id="disorder32" name="disorder32"><%for(int aa=0; aa < dsrd.size();aa++){%> <option><%=(dsrd.get(aa))%> </option><%}%></select> <select id="treatment32" name="treatment32"><%for(int aa=0; aa < treat.size();aa++){%> <option><%=(treat.get(aa))%></option><%}%></select><br><br><label>Prescription: </label> &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;<label> Remarks:</label><br><textarea id=\"addpres'+i+'\" name="pres32" cols="25" rows="6"></textarea> <textarea id=\"remarks'+i+'\" name="remarks32" cols="25" rows="6"></textarea>  </div>');
		});
		
		$('#genpdf').click(function(){
			$('#hidtype').val("pdf");
	        $('#formReport').submit();
	    });
		$('#genexcel').click(function(){
			$('#hidtype').val("excel");
	        $('#formReport').submit();
	    });
	 

	var index = '-1';
	 
	var tablee = $('#reservationTable').DataTable({
		"dom": '<"top"l>rt<"bottom"ip><"clear">'
	});

	$('#searchid1').on('change', function() {
		 // or $(this).val()
		 index = this.value;
	});

	$('#searchh1').keyup(function(){
		if(index==='-1'){
			tablee.search($(this).val()).draw() ;
		} else{
			tablee.columns(index).search($(this).val()).draw() ;
		}
	}); 


	var index2 = '-1';
	 
	var table2 = $('#conTable').DataTable({
		"dom": '<"top"l>rt<"bottom"ip><"clear">'
	});

	$('#searchid2').on('change', function() {
		// or $(this).val()
		 index2 = this.value;
	});

	$('#searchh2').keyup(function(){
		if(index2==='-1'){
			table2.search($(this).val()).draw() ;
		} else{
			table2.columns(index2).search($(this).val()).draw() ;
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
      <p>Record Added!</p>
    </div>
  </div>
</div>
<%
    response.setHeader( "Cache-Control", "no-store, no-cache, must-revalidate");  //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", -1); //prevents caching at the proxy server
%>
</body>

</html>
