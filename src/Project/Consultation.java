package Project;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.SystemInfo;

/**
 * Servlet implementation class Consultation
 */
@WebServlet("/Consultation")
public class Consultation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Consultation() {
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
			String patient_id = request.getParameter("patient_id");
			String lname = request.getParameter("lname");
			String fname = request.getParameter("fname");
			String tooth1 = request.getParameter("tooth1");
			String tooth2 = request.getParameter("tooth2");
			String tooth3 = request.getParameter("tooth3");
			String tooth4 = request.getParameter("tooth4");
			String tooth5 = request.getParameter("tooth5");
			String tooth6 = request.getParameter("tooth6");
			String tooth7 = request.getParameter("tooth7");
			String tooth8 = request.getParameter("tooth8");
			String tooth9 = request.getParameter("tooth9");
			String tooth10 = request.getParameter("tooth10");
			String tooth11 = request.getParameter("tooth11");
			String tooth12 = request.getParameter("tooth12");
			String tooth13 = request.getParameter("tooth13");
			String tooth14 = request.getParameter("tooth14");
			String tooth15 = request.getParameter("tooth15");
			String tooth16 = request.getParameter("tooth16");
			String tooth17 = request.getParameter("tooth17");
			String tooth18 = request.getParameter("tooth18");
			String tooth19 = request.getParameter("tooth19");
			String tooth20 = request.getParameter("tooth20");
			String tooth21 = request.getParameter("tooth21");
			String tooth22 = request.getParameter("tooth22");
			String tooth23 = request.getParameter("tooth23");
			String tooth24 = request.getParameter("tooth24");
			String tooth25 = request.getParameter("tooth25");
			String tooth26 = request.getParameter("tooth26");
			String tooth27 = request.getParameter("tooth27");
			String tooth28 = request.getParameter("tooth28");
			String tooth29 = request.getParameter("tooth29");
			String tooth30 = request.getParameter("tooth30");
			String tooth31 = request.getParameter("tooth31");
			String tooth32 = request.getParameter("tooth32");
			String disorder1 = request.getParameter("disorder1");
			String disorder2 = request.getParameter("disorder2");
			String disorder3 = request.getParameter("disorder3");
			String disorder4 = request.getParameter("disorder4");
			String disorder5 = request.getParameter("disorder5");
			String disorder6 = request.getParameter("disorder6");
			String disorder7 = request.getParameter("disorder7");
			String disorder8 = request.getParameter("disorder8");
			String disorder9 = request.getParameter("disorder9");
			String disorder10 = request.getParameter("disorder10");
			String disorder11 = request.getParameter("disorder11");
			String disorder12 = request.getParameter("disorder12");
			String disorder13 = request.getParameter("disorder13");
			String disorder14 = request.getParameter("disorder14");
			String disorder15 = request.getParameter("disorder15");
			String disorder16 = request.getParameter("disorder16");
			String disorder17 = request.getParameter("disorder17");
			String disorder18 = request.getParameter("disorder18");
			String disorder19 = request.getParameter("disorder19");
			String disorder20 = request.getParameter("disorder20");
			String disorder21 = request.getParameter("disorder21");
			String disorder22 = request.getParameter("disorder22");
			String disorder23 = request.getParameter("disorder23");
			String disorder24 = request.getParameter("disorder24");
			String disorder25 = request.getParameter("disorder25");
			String disorder26 = request.getParameter("disorder26");
			String disorder27 = request.getParameter("disorder27");
			String disorder28 = request.getParameter("disorder28");
			String disorder29 = request.getParameter("disorder29");
			String disorder30 = request.getParameter("disorder30");
			String disorder31 = request.getParameter("disorder31");
			String disorder32 = request.getParameter("disorder32");
			String treatment1 = request.getParameter("treatment1");
			String treatment2 = request.getParameter("treatment2");
			String treatment3 = request.getParameter("treatment3");
			String treatment4 = request.getParameter("treatment4");
			String treatment5 = request.getParameter("treatment5");
			String treatment6 = request.getParameter("treatment6");
			String treatment7 = request.getParameter("treatment7");
			String treatment8 = request.getParameter("treatment8");
			String treatment9 = request.getParameter("treatment9");
			String treatment10 = request.getParameter("treatment10");
			String treatment11 = request.getParameter("treatment11");
			String treatment12 = request.getParameter("treatment12");
			String treatment13 = request.getParameter("treatment13");
			String treatment14 = request.getParameter("treatment14");
			String treatment15 = request.getParameter("treatment15");
			String treatment16 = request.getParameter("treatment16");
			String treatment17 = request.getParameter("treatment17");
			String treatment18 = request.getParameter("treatment18");
			String treatment19 = request.getParameter("treatment19");
			String treatment20 = request.getParameter("treatment20");
			String treatment21 = request.getParameter("treatment21");
			String treatment22 = request.getParameter("treatment22");
			String treatment23 = request.getParameter("treatment23");
			String treatment24 = request.getParameter("treatment24");
			String treatment25 = request.getParameter("treatment25");
			String treatment26 = request.getParameter("treatment26");
			String treatment27 = request.getParameter("treatment27");
			String treatment28 = request.getParameter("treatment28");
			String treatment29 = request.getParameter("treatment29");
			String treatment30 = request.getParameter("treatment30");
			String treatment31 = request.getParameter("treatment31");
			String treatment32 = request.getParameter("treatment32");
			String pres1 = request.getParameter("pres1");
			String pres2 = request.getParameter("pres2");
			String pres3 = request.getParameter("pres3");
			String pres4 = request.getParameter("pres4");
			String pres5 = request.getParameter("pres5");
			String pres6 = request.getParameter("pres6");
			String pres7 = request.getParameter("pres7");
			String pres8 = request.getParameter("pres8");
			String pres9 = request.getParameter("pres9");
			String pres10 = request.getParameter("pres10");
			String pres11 = request.getParameter("pres11");
			String pres12 = request.getParameter("pres12");
			String pres13 = request.getParameter("pres13");
			String pres14 = request.getParameter("pres14");
			String pres15 = request.getParameter("pres15");
			String pres16 = request.getParameter("pres16");
			String pres17 = request.getParameter("pres17");
			String pres18 = request.getParameter("pres18");
			String pres19 = request.getParameter("pres19");
			String pres20 = request.getParameter("pres20");
			String pres21 = request.getParameter("pres21");
			String pres22 = request.getParameter("pres22");
			String pres23 = request.getParameter("pres23");
			String pres24 = request.getParameter("pres24");
			String pres25 = request.getParameter("pres25");
			String pres26 = request.getParameter("pres26");
			String pres27 = request.getParameter("pres27");
			String pres28 = request.getParameter("pres28");
			String pres29 = request.getParameter("pres29");
			String pres30 = request.getParameter("pres30");
			String pres31 = request.getParameter("pres31");
			String pres32 = request.getParameter("pres32");			
			String remarks1 = request.getParameter("remarks1");
			String remarks2 = request.getParameter("remarks2");
			String remarks3 = request.getParameter("remarks3");
			String remarks4 = request.getParameter("remarks4");
			String remarks5 = request.getParameter("remarks5");
			String remarks6 = request.getParameter("remarks6");
			String remarks7 = request.getParameter("remarks7");
			String remarks8 = request.getParameter("remarks8");
			String remarks9 = request.getParameter("remarks9");
			String remarks10 = request.getParameter("remarks10");
			String remarks11 = request.getParameter("remarks11");
			String remarks12 = request.getParameter("remarks12");
			String remarks13 = request.getParameter("remarks13");
			String remarks14 = request.getParameter("remarks14");
			String remarks15 = request.getParameter("remarks15");
			String remarks16 = request.getParameter("remarks16");
			String remarks17 = request.getParameter("remarks17");
			String remarks18 = request.getParameter("remarks18");
			String remarks19 = request.getParameter("remarks19");
			String remarks20 = request.getParameter("remarks20");
			String remarks21 = request.getParameter("remarks21");
			String remarks22 = request.getParameter("remarks22");
			String remarks23 = request.getParameter("remarks23");
			String remarks24 = request.getParameter("remarks24");
			String remarks25 = request.getParameter("remarks25");
			String remarks26 = request.getParameter("remarks26");
			String remarks27 = request.getParameter("remarks27");
			String remarks28 = request.getParameter("remarks28");
			String remarks29 = request.getParameter("remarks29");
			String remarks30 = request.getParameter("remarks30");
			String remarks31 = request.getParameter("remarks31");
			String remarks32 = request.getParameter("remarks32");
					
			
	
