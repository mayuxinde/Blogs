package com.demo.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Test {

	private static String username = "root";
	private static String password = "root";
	private static String driverName = "com.mysql.jdbc.Driver";
	private static String url = "jdbc:mysql://localhost:3306/project";

	public Connection getConnection() {

		Connection conn = null;

		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, username, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	public static void main(String[] args) {

		Connection conn = new Test().getConnection();
		PreparedStatement pst = null;
		String sql = "insert into message values(default,?,?,?,?,?)";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, 1);
			pst.setString(2, "马宇欣");
			pst.setString(3, "循环生成的message");
			pst.setString(4, "2019:01:03 19:44:46");
			pst.setString(5, "upload//1546062696840-马宇欣.jpg");
			for (int i = 0; i < 500; i++) {
				pst.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
