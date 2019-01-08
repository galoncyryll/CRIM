package Project;
import java.sql.*;

public class DBconnect {
	    
	    Connection conn=null;
	    
	    public static Connection ConnectDb(){
	    
	    try{
	     
	        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/patientinfo_db","root","root");
	        return conn; 
	    }    
	    catch(Exception e){
	    return null;
	}
	}
	           
	    }

