package com.dot.Skills;

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

public class SkillsUtils {
	
	

	public static List selectSkill(HttpServletRequest request,
			HttpServletResponse response) throws ClassNotFoundException,
			IOException

	{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet r = null;

		String sql4 = "select * from skills,has_skills where mid=? and skills.sid=has_skills.sid";
		int n = 0;
		try {
			n = Integer.parseInt(request.getParameter("mid"));
		} catch (Exception e) {
			HttpSession session = request.getSession(true); // to get the mid of
															// the

			n = (Integer) session.getAttribute("mid");

		}
		List<Skills> list = new ArrayList<Skills>();
		//List<Skills> list4 = new ArrayList<Skills>();

		try {

			/*Class.forName(driverName);
			con = DriverManager.getConnection(url, user, dbpsw);*/
			con = DbUtils.getConnection();
			ps = con.prepareStatement(sql4);
			ps.setInt(1, n);
			r = ps.executeQuery();

			while (r.next()) {
				int sid = r.getInt("sid");
				String skill = r.getString("skill");
				int mid = r.getInt("mid");

				Skills sk = new Skills(sid, skill, mid);
				list.add(sk);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public static List selectnotSkill(HttpServletRequest request,
			HttpServletResponse response) throws ClassNotFoundException,
			IOException

	{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet r = null;

		String sql4 = "select * from skills where sid not in(select has_skills.sid from has_skills where mid=?)";
		int n = 0;
		try {
			n = Integer.parseInt(request.getParameter("mid"));
		} catch (Exception e) {
			HttpSession session = request.getSession(true); // to get the mid of
															// the

			n = (Integer) session.getAttribute("mid");

		}
		List<NotSkills> list = new ArrayList<NotSkills>();

		try {

			//Class.forName(driverName);
			//con = DriverManager.getConnection(url, user, dbpsw);
			con = DbUtils.getConnection();
			ps = con.prepareStatement(sql4);
			ps.setInt(1, n);
			r = ps.executeQuery();

			while (r.next()) {
				int sid = r.getInt("sid");
				String skill = r.getString("skill");

				NotSkills sk = new NotSkills(sid, skill);
				list.add(sk);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("home" + e);
		}
		return list;
	}


	public static void insertSkill(HttpServletRequest request,
			HttpServletResponse response) throws ClassNotFoundException,
			IOException {
		 
		System.out.println("hi");
		
		HttpSession session = request.getSession(true); // to get the mid of the
														// session

		String mid1 = session.getAttribute("mid").toString();
		int mid = Integer.parseInt(mid1);
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		// ResultSet rs1[] = null;

		
		String skill = request.getParameter("skill");
		// out.println("skill="+skill);
		int sid = 0;
		// out.println(sid1);
		String sql1 = "select sid from skills where skill=?";
         System.out.println("hi");
		try {
		
			con = DbUtils.getConnection();
			ps = con.prepareStatement(sql1);

			ps.setString(1, skill);

			rs = ps.executeQuery();

			while (rs.next()) {
				sid = rs.getInt("sid");
			}

			ps.close();
		} catch (SQLException sqe) {
			sqe.printStackTrace();

		}
		System.out.println("hi");
		String sql = "insert into has_skills (sid,mid) values (?,?)";
		System.out.println("hi");

		if (mid != 0) {
			try {
				//Class.forName(driverName);
				//con = DriverManager.getConnection(url, user, dbpsw);
				con = DbUtils.getConnection();
				ps = con.prepareStatement(sql);
				ps.setInt(1, sid);
				ps.setInt(2, mid);

				ps.execute();

				ps.close();
				response.sendRedirect("/dot/college/profile/welcome.jsp");
			} catch (SQLException sqe) {
				sqe.printStackTrace();
			}
		}
	}

}