			try {
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth1, disorder1, treatment1, pres1, remarks1);
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth2, disorder2, treatment2, pres2, remarks2);
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth3, disorder3, treatment3, pres3, remarks3);
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth4, disorder4, treatment4, pres4, remarks4);
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth5, disorder5, treatment5, pres5, remarks5);
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth6, disorder6, treatment6, pres6, remarks6);
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth7, disorder7, treatment7, pres7, remarks7);
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth8, disorder8, treatment8, pres8, remarks8);
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth9, disorder9, treatment9, pres9, remarks9);
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth10, disorder10, treatment10, pres10, remarks10);
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth11, disorder11, treatment11, pres11, remarks11);
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth12, disorder12, treatment12, pres12, remarks12);
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth13, disorder13, treatment13, pres13, remarks13);
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth14, disorder14, treatment14, pres14, remarks14);
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth15, disorder15, treatment15, pres15, remarks15);
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth16, disorder16, treatment16, pres16, remarks16);
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth17, disorder17, treatment17, pres17, remarks17);
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth18, disorder18, treatment18, pres18, remarks18);
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth19, disorder19, treatment19, pres19, remarks19);
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth20, disorder20, treatment20, pres20, remarks20);
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth21, disorder21, treatment21, pres21, remarks21);
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth22, disorder22, treatment22, pres22, remarks22);
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth23, disorder23, treatment23, pres23, remarks23);
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth24, disorder24, treatment24, pres24, remarks24);
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth25, disorder25, treatment25, pres25, remarks25);
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth26, disorder26, treatment26, pres26, remarks26);
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth27, disorder27, treatment27, pres27, remarks27);
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth28, disorder28, treatment28, pres28, remarks28);
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth29, disorder29, treatment29, pres29, remarks29);
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth30, disorder30, treatment30, pres30, remarks30);
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth31, disorder31, treatment31, pres31, remarks31);
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth32, disorder32, treatment32, pres32, remarks32);
				request.getSession().setAttribute("status", "RecordAdd");
				response.sendRedirect("/Capstone/WebPages/Consultation.jsp"); 
				} catch (Exception e) {
					 response.sendRedirect("/Capstone/WebPages/Consultation.jsp");    	
				}
			
			/*		try {
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth2, disorder2, treatment2, pres2, remarks2);
				request.getSession().setAttribute("status", "RecordAdd");
				response.sendRedirect("/Capstone/WebPages/Consultation.jsp"); 
				} catch (Exception e) {
					 response.sendRedirect("/Capstone/WebPages/Consultation.jsp");    	
				}

			try {
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth3, disorder3, treatment3, pres3, remarks3);
				request.getSession().setAttribute("status", "RecordAdd");
				response.sendRedirect("/Capstone/WebPages/Consultation.jsp"); 
				} catch (Exception e) {
					 response.sendRedirect("/Capstone/WebPages/Consultation.jsp");    	
				}
			try {
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth4, disorder4, treatment4, pres4, remarks4);
				request.getSession().setAttribute("status", "RecordAdd");
				response.sendRedirect("/Capstone/WebPages/Consultation.jsp"); 
				} catch (Exception e) {
					 response.sendRedirect("/Capstone/WebPages/Consultation.jsp");  
				}
			try {
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth5, disorder5, treatment5, pres5, remarks5);
				request.getSession().setAttribute("status", "RecordAdd");
				response.sendRedirect("/Capstone/WebPages/Consultation.jsp"); 
				} catch (Exception e) {
					 response.sendRedirect("/Capstone/WebPages/Consultation.jsp");  
				}
			try {
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth6, disorder6, treatment6, pres6, remarks6);
				request.getSession().setAttribute("status", "RecordAdd");
				response.sendRedirect("/Capstone/WebPages/Consultation.jsp"); 
				} catch (Exception e) {
					 response.sendRedirect("/Capstone/WebPages/Consultation.jsp");  
				}
			try {
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth7, disorder7, treatment7, pres7, remarks7);
				request.getSession().setAttribute("status", "RecordAdd");
				response.sendRedirect("/Capstone/WebPages/Consultation.jsp"); 
				} catch (Exception e) {
					 response.sendRedirect("/Capstone/WebPages/Consultation.jsp");  
				}
			try {
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth8, disorder8, treatment8, pres8, remarks8);
				request.getSession().setAttribute("status", "RecordAdd");
				response.sendRedirect("/Capstone/WebPages/Consultation.jsp"); 
				} catch (Exception e) {
					 response.sendRedirect("/Capstone/WebPages/Consultation.jsp");  
				}
			try {
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth9, disorder9, treatment9, pres9, remarks9);
				request.getSession().setAttribute("status", "RecordAdd");
				response.sendRedirect("/Capstone/WebPages/Consultation.jsp"); 
				} catch (Exception e) {
					 response.sendRedirect("/Capstone/WebPages/Consultation.jsp");  
				}
			try {
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth10, disorder10, treatment10, pres10, remarks10);
				request.getSession().setAttribute("status", "RecordAdd");
				response.sendRedirect("/Capstone/WebPages/Consultation.jsp"); 
				} catch (Exception e) {
					 response.sendRedirect("/Capstone/WebPages/Consultation.jsp");    	
				}
			try {
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth11, disorder11, treatment11, pres11, remarks11);
				request.getSession().setAttribute("status", "RecordAdd");
				response.sendRedirect("/Capstone/WebPages/Consultation.jsp"); 
				} catch (Exception e) {
					 response.sendRedirect("/Capstone/WebPages/Consultation.jsp");    	
				}
			try {
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth12, disorder12, treatment12, pres12, remarks12);
				request.getSession().setAttribute("status", "RecordAdd");
				response.sendRedirect("/Capstone/WebPages/Consultation.jsp"); 
				} catch (Exception e) {
					 response.sendRedirect("/Capstone/WebPages/Consultation.jsp");    	
				}
			try {
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth13, disorder13, treatment13, pres13, remarks13);
				request.getSession().setAttribute("status", "RecordAdd");
				response.sendRedirect("/Capstone/WebPages/Consultation.jsp"); 
				} catch (Exception e) {
					 response.sendRedirect("/Capstone/WebPages/Consultation.jsp");    	
				}
			try {
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth14, disorder14, treatment14, pres14, remarks14);
				request.getSession().setAttribute("status", "RecordAdd");
				response.sendRedirect("/Capstone/WebPages/Consultation.jsp"); 
				} catch (Exception e) {
					 response.sendRedirect("/Capstone/WebPages/Consultation.jsp");    	
				}
			try {
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth15, disorder15, treatment15, pres15, remarks15);
				request.getSession().setAttribute("status", "RecordAdd");
				response.sendRedirect("/Capstone/WebPages/Consultation.jsp"); 
				} catch (Exception e) {
					 response.sendRedirect("/Capstone/WebPages/Consultation.jsp");    	
				}
			try {
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth16, disorder16, treatment16, pres16, remarks16);
				request.getSession().setAttribute("status", "RecordAdd");
				response.sendRedirect("/Capstone/WebPages/Consultation.jsp"); 
				} catch (Exception e) {
					 response.sendRedirect("/Capstone/WebPages/Consultation.jsp");    	
				}
			try {
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth17, disorder17, treatment17, pres17, remarks17);
				request.getSession().setAttribute("status", "RecordAdd");
				response.sendRedirect("/Capstone/WebPages/Consultation.jsp"); 
				} catch (Exception e) {
					 response.sendRedirect("/Capstone/WebPages/Consultation.jsp");    	
				}
			try {
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth18, disorder18, treatment18, pres18, remarks18);
				request.getSession().setAttribute("status", "RecordAdd");
				response.sendRedirect("/Capstone/WebPages/Consultation.jsp"); 
				} catch (Exception e) {
					 response.sendRedirect("/Capstone/WebPages/Consultation.jsp");    	
				}
			try {
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth19, disorder19, treatment19, pres19, remarks19);
				request.getSession().setAttribute("status", "RecordAdd");
				response.sendRedirect("/Capstone/WebPages/Consultation.jsp"); 
				} catch (Exception e) {
					 response.sendRedirect("/Capstone/WebPages/Consultation.jsp");    	
				}
			try {
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth20, disorder20, treatment20, pres20, remarks20);
				request.getSession().setAttribute("status", "RecordAdd");
				response.sendRedirect("/Capstone/WebPages/Consultation.jsp"); 
				} catch (Exception e) {
					 response.sendRedirect("/Capstone/WebPages/Consultation.jsp");    	
				}
			try {
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth21, disorder21, treatment21, pres21, remarks21);
				request.getSession().setAttribute("status", "RecordAdd");
				response.sendRedirect("/Capstone/WebPages/Consultation.jsp"); 
				} catch (Exception e) {
					 response.sendRedirect("/Capstone/WebPages/Consultation.jsp");    	
				}
			try {
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth22, disorder22, treatment22, pres22, remarks22);
				request.getSession().setAttribute("status", "RecordAdd");
				response.sendRedirect("/Capstone/WebPages/Consultation.jsp"); 
				} catch (Exception e) {
					 response.sendRedirect("/Capstone/WebPages/Consultation.jsp");    	
				}
			try {
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth23, disorder23, treatment23, pres23, remarks23);
				request.getSession().setAttribute("status", "RecordAdd");
				response.sendRedirect("/Capstone/WebPages/Consultation.jsp"); 
				} catch (Exception e) {
					 response.sendRedirect("/Capstone/WebPages/Consultation.jsp");    	
				}
			try {
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth24, disorder24, treatment24, pres24, remarks24);
				request.getSession().setAttribute("status", "RecordAdd");
				response.sendRedirect("/Capstone/WebPages/Consultation.jsp"); 
				} catch (Exception e) {
					 response.sendRedirect("/Capstone/WebPages/Consultation.jsp");    	
				}
			try {
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth25, disorder25, treatment25, pres25, remarks25);
				request.getSession().setAttribute("status", "RecordAdd");
				response.sendRedirect("/Capstone/WebPages/Consultation.jsp"); 
				} catch (Exception e) {
					 response.sendRedirect("/Capstone/WebPages/Consultation.jsp");    	
				}
			try {
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth26, disorder26, treatment26, pres26, remarks26);
				request.getSession().setAttribute("status", "RecordAdd");
				response.sendRedirect("/Capstone/WebPages/Consultation.jsp"); 
				} catch (Exception e) {
					 response.sendRedirect("/Capstone/WebPages/Consultation.jsp");    	
				}
			try {
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth27, disorder27, treatment27, pres27, remarks27);
				request.getSession().setAttribute("status", "RecordAdd");
				response.sendRedirect("/Capstone/WebPages/Consultation.jsp"); 
				} catch (Exception e) {
					 response.sendRedirect("/Capstone/WebPages/Consultation.jsp");    	
				}
			try {
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth28, disorder28, treatment28, pres28, remarks28);
				request.getSession().setAttribute("status", "RecordAdd");
				response.sendRedirect("/Capstone/WebPages/Consultation.jsp"); 
				} catch (Exception e) {
					 response.sendRedirect("/Capstone/WebPages/Consultation.jsp");    	
				}
			try {
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth29, disorder29, treatment29, pres29, remarks29);
				request.getSession().setAttribute("status", "RecordAdd");
				response.sendRedirect("/Capstone/WebPages/Consultation.jsp"); 
				} catch (Exception e) {
					 response.sendRedirect("/Capstone/WebPages/Consultation.jsp");    	
				}
			try {
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth30, disorder30, treatment30, pres30, remarks30);
				request.getSession().setAttribute("status", "RecordAdd");
				response.sendRedirect("/Capstone/WebPages/Consultation.jsp"); 
				} catch (Exception e) {
					 response.sendRedirect("/Capstone/WebPages/Consultation.jsp");    	
				}
			try {
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth31, disorder31, treatment31, pres31, remarks31);
				request.getSession().setAttribute("status", "RecordAdd");
				response.sendRedirect("/Capstone/WebPages/Consultation.jsp"); 
				} catch (Exception e) {
					 response.sendRedirect("/Capstone/WebPages/Consultation.jsp");    	
				}
			try {
				SystemInfo.getDb().QueryUpdate("INSERT into consultation_table (user_id,patient_id,lname,fname,tooth_number,disorder,treatment,prescriptions,remarks)"		
						+ "values(?,?,?,?,?,?,?,?,?)", userid, patient_id, lname, fname, tooth32, disorder32, treatment32, pres32, remarks32);
				request.getSession().setAttribute("status", "RecordAdd");
				response.sendRedirect("/Capstone/WebPages/Consultation.jsp"); 
				} catch (Exception e) {
					 response.sendRedirect("/Capstone/WebPages/Consultation.jsp");    	
				} */
		}
	}


