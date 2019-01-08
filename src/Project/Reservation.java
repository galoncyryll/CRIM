package Project;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.DataRow;
import common.DataRowCollection;
import common.SystemInfo;

/**
 * Servlet implementation class Reservation
 */
@WebServlet("/Reservation")
public class Reservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Reservation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*	if(request.getParameter("btnAdd") != null){
		try {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			String date = "2017-02-04";
			String chairName = "2A";
			String realDate = df.format(df.parse(date));
			DataRowCollection timeslot = SystemInfo.getDb().QueryDataRows("select * from timeslot_table where status = 'ACTIVE'");
			DataRowCollection reserve = SystemInfo.getDb().QueryDataRows("select * from reservation_table where "
					+ "reserve_date = str_to_date(?,'%Y-%m-%d') and seat_name = ?", date, chairName);
			ArrayList<String> time = new ArrayList<String>();
			ArrayList<String> data = new ArrayList<String>();
			for(DataRow t : timeslot){
				time.add(String.valueOf(t.getInteger("timeslot_id")));
			}
			for(DataRow d : reserve){
				data.add(String.valueOf(d.getInteger("timeslot_id")));	
			}
			time.removeAll(data);
			System.out.println(time);
		
		} catch (Exception e) {
			e.printStackTrace();
			 response.sendRedirect("/Capstone/WebPages/Records.jsp");    	
		}
		
	}
	else{
	
}

*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dateselect = request.getParameter("dateselect");
		String seatname = request.getParameter("seatname");
		String time = request.getParameter("timeslot");
		String user_id= request.getParameter("userid");
		
		try {
		SystemInfo.getDb().QueryUpdate("insert into reservation_table (user_id,reserve_date,seat_name,reserve_time,status)"		
				+ "values(?,?,?,?,?)", user_id, dateselect, seatname, time, "ACTIVE");
		request.getSession().setAttribute("status", "Book");
		response.sendRedirect("/Capstone/WebPages/Reservation.jsp"); 
		 
		} catch (Exception e) {
			 response.sendRedirect("/Capstone/WebPages/Records.jsp");    	
		}	

	}}

