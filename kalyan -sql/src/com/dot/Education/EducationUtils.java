package com.dot.Education;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.*;

import com.dot.DbUtils;

public class EducationUtils {
	
	static String driverName = "com.mysql.jdbc.Driver";
	static String url = "jdbc:mysql://localhost:3306/dot";
	static String user = "root";
	static String dbpsw = "hadoop";
	
	public static List selectEducation(HttpServletRequest request,
			HttpServletResponse response) throws ClassNotFoundException,
			IOException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet r = null;
		String sql1 = "select * from education where mid=?";
		List<Education> list = new ArrayList<Education>();
		int n = 0;
		try {
			n = Integer.parseInt(request.getParameter("mid"));
		} catch (Exception e) {
			HttpSession session = request.getSession(true); // to get the mid of
															// the

			n = (Integer) session.getAttribute("mid");

		}
		try {

			/*Class.forName(driverName);
			con = DriverManager.getConnection(url, user, dbpsw);*/
			con = DbUtils.getConnection();
			
			ps = con.prepareStatement(sql1);
			ps.setInt(1, n);
			r = ps.executeQuery();
			while (r.next()) {
				int e = r.getInt("eid");
				int mid = r.getInt("mid");
				String degree = r.getString("degree");
				String institute = r.getString("institute");
				String stream = r.getString("stream");
				float grade = r.getFloat("grade");
				String sdate = r.getString("startdate");
				String enddate = r.getString("enddate");
				Education ed = new Education(e, mid, degree, grade, institute,
						sdate, enddate, stream);
				list.add(ed);

			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static void insertEducation(HttpServletRequest request,
			HttpServletResponse response) throws ClassNotFoundException,
			IOException {

		HttpSession session = request.getSession(true); // to get the mid of the
														// session

		String mid1 = session.getAttribute("mid").toString();

		int mid = Integer.parseInt(mid1);
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ResultSet rs1[] = null;

		String degree = request.getParameter("degree");
		String grade1 = request.getParameter("grade");
		String institute = request.getParameter("institute");
		String startdate = request.getParameter("startdate");
		String enddate = request.getParameter("enddate");
		String stream = request.getParameter("stream");
		int aid = 2;
		float grade = Float.parseFloat(grade1);
		String sql = "insert into education (mid,degree,grade,institute,startdate,enddate,stream) values (?,?,?,?,?,?,?)";

		if (mid != 0) {
			try {
				Class.forName(driverName);
				con = DriverManager.getConnection(url, user, dbpsw);
				ps = con.prepareStatement(sql);
				ps.setInt(1, mid);
				ps.setString(2, degree);
				ps.setFloat(3, grade);
				ps.setString(4, institute);
				ps.setDate(5, java.sql.Date.valueOf(startdate));
				ps.setDate(6, java.sql.Date.valueOf(enddate));
				ps.setString(7, stream);
				// ps.setInt(8, aid);

				ps.execute();

				ps.close();
				response.sendRedirect("/dot/college/profile/welcome.jsp");
			} catch (SQLException sqe) {
				sqe.printStackTrace();
			}
		}

	}


	
	

}
