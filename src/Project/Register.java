package Project;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.SystemInfo;

import common.DataRow;
import common.Logger;
import common.SendMail;
import common.StringUtil;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
    public Register() {
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
		String userid = request.getParameter("userid");
		String password = request.getParameter("userid");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String mname = request.getParameter("mname");
		if(request.getParameter("register") != null){
			DataRow row = SystemInfo.getDb().QueryDataRow("SELECT * FROM accounts_table "
					+ "WHERE userid = ?", userid);
			if(row.size() != 0){
				request.getSession().setAttribute("status", "UserExists");
				response.sendRedirect("WebPages/Login.jsp");
			} else{
				
		try {
		SystemInfo.getDb().QueryUpdate("insert into accounts_table (userid, password, authorization, state, lname, fname, mname)"		
				+ "values(?,?,?,?,?,?,?)", userid, password, "user", "false", lname, fname, mname);
		request.getSession().setAttribute("status", "UserAdded");
		response.sendRedirect("/Capstone/WebPages/Login.jsp"); 
		} catch (Exception e) {
			 response.sendRedirect("/Capstone/WebPages/Login.jsp");    	
		}}}else{
			response.sendRedirect("WebPages/Login.jsp");
		}
		
	}
	}