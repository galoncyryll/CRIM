package Project;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.SystemInfo;

/**
 * Servlet implementation class Logout
 */
@WebServlet("/Logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Logout() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 try{
		
		String user_id = request.getParameter("userid");
		if(request.getParameter("btnLogout") != null){
		try {
			SystemInfo.getDb().QueryUpdate("UPDATE accounts_table SET state=? WHERE userid=?"		
					, "false", user_id);	
			request.getSession().invalidate();
			request.getSession().removeAttribute("authori");
			response.sendRedirect("/Capstone/WebPages/Login.jsp"); 
			} catch (Exception e) {
				 response.sendRedirect("/Capstone/WebPages/Login.jsp");    	
			}
		}}catch (Exception e){
			
		}
	}}