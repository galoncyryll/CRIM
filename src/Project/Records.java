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

import common.DataRow;
import common.SystemInfo;

/**
 * Servlet implementation class Records
 */
@WebServlet("/Records")
public class Records extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public Records() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//add update
		//SystemInfo.getDb().QueryUpdate("INSERT INTO TABLE VALUES (?,?,?)", A,B,C);
		
		//search
		/*DataRowCollection rows = SystemInfo.getDb().QueryDataRows("", params);
		DataRow row = SystemInfo.getDb().QueryDataRow("", params);
		for(DataRow row1 : rows){
			row1.getString("");
			row1.get("");
			row1.getInteger("");
		}
		
		*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
		if(request.getParameter("btnAdd") != null){
			String lname = request.getParameter("lname");
			String fname = request.getParameter("fname");
			String mi = request.getParameter("mi");
			String gender = request.getParameter("gender");
			String birthdate = request.getParameter("birthdate");
			String age = request.getParameter("age");
			String contact = request.getParameter("contact");
			String address = request.getParameter("address");
		
			
	
			try {
			SystemInfo.getDb().QueryUpdate("insert into patient_records (lname,fname,mi,gender,birthdate,age,contact,address)"		
					+ "values(?,?,?,?,?,?,?,?)", lname, fname, mi, gender, birthdate, age, contact, address);
			request.getSession().setAttribute("status", "UserAdded");
			response.sendRedirect("/Capstone/WebPages/Records.jsp"); 
			} catch (Exception e) {
				 response.sendRedirect("/Capstone/WebPages/Records.jsp");    	
			}
			
		}
		else if(request.getParameter("btnUpdate") != null){
			String patient_id = request.getParameter("patient_id");
			String lname = request.getParameter("lname");
			String fname = request.getParameter("fname");
			String mi = request.getParameter("mi");
			String gender = request.getParameter("gender");
			String birthdate = request.getParameter("birthdate");
			String age = request.getParameter("age");
			String contact = request.getParameter("contact");
			String address = request.getParameter("address");
			
			try {
				SystemInfo.getDb().QueryUpdate("UPDATE patient_records SET lname=?, fname=?, mi=?,  gender=?,  birthdate=?,  age=?,  contact=?,  address=? WHERE patient_number=?"		
						, lname, fname, mi, gender, birthdate, age, contact, address, patient_id);
				request.getSession().setAttribute("status", "UserUpdated");
				response.sendRedirect("/Capstone/WebPages/Records.jsp"); 
				} catch (Exception e) {
					 response.sendRedirect("/Capstone/WebPages/Records.jsp");    	
				}
			
		}
		
			
	
	}

}
