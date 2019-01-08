package Project;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.SystemInfo;

/**
 * Servlet implementation class Management
 */
@WebServlet("/Management")
public class Management extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Management() {
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
		String disorder = request.getParameter("inputdisorder1");
		String treatment = request.getParameter("inputtreatment1");
		String module = request.getParameter("inputseat1");
		
		try {
		SystemInfo.getDb().QueryUpdate("INSERT into disorder_table (disorder_name)"		
				+ "values(?)", disorder);
		SystemInfo.getDb().QueryUpdate("INSERT into treatment_table (treatment_name)"		
				+ "values(?)", treatment);
		SystemInfo.getDb().QueryUpdate("INSERT into module_table (module_name)"		
				+ "values(?)", module);
		response.sendRedirect("/Capstone/WebPages/Management.jsp");    	
		} catch (Exception e) {
			 
		}
		response.sendRedirect("/Capstone/WebPages/Management.jsp");    	
		
	}

}
