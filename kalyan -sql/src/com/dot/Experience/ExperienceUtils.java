package com.dot.Experience;

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

public class ExperienceUtils {
	
	static String driverName = "com.mysql.jdbc.Driver";
	static String url = "jdbc:mysql://localhost:3306/dot";
	static String user = "root";
	static String dbpsw = "hadoop";
	
	

	

	public static List selectExperience(HttpServletRequest request,
			HttpServletResponse response) throws ClassNotFoundException,
			IOException {

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet r = null;

		String sql6 = "select * from experience where mid=? ";

		int n = 0;
		try {
			n = Integer.parseInt(request.getParameter("mid"));
		} catch (Exception e) {
			HttpSession session = request.getSession(true); // to get the mid of
															// the

			n = (Integer) session.getAttribute("mid");

		}

		List<Experience> list = new ArrayList<Experience>();

		try {

			/*Class.forName(driverName);
			//con = DriverManager.getConnection(url, user, dbpsw);
			DbUtils b = new DbUtils();
			con=b.getConnection();*/
			con = DbUtils.getConnection();
			ps = con.prepareStatement(sql6);
			ps.setInt(1, n);
			r = ps.executeQuery();

			while (r.next()) {

				int exid = r.getInt("exid");
				int mid = r.getInt("mid");
				String title = r.getString("title");
				String description = r.getString("description");
				String sdate = r.getString("sdate");
				String edate = r.getString("edate");
				String company = r.getString("company");
				String location = r.getString("location");
				String tools = r.getString("tools");

				Experience ex = new Experience(mid, exid, title, description,
						sdate, edate, company, location, tools);
				list.add(ex);
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("home" + e);
		}
		return list;

	}

	public static void insertExp(HttpServletRequest request,
			HttpServletResponse response) throws ClassNotFoundException,
			IOException {
		HttpSession session = request.getSession(true);
		String mid1 = session.getAttribute("mid").toString();
		int mid = Integer.parseInt(mid1);
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ResultSet rs1[] = null;

		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String sdate = request.getParameter("sdate");
		String edate = request.getParameter("edate");
		String company = request.getParameter("company");
		String location = request.getParameter("location");
		String tools = request.getParameter("tools");
		// int aid=2;

		String sql = "insert into experience (mid,title,description,sdate,edate,company,location,tools) values (?,?,?,?,?,?,?,?)";

		if (mid != 0) {
			try {
				//Class.forName(driverName);
				//con = DriverManager.getConnection(url, user, dbpsw);
				con = DbUtils.getConnection();
				ps = con.prepareStatement(sql);
				ps.setInt(1, mid);
				ps.setString(2, title);
				ps.setString(3, description);
				ps.setDate(4, java.sql.Date.valueOf(sdate));
				ps.setDate(5, java.sql.Date.valueOf(edate));
				ps.setString(6, company);
				ps.setString(7, location);
				ps.setString(8, tools);

				ps.execute();

				ps.close();
				response.sendRedirect("/dot/college/profile/welcome.jsp");
			} catch (SQLException sqe) {
				sqe.printStackTrace();
			}
		}
	}

}
