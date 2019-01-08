package Project;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 Connection conn = null;
	 PreparedStatement pst = null;
	 ResultSet rs = null;
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	      
		String userid = request.getParameter("userid");
		String password = request.getParameter("password");		
		
		String sql = "select * from accounts_table where userid=? and password=?";
		String aut="Select authorization,state from accounts_table where userid = ? and password=?";
	    
		conn = DBconnect.ConnectDb();
	
		try{
	        pst=conn.prepareStatement(sql);
	        pst.setString(1,userid);
	        pst.setString(2,password);
	        rs=pst.executeQuery();
			response.setContentType("text/plain"); 
		    response.setCharacterEncoding("UTF-8"); 
		  
		    pst=conn.prepareStatement(aut);
	        pst.setString(1, userid);
	        pst.setString(2,password);
	        rs=pst.executeQuery();
	         
	         if (rs.next()){
	             
	         String autho=rs.getString("authorization");
	         String status=rs.getString("state");
	         if(autho.equals("admin")){
	             				   if(status.equals("false")){
	             				   String sql3="update accounts_table set state='true' where userid=?";
	                               try {
	                                    pst=conn.prepareStatement(sql3);
	                                    pst.setString(1, userid);
	                                 
	                                    pst.execute();  
	                                     }
	                               catch(Exception e)
	                                    {
	                            	   response.sendRedirect("/Capstone/WebPages/Login.jsp");
	                                   }
	                               request.getSession().setAttribute("user", userid);
	                               request.getSession().setAttribute("authori","admin");
	                               response.sendRedirect("/Capstone/WebPages/Home.jsp");    
	                                   }
	                               else{
	                            	   request.getSession().setAttribute("status", "AccountActive");
		                            	 response.sendRedirect("/Capstone/WebPages/Login.jsp");   
	                               }}
	         
	        else {
	        					if(status.equals("false")){
	        					String sql3="update accounts_table set state='true' where userid=?";
	                            try {
	                                 pst=conn.prepareStatement(sql3);
	                                 pst.setString(1, userid);	
	                                 pst.execute();  
	                             }
	                             catch(Exception e)
	                             {
	                            	 response.sendRedirect("/Capstone/WebPages/Login.jsp");  
	                            }
	                            request.getSession().setAttribute("user", userid);
	                            response.sendRedirect("/Capstone/WebPages/Home.jsp");    
	                            
	                            }
	                             else{
	                            	 request.getSession().setAttribute("status", "AccountActive");
	                            	 response.sendRedirect("/Capstone/WebPages/Login.jsp");  
	                             }}}
	         else{
	        	 request.getSession().setAttribute("status", "Wrong");
	        	 response.sendRedirect("/Capstone/WebPages/Login.jsp");  
             }
		}
		  
	             catch(Exception e){
	            	 response.sendRedirect("/Capstone/WebPages/Login.jsp");
	                  }}}
