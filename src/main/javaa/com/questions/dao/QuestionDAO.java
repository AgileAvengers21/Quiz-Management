package com.questions.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import com.provider.model.provider;
import com.questions.model.Questions;

public class QuestionDAO {

	// Insert a new question into the database
	public static boolean insertQuestion(Questions q) {
		boolean status = false;
		String sql = "INSERT INTO QuestionTable (question, a, b, c, d, answer) VALUES (?, ?, ?, ?, ?, ?)";

		try (Connection con = provider.getMySQLConnection(); PreparedStatement pst = con.prepareStatement(sql)) {

			// Set parameters for the query
			pst.setString(1, q.getQuestion().trim());
			pst.setString(2, q.getA());
			pst.setString(3, q.getB());
			pst.setString(4, q.getC());
			pst.setString(5, q.getD());
			pst.setString(6, q.getAnswer());

			// Execute the query
			int val = pst.executeUpdate();
			status = val > 0; // If rows are affected, insertion was successful

		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	// Retrieve all records from the database
	public static ArrayList<Questions> getAllRecords() {
		ArrayList<Questions> questionsList = new ArrayList<>();
		String sql = "SELECT * FROM QuestionTable";

		try (Connection con = provider.getMySQLConnection();
				PreparedStatement pst = con.prepareStatement(sql);
				ResultSet rs = pst.executeQuery()) {

			// Iterate through the result set
			while (rs.next()) {
				Questions question = new Questions();
				question.setQuestion(rs.getString("question"));
				question.setA(rs.getString("a"));
				question.setB(rs.getString("b"));
				question.setC(rs.getString("c"));
				question.setD(rs.getString("d"));
				question.setAnswer(rs.getString("answer"));
				questionsList.add(question);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return questionsList;
	}

	// Delete a record based on the question text
	public static int deleteRecord(Questions q) {
		int status = 0;
		String sql = "DELETE FROM QuestionTable WHERE question = ?";

		try (Connection con = provider.getMySQLConnection(); PreparedStatement pst = con.prepareStatement(sql)) {

			pst.setString(1, q.getQuestion());
			int val = pst.executeUpdate();
			status = val > 0 ? 1 : 0;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	// Update an existing record
	public static int doUpdateNowRecord(String originalQuestion, String newQuestion, String optA, String optB,
			String optC, String optD, String answer) {
		int status = 0;
		String sql = "UPDATE QuestionTable SET question = ?, a = ?, b = ?, c = ?, d = ?, answer = ? WHERE question = ?";

		// Using try-with-resources to ensure the connection and statement are closed
		// automatically
		try (Connection con = provider.getMySQLConnection()) {

			// Disable auto-commit to manage the transaction manually
			con.setAutoCommit(false);

			try (PreparedStatement pst = con.prepareStatement(sql)) {
				pst.setString(1, newQuestion);
				pst.setString(2, optA);
				pst.setString(3, optB);
				pst.setString(4, optC);
				pst.setString(5, optD);
				pst.setString(6, answer);
				pst.setString(7, originalQuestion);

				// Execute the update
				int val = pst.executeUpdate();
				 System.out.println("Rows affected: " + val);

				// If the update is successful, commit the transaction
				if (val > 0) {
					con.commit(); // Commit the transaction
					status = 1; // Indicate success
				} else {
					status = -1; // Indicate no rows were affected
				}
			} catch (Exception e) {
				// Rollback the transaction in case of an error
				con.rollback();
				e.printStackTrace();
				status = 2; // Indicates an error occurred
			} finally {
				// Re-enable auto-commit
				con.setAutoCommit(true);
				System.out.println("Executing update query...");

			}

		} catch (Exception e) {
			e.printStackTrace();
			status = 2; // Indicates an error occurred with the connection
		}

		return status;

	}
}
