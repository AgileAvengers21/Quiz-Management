package com.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.DriverManager;

import com.admin.model.Admin;
import com.provider.model.*;

public class AdminDAO {
	public static boolean doValidate(Admin ad) {

		boolean status = false;
		try {
			Connection con = provider.getMySQLConnection();
			String sql = "select * from AdminTable where userid=? and password=?";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, ad.getUsername());
			pst.setString(2, ad.getPassword());
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				status = true;
			} else {
				status = false;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
}
