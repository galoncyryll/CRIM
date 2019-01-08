<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.io.*"
    import = "java.sql.*"
    import="common.DataRow"
	import="common.DataRowCollection"
	import="common.Logger"
	import="common.SystemInfo"
	import="java.text.SimpleDateFormat"
	import="java.util.ArrayList"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
										

SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");										
String date = request.getParameter("val2");		
String chairName= request.getParameter("val");
String realDate = df.format(df.parse(date));

DataRowCollection timeslot = SystemInfo.getDb().QueryDataRows("select * from timeslot_table where status = 'ACTIVE'");
DataRowCollection reserve = SystemInfo.getDb().QueryDataRows("select * from reservation_table where "
+ "reserve_date = str_to_date(?,'%Y-%m-%d') and seat_name = ?", realDate, chairName);
ArrayList<String> time = new ArrayList<String>();
ArrayList<String> data = new ArrayList<String>();
for(DataRow t : timeslot){
	time.add(String.valueOf(t.getString("reserve_time")));
	}
for(DataRow d : reserve){
	data.add(String.valueOf(d.getString("reserve_time")));
	}
	time.removeAll(data);
	
	out.println("<label>Time: </label><select id='timeslot' name='timeslot'>");
			
for(int i=0; i < time.size(); i++){
		
	out.println("<option value="+time.get(i)+">" +time.get(i)+"</option>");
	
}
out.println("</select>");	
%>
</body>
</html>