package com.instructions.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.provider.model.*;
import com.instructions.model.*;

public class InstructionDAO {
	public static boolean insertInstruction(Instruction ist) {
		// TODO Auto-generated method stub
		boolean status = false;
		try {

			Connection con = provider.getMySQLConnection();
			String sql = "insert into InstructionTable values(?)";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, ist.getInstruction());

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

	public static ArrayList<Instruction> getAllRecords() {
		ArrayList<Instruction> samp = new ArrayList<Instruction>();
		try {

			samp.clear();
			Connection con = provider.getMySQLConnection();
			String sql = "select * from InstructionTable";
			PreparedStatement pst = con.prepareStatement(sql);

			ResultSet rs = pst.executeQuery(sql);
			while (rs.next()) {
				Instruction i = new Instruction();
				i.setInstruction(rs.getString(1));
				samp.add(i);

			}

		} catch (Exception e2) {
			e2.printStackTrace();
		}
		return samp;
	}

	public static int deleteRecord(Instruction ist) {
		// TODO Auto-generated method stub
		int val = 0;
		try {

			Connection con = provider.getMySQLConnection();
			String sql = "delete from InstructionTable where instruction=?";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, ist.getInstruction());

			val = pst.executeUpdate();

		} catch (Exception e) {
			val = -1;
		}
		return val;
	}

	public static int doUpdateNowRecord(String instaoriginal, String instamodified) {
		int status = 0;
		try {

			Connection con = provider.getMySQLConnection();
			String sql = "update InstructionTable set instruction=? where instruction=?";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, instamodified);
			pst.setString(2, instaoriginal);

			int val = pst.executeUpdate();
			if (val > 0) {
				status = 1;
			} else {
				status = -1;
			}
		} catch (Exception f) {
			status = 2;
			f.printStackTrace();
		}

		return status;
	}
}
