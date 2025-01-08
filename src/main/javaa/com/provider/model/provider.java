package com.provider.model;

import java.sql.*;

public class provider {
	public static Connection getMySQLConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quizDB", "root", "kamakshi@04");
			System.out.println("Connection successful!");
		} catch (ClassNotFoundException e) {
			System.err.println("MySQL JDBC Driver not found. Include it in your library path.");
		} catch (SQLException e) {
			System.err.println("SQL Exception: " + e.getMessage());
		} catch (Exception e) {
			System.err.println("An unexpected error occurred: " + e.getMessage());
		}
		return con;
	}
}
