package com.students.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.provider.model.*;
import com.students.model.*;

public class StudentsDAO {
	public static boolean doValidate(Students sd) {
		// TODO Auto-generated method stub
		boolean status = false;
		try {

			Connection con = provider.getMySQLConnection();
			String sql = "select * from StudentTable where userid=? and password=?";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, sd.getUsername());
			pst.setString(2, sd.getPassword());
			ResultSet rs = pst.executeQuery();

			if (rs.next()) {
				sd.setName(rs.getString("name"));
				status = true;
			} else {
				status = false;
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static boolean insertStudent(Students st) {
		// TODO Auto-generated method stub
		boolean status = false;
		try {

			Connection con = provider.getMySQLConnection();
			String sql = "insert into StudentTable values(?,?,?)";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, st.getUsername());
			pst.setString(2, st.getPassword());
			pst.setString(3, st.getName());
			int val = pst.executeUpdate();
			if (val > 0) {
				status = true;
			} else {
				status = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public static ArrayList<Students> getAllRecords() {
		ArrayList<Students> samp = new ArrayList<Students>();
		try {

			samp.clear();
			Connection con = provider.getMySQLConnection();
			String sql = "select * from StudentTable";
			PreparedStatement pst = con.prepareStatement(sql);

			ResultSet rs = pst.executeQuery(sql);
			while (rs.next()) {
				Students s = new Students();
				s.setUsername(rs.getString(1));
				s.setPassword(rs.getString(2));
				s.setName(rs.getString(3));
				samp.add(s);

			}

		} catch (Exception e2) {
			e2.printStackTrace();
		}
		return samp;
	}

	public static int deleteRecord(Students st) {
		// TODO Auto-generated method stub
		int status = 0;
		try {

			Connection con = provider.getMySQLConnection();
			String sql = "delete from  StudentTable where userid=?";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, st.getUsername());

			int val = pst.executeUpdate();
			if (val > 0) {
				status = 1;
			} else {
				status = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public static String getStudentName(String username) {
		// TODO Auto-generated method stub
		String name = null;
		try {

			Connection con = provider.getMySQLConnection();
			String sql = "select name from StudentTable where userid=?";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, username);

			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				name = rs.getString(1);
			} else {
				name = "DB-Error";
			}

		} catch (Exception e) {
			name = e.getMessage();
		}
		return name;

	}
	public static int doUpdateNowRecord(String originalUsername, String newUserId, String newPassword, String newName) {
	    int status = 0;
	    String sql = "UPDATE StudentTable SET userid = ?, password = ?, name = ? WHERE userid = ?";
	    
	    try (Connection con = provider.getMySQLConnection();
	         PreparedStatement pst = con.prepareStatement(sql)) {
	        
	        // Set parameters
	        pst.setString(1, newUserId);
	        pst.setString(2, newPassword);
	        pst.setString(3, newName);
	        pst.setString(4, originalUsername);

	        // Execute update
	        int rowsAffected = pst.executeUpdate();
	        status = (rowsAffected > 0) ? 1 : -1; // Success or failure
	    } catch (SQLException e) {
	        status = 2; // Error code for exception
	        e.printStackTrace();
	    }
	    return status;
	}

	}
