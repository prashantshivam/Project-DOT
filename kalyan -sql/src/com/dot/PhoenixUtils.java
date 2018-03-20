package com.dot;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ResourceBundle;

public class PhoenixUtils {
	static Connection con;

	public static Connection getConnection() throws IOException {
		if (con == null) {
			con = getDBConnection();
		}
		return con;
	}

	private static Connection getDBConnection() throws IOException {
		Connection con = null;
		String url = "";
		String username = "";
		String password = "";
		String driverclass = "";
		try {
			ResourceBundle s = ResourceBundle.getBundle("/kalyan-phoenix.properties");
			driverclass = s.getString("driverclass");
			url = s.getString("url");
			username = s.getString("username");
			password = s.getString("password");
		} catch (Exception e) {
			// System.out.println("Exception : " + e);
		}

		try {
			Class.forName(driverclass);
			con = DriverManager.getConnection(url, username, password);
		} catch (Exception e) {
			// System.out.println("Exception : " + e);
		}
		return con;
	}

	public static void main(String[] args) throws IOException {
		Connection connection = PhoenixUtils.getConnection();
	}
}
