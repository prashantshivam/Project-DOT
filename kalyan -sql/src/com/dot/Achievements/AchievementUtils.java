package com.dot.Achievements;

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

public class AchievementUtils {


	public static List selectAchieve(HttpServletRequest request,
			HttpServletResponse response) throws ClassNotFoundException,
			IOException {
				
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet r = null;
		String sql2 = "select * from achievements where mid=?";
		List<Achievements> list = new ArrayList<Achievements>();
		int n = 0;
		try {
			n = Integer.parseInt(request.getParameter("mid"));
		} catch (Exception e) {
			HttpSession session = request.getSession(true); // to get the mid of
															// the

			n = (Integer) session.getAttribute("mid");

		}
		try {

			con = DbUtils.getConnection();
			ps = con.prepareStatement(sql2);
			ps.setInt(1, n);
			r = ps.executeQuery();
			while (r.next()) {
				int aid = r.getInt("aid");
				int mid = r.getInt("mid");
				String title = r.getString("title");
				String desc = r.getString("description");
				String adate = r.getString("adate");
				String issuer = r.getString("issuer");
				Achievements ach = new Achievements(aid, mid, title, desc,
						issuer, adate);
				list.add(ach);

			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public static void insertAchievements(HttpServletRequest request,
			HttpServletResponse response) throws ClassNotFoundException,
			IOException

	{ 

		HttpSession session = request.getSession(true); // to get the mid of the
														// session
		String mid1 = session.getAttribute("mid").toString();
		int mid = Integer.parseInt(mid1);
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ResultSet rs1[] = null;
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String isuser = request.getParameter("isuser");
		String date = request.getParameter("date");
		// int aid=1;
		//DbUtils b = new DbUtils();
	String sql = "insert into achievements (mid,title,description,issuer,adate) values (?,?,?,?,?)";
	//String sql="";

		if (mid != 0) {
			try {
				//Class.forName(driverName);
				// con = DriverManager.getConnection(url, user, dbpsw);

				con = DbUtils.getConnection();
				ps = con.prepareStatement(sql);
				ps.setInt(1, mid);
				ps.setString(2, title);
				ps.setString(3, description);
				ps.setString(4, isuser);
				ps.setDate(5, java.sql.Date.valueOf(date));

				ps.execute();
				ps.close();
				response.sendRedirect("/dot/college/profile/welcome.jsp");
				} catch (SQLException sqe) {
				System.out.println(sqe);
				
			}
		}
	}
}
