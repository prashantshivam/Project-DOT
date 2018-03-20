package com.dot.Member;

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

public class MemberUtils {
          
	
	
	public static List selectMember(HttpServletRequest request,
			HttpServletResponse response) throws ClassNotFoundException,
			IOException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet r = null;
		String sql = "select * from member where mid=?";
		List<Member> list = new ArrayList<Member>();
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
			ps = con.prepareStatement(sql);
			ps.setInt(1, n);
			r = ps.executeQuery();
			while (r.next()) {
				String fname = r.getString("fname");
				String lname = r.getString("lname");
				String date = r.getString("dob");
				int mobileno = r.getInt("mobileno");
				String fb = r.getString("facebook");
				String linked = r.getString("linkedin");
				String twitter = r.getString("twitter");
				String web = r.getString("website");

				Member mem = new Member(n, fname, lname, mobileno, date, fb,
						linked, twitter, web);
				list.add(mem);
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}
	
	public static List selectMemberProject(HttpServletRequest request,
			HttpServletResponse response) throws ClassNotFoundException,
			IOException

	{

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet r = null;

		String sql5 = "select * from work_by inner join project on project.pid=work_by.pid where mid=?";

		int n = 0;
		try {
			n = Integer.parseInt(request.getParameter("mid"));
		} catch (Exception e) {
			HttpSession session = request.getSession(true);

			n = (Integer) session.getAttribute("mid");

		}
		List<MemberProject> list = new ArrayList<MemberProject>();

		try {

			con = DbUtils.getConnection();
			ps = con.prepareStatement(sql5);
			ps.setInt(1, n);
			r = ps.executeQuery();

			while (r.next()) {
				int mid = r.getInt("mid");
				int pid = r.getInt("pid");
				int isadmin = r.getInt("isadmin");
				String pname = r.getString("pname");
				int pstatus = r.getInt("pstatus");

				MemberProject mp = new MemberProject(mid, pid, isadmin, pname,
						pstatus);
				list.add(mp);
			}

			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("home" + e);
		}
		return list;

	}
	
	
	public static List selectMemberProjectdetail(HttpServletRequest request,
			HttpServletResponse response, int a) throws ClassNotFoundException,
			IOException

	{

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet r = null;

		String sql5 = "select member.mid,member.fname,member.lname from work_by inner join member"
				+ " on work_by.mid=member.mid where pid =?";

		List<MemberProject> list = new ArrayList<MemberProject>();
		try {

			con = DbUtils.getConnection();
			ps = con.prepareStatement(sql5);
			ps.setInt(1, a);
			r = ps.executeQuery();

			while (r.next()) {
				int mid = r.getInt("mid");

				String fname = r.getString("fname");
				String lname = r.getString("fname");

				MemberProject mp = new MemberProject(mid, fname, lname);
				list.add(mp);
			}

			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("homememdetail" + e);
		}
		return list;

	}
   
	public static void insertmember(HttpServletRequest request,
			HttpServletResponse response) throws ClassNotFoundException,
			IOException {
		HttpSession session = request.getSession(true);
		String mid = session.getAttribute("mid").toString();
		int mid1 = Integer.valueOf(mid);
		Connection con = null;
		PreparedStatement ps = null;
		PreparedStatement ps1 = null;
		PreparedStatement ps2 = null;
		ResultSet rs = null;
		String date = "2000-01-01";
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		int mob = Integer.valueOf(request.getParameter("mobileno"));
		date = request.getParameter("dob");
		String facebook = request.getParameter("facebook");
		String linkedin = request.getParameter("linkedin");
		String twitter = request.getParameter("twitter");
		String website = request.getParameter("website");

		String sql = "update member set fname=?, lname=?, mobileno=?, dob=?, facebook=?, linkedin=?, twitter=?, website=? where mid=?;";
		String sql1 = "select * from member where mid=?";
		String sql2 = "insert into member(mid,fname,lname,mobileno,dob,facebook,linkedin,twitter,website) values (?,?,?,?,?,?,?,?,?)";
		if ((!(mid.equals(null) || mid.equals("")))) {
			try {
				con = DbUtils.getConnection();
				ps1 = con.prepareStatement(sql1);
				ps1.setString(1, mid);
				ps = con.prepareStatement(sql);
				ps.setString(1, fname);
				ps.setString(2, lname);
				ps.setInt(3, mob);
				ps.setDate(4, java.sql.Date.valueOf(date));
				ps.setString(5, facebook);
				ps.setString(6, linkedin);
				ps.setString(7, twitter);
				ps.setString(8, website);
				ps.setInt(9, mid1);

				rs = ps1.executeQuery();
				if (rs.next()) {

					ps.executeUpdate();
					response.sendRedirect("welcome.jsp");
				} else {
					ps2 = con.prepareStatement(sql2);
					ps2.setInt(1, mid1);
					ps2.setString(2, fname);
					ps2.setString(3, lname);
					ps2.setInt(4, mob);
					ps2.setDate(5, java.sql.Date.valueOf(date));
					ps2.setString(6, facebook);
					ps2.setString(7, linkedin);
					ps2.setString(8, twitter);
					ps2.setString(9, website);

					ps2.execute();
					response.sendRedirect("/dot/college/profile/welcome.jsp");
				}
			} catch (SQLException sqe) {
				// out.println("Some error occured during updating the profile"+sqe);

				// <p><a href="welcome.jsp">click here to go to profile
				// page</a></p>

			}
		} else {

			// <center><p style="color:red">Error In Login</p></center>
			// <p><a href="login.html">click here to try again</a></p>
		}
	}

	

	public static void insertprojmem(HttpServletRequest request,
			HttpServletResponse response, int a) throws ClassNotFoundException,
			IOException {
		HttpSession session = request.getSession(true);
		Connection con = null;
		PreparedStatement ps = null;
		PreparedStatement ps1 = null;
		PreparedStatement ps2 = null;
		int m = (Integer) request.getAttribute("meid");
		try {
			con = DbUtils.getConnection();
			ps = con.prepareStatement("insert into work_by() values(?,?,?)");
			ps.setInt(1, a);
			ps.setInt(2, m);
			ps.setInt(3, 0);
			int rs1 = ps.executeUpdate();
			// out.println("member added");
		}

		catch (SQLException sqe) {
			// out.println("home"+sqe);
		}
	}

	
	
	
	
	
	
	
	
	
}
