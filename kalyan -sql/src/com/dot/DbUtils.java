package com.dot;

import java.io.IOException;
import java.sql.Connection;

public class DbUtils {
	static String dbName = "rdbms";

	public static Connection getConnection() throws IOException {
		Connection con;
		if (dbName.equals("rdbms")) {
			con = RdbmsUtils.getConnection();
		} else {
			con = RdbmsUtils.getConnection();
		}
		return con;
	}

	public static void main(String[] args) throws IOException {
		Connection connection = DbUtils.getConnection();
	}
}
