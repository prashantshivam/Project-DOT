package com.dot.Tools;

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

public class ToolsUtils {


	public static List selectTools(HttpServletRequest request,
			HttpServletResponse response) throws ClassNotFoundException,
			IOException {

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet r = null;

String sql7 = "select tools.tid,tools.tname from worked_with inner join tools "
		+ "on tools.tid=worked_with.tid where worked_with.pid=?";

		int n = (Integer) request.getAttribute("id");

		List<Tools> list = new ArrayList<Tools>();

		try {

			/*Class.forName(driverName);
			con = DriverManager.getConnection(url, user, dbpsw);*/
			con = DbUtils.getConnection();
			ps = con.prepareStatement(sql7);
			ps.setInt(1, n);
			r = ps.executeQuery();

			while (r.next()) {

				int tid = r.getInt("tid");
				String tname = r.getString("tname");

				Tools ts = new Tools(tid, tname, n);
				list.add(ts);
			}
			
		}

		catch (Exception e) {
			e.printStackTrace();
			System.out.println("hometool" + e);
		}
		return list;

	}
}
