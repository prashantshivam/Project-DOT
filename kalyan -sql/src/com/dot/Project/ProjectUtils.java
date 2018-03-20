package com.dot.Project;

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
import com.dot.Member.MemberProject;

public class ProjectUtils {
  
	static String driverName = "com.mysql.jdbc.Driver";
	static String url = "jdbc:mysql://localhost:3306/dot";
	static String user = "root";
	static String dbpsw = "hadoop";
	
	public static List selectProject(HttpServletRequest request,
			HttpServletResponse response) throws ClassNotFoundException,
			IOException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ResultSet rs1[] = null;
		String sql = "select * from project";

		List<Project> list = new ArrayList<Project>();
		try {

			/*Class.forName(driverName);
			con = DriverManager.getConnection(url, user, dbpsw);*/
			con = DbUtils.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				int usertyp = rs.getInt("pid");
				String usertype = rs.getString("pname");
				int usertype1 = rs.getInt("pstatus");
				String usertype2 = rs.getString("startdate");
				String usertype3 = rs.getString("enddate");
				String usertype4 = rs.getString("summary");
				Project p = new Project(usertyp, usertype, usertype1,
						usertype2, usertype3, usertype4);
				list.add(p);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}
	
	public static List selectProjectAdmin(HttpServletRequest request,
			HttpServletResponse response, int a, int userid)
			throws ClassNotFoundException, IOException {

		List<MemberProject> list = new ArrayList<MemberProject>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet r = null;
		try {

			String sql7 = "select isadmin from work_by where mid=? and pid=?";
			Class.forName(driverName);
			con = DriverManager.getConnection(url, user, dbpsw);
			ps = con.prepareStatement(sql7);
			ps.setInt(1, userid);
			ps.setInt(2, a);
			r = ps.executeQuery();

			while (r.next()) {
				int user_id = r.getInt("isadmin");
				MemberProject mp = new MemberProject(userid, a, user_id, null,
						0);
				list.add(mp);

			}
			con.close();
		}

		catch (Exception e) {
			e.printStackTrace();
			System.out.println("homeadmin" + e);
		}
		return list;
	}
	
	public static List selectProjectlink(HttpServletRequest request,
			HttpServletResponse response, int a) throws ClassNotFoundException,
			IOException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ResultSet rs1[] = null;
		String sql = "select * from projet_links where pid=?";

		List<ProjectLink> list = new ArrayList<ProjectLink>();
		try {

			Class.forName(driverName);
			con = DriverManager.getConnection(url, user, dbpsw);
			ps = con.prepareStatement(sql);
			ps.setInt(1, a);
			rs = ps.executeQuery();
			while (rs.next()) {
				int pid = rs.getInt("pid");
				String plink = rs.getString("plink");

				ProjectLink p = new ProjectLink(pid, plink);
				list.add(p);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}
   
	public static void insertprojtool(HttpServletRequest request,
			HttpServletResponse response, int a) throws ClassNotFoundException,
			IOException {

		int tid = (Integer) request.getAttribute("tid");
		Connection con = null;
		PreparedStatement ps = null;
		try {
			Class.forName(driverName);
			con = DriverManager.getConnection(url, user, dbpsw);
			ps = con.prepareStatement("insert into worked_with(pid,tid) values (?,?)");
			ps.setInt(1, a);
			ps.setInt(2, tid);
			int rs2 = ps.executeUpdate();
			// out.println("tool added");
		}

		catch (SQLException sqe) {
			// out.println("home"+sqe);
		}

	}
	


	public static List selectProjectdetail(HttpServletRequest request,
			HttpServletResponse response, int a) throws ClassNotFoundException,
			IOException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ResultSet rs1[] = null;
		String sql = "select * from project where pid=?";

		List<Project> list = new ArrayList<Project>();
		try {

			Class.forName(driverName);
			con = DriverManager.getConnection(url, user, dbpsw);
			ps = con.prepareStatement(sql);
			ps.setInt(1, a);
			rs = ps.executeQuery();
			while (rs.next()) {
				int usertyp = rs.getInt("pid");
				String usertype = rs.getString("pname");
				int usertype1 = rs.getInt("pstatus");
				String usertype2 = rs.getString("startdate");
				String usertype3 = rs.getString("enddate");
				String usertype4 = rs.getString("summary");
				Project p = new Project(usertyp, usertype, usertype1,
						usertype2, usertype3, usertype4);
				list.add(p);
			}
		} catch (Exception e) {
			System.out.println("projdetail" + e);
		}
		return list;
	}
	
	public static void insertlink(HttpServletRequest request,
			HttpServletResponse response, int a) throws ClassNotFoundException,
			IOException {
		HttpSession session = request.getSession(true);

		String plink = (String) request.getAttribute("plink");

		try {
			Class.forName(driverName);

			Connection con = null;
			PreparedStatement ps = null;
			PreparedStatement ps1 = null;
			PreparedStatement ps2 = null;
			ResultSet rs = null;
			con = DriverManager.getConnection(url, user, dbpsw);
			ps = con.prepareStatement("insert into projet_links() values(?,?,?)");
			ps.setString(1, plink);
			ps.setInt(2, a);
			ps.setInt(3, 0);
			int rs2 = ps.executeUpdate();
			// out.println("Link added");
		}

		catch (SQLException sqe) {
			// out.println("home"+sqe);
		}
	}

	
	
}
