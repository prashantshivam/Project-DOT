package com.dot.Course;

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

public class CoursesUtils {
	
	static String driverName = "com.mysql.jdbc.Driver";
	static String url = "jdbc:mysql://localhost:3306/dot";
	static String user = "root";
	static String dbpsw = "hadoop";
	
	
	
	
	
	
	public static List selectCourse(HttpServletRequest request,
			HttpServletResponse response) throws ClassNotFoundException,
			IOException {

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet r = null;

		String sql3 = "select * from courses where mid=?";

		List<Courses> list = new ArrayList<Courses>();
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
			
			ps = con.prepareStatement(sql3);
			ps.setInt(1, n);
			r = ps.executeQuery();

			while (r.next()) {

				int cid = r.getInt("cid");
				int mid = r.getInt("mid");
				String title = r.getString("title");
				String desc = r.getString("description");
				String date = r.getString("cdate");

				Courses cs = new Courses(cid, mid, title, desc, date);
				list.add(cs);

			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	public static void insertCourses(HttpServletRequest request,
			HttpServletResponse response) throws ClassNotFoundException,
			IOException

	{

		HttpSession session = request.getSession(true);

		String mid1 = session.getAttribute("mid").toString();
		int mid = Integer.parseInt(mid1);
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ResultSet rs1[] = null;

		String title = request.getParameter("title");
		String description = request.getParameter("description");
		// String isuser=request.getParameter("isuser");

		String date = request.getParameter("cdate");
		// int aid=1;
		String sql = "insert into courses (mid,title,description,cdate) values (?,?,?,?)";

		if (mid != 0) {
			try {
				//Class.forName(driverName);
				//con = DriverManager.getConnection(url, user, dbpsw);
				con = DbUtils.getConnection();
				ps = con.prepareStatement(sql);
				ps.setInt(1, mid);
				ps.setString(2, title);
				ps.setString(3, description);

				ps.setDate(4, java.sql.Date.valueOf(date));

				ps.execute();
				ps.close();
				response.sendRedirect("/dot/college/profile/welcome.jsp");
			}

			catch (SQLException sqe) {
				sqe.printStackTrace();
			}
		}
	}

}
