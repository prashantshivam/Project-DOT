package com.dot.Reference;


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

public class ReferenceUtils {
	
	static String driverName = "com.mysql.jdbc.Driver";
	static String url = "jdbc:mysql://localhost:3306/dot";
	static String user = "root";
	static String dbpsw = "hadoop";
	// List<String> list1 = DbUtils.data(request,response);
	
	public static List selectReference(HttpServletRequest request,
			HttpServletResponse response) throws ClassNotFoundException,
			IOException {

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ResultSet rs1[] = null;

		String sql = "select refid,level,rlink,mid from reference where tid =? order by level";

		List<Reference> list = new ArrayList<Reference>();
		int n = Integer.parseInt(request.getParameter("tid"));
		try {

			/*Class.forName(driverName);
			con = DriverManager.getConnection(url, user, dbpsw);*/
			con = DbUtils.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, n);
			rs = ps.executeQuery();
			while (rs.next()) {
				String link = rs.getString("rlink");
				String stage = rs.getString("level");
				int refid = rs.getInt("refid");
				int member = rs.getInt("mid");

				Reference r = new Reference(refid, n, link, member, stage);
				list.add(r);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}

	public static void insertref(HttpServletRequest request,
			HttpServletResponse response) throws ClassNotFoundException,
			IOException {
		HttpSession session = request.getSession(true);
		int mid = (Integer) session.getAttribute("mid");
		String link = request.getParameter("path");
		int tid = Integer.parseInt(request.getParameter("path1"));
		int level = Integer.parseInt(request.getParameter("path2"));
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "insert into reference(tid,level,rlink,mid) values(?,?,?,?)";

		try {

			Class.forName(driverName);
			con = DriverManager.getConnection(url, user, dbpsw);
			ps = con.prepareStatement(sql);
			ps.setInt(1, tid);
			ps.setString(3, link);
			ps.setInt(2, level);
			ps.setInt(4, mid);
			int rs1 = ps.executeUpdate();
		} catch (SQLException sqe) {
			sqe.printStackTrace();
		}

	}


}
