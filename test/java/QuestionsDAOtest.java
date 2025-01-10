import com.questions.dao.*;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.provider.model.provider;
import com.questions.model.Questions;

class QuestionDAOTest {

	private Connection mockConnection;
	private PreparedStatement mockPreparedStatement;
	private ResultSet mockResultSet;

	@BeforeEach
	void setUp() throws Exception {
		mockConnection = mock(Connection.class);
		mockPreparedStatement = mock(PreparedStatement.class);
		mockResultSet = mock(ResultSet.class);

		// Mock provider to return the mocked connection
		provider mockProvider = mock(provider.class);
		when(mockProvider.getMySQLConnection()).thenReturn(mockConnection);
	}

	@Test
	void testInsertQuestion_Success() throws Exception {

		Questions question = new Questions();
		question.setQuestion("What is Java?");
		question.setA("Programming Language");
		question.setB("Fruit");
		question.setC("Animal");
		question.setD("Car");
		question.setAnswer("A");

		when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
		when(mockPreparedStatement.executeUpdate()).thenReturn(1);

		// Act
		boolean result = QuestionDAO.insertQuestion(question);

		// Assert
		assertTrue(result);
		verify(mockPreparedStatement).setString(1, "What is Java?");
		verify(mockPreparedStatement).setString(2, "Programming Language");
		verify(mockPreparedStatement).setString(3, "Fruit");
		verify(mockPreparedStatement).setString(4, "Animal");
		verify(mockPreparedStatement).setString(5, "Car");
		verify(mockPreparedStatement).setString(6, "A");
		verify(mockPreparedStatement).executeUpdate();
	}

	@Test
	void testInsertQuestion_Failure() throws Exception {
		// Arrange
		Questions question = new Questions();
		question.setQuestion("What is Java?");
		question.setA("Programming Language");
		question.setB("Fruit");
		question.setC("Animal");
		question.setD("Car");
		question.setAnswer("A");

		when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
		when(mockPreparedStatement.executeUpdate()).thenReturn(0);

		// Act
		boolean result = QuestionDAO.insertQuestion(question);

		// Assert
		assertFalse(result);
	}

	@Test
	void testGetAllRecords() throws Exception {
		// Arrange
		when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
		when(mockPreparedStatement.executeQuery()).thenReturn(mockResultSet);
		when(mockResultSet.next()).thenReturn(true, false); // Simulate one record
		when(mockResultSet.getString("question")).thenReturn("What is Java?");
		when(mockResultSet.getString("a")).thenReturn("Programming Language");
		when(mockResultSet.getString("b")).thenReturn("Fruit");
		when(mockResultSet.getString("c")).thenReturn("Animal");
		when(mockResultSet.getString("d")).thenReturn("Car");
		when(mockResultSet.getString("answer")).thenReturn("A");

		// Act
		ArrayList<Questions> result = QuestionDAO.getAllRecords();

		// Assert
		assertNotNull(result);
		assertEquals(1, result.size());
		assertEquals("What is Java?", result.get(0).getQuestion());
		assertEquals("Programming Language", result.get(0).getA());
	}

	@Test
	void testDeleteRecord_Success() throws Exception {
		// Arrange
		Questions question = new Questions();
		question.setQuestion("What is Java?");

		when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
		when(mockPreparedStatement.executeUpdate()).thenReturn(1);

		// Act
		int result = QuestionDAO.deleteRecord(question);

		// Assert
		assertEquals(1, result);
		verify(mockPreparedStatement).setString(1, "What is Java?");
		verify(mockPreparedStatement).executeUpdate();
	}

	@Test
	void testDeleteRecord_Failure() throws Exception {
		// Arrange
		Questions question = new Questions();
		question.setQuestion("What is Java?");

		when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
		when(mockPreparedStatement.executeUpdate()).thenReturn(0);

		// Act
		int result = QuestionDAO.deleteRecord(question);

		// Assert
		assertEquals(0, result);
	}

	@Test
	void testDoUpdateNowRecord_Success() throws Exception {
		// Arrange
		String originalQuestion = "What is Java?";
		String newQuestion = "What is Python?";
		String optA = "Programming Language";
		String optB = "Fruit";
		String optC = "Animal";
		String optD = "Car";
		String answer = "A";

		when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
		when(mockPreparedStatement.executeUpdate()).thenReturn(1);

		// Act
		int result = QuestionDAO.doUpdateNowRecord(originalQuestion, newQuestion, optA, optB, optC, optD, answer);

		// Assert
		assertEquals(1, result);
		verify(mockPreparedStatement).setString(1, newQuestion);
		verify(mockPreparedStatement).setString(2, optA);
		verify(mockPreparedStatement).setString(3, optB);
		verify(mockPreparedStatement).setString(4, optC);
		verify(mockPreparedStatement).setString(5, optD);
		verify(mockPreparedStatement).setString(6, answer);
		verify(mockPreparedStatement).setString(7, originalQuestion);
		verify(mockPreparedStatement).executeUpdate();
	}

	@Test
	void testDoUpdateNowRecord_Failure() throws Exception {
		// Arrange
		String originalQuestion = "What is Java?";
		String newQuestion = "What is Python?";
		String optA = "Programming Language";
		String optB = "Fruit";
		String optC = "Animal";
		String optD = "Car";
		String answer = "A";

		when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
		when(mockPreparedStatement.executeUpdate()).thenReturn(0);

		// Act
		int result = QuestionDAO.doUpdateNowRecord(originalQuestion, newQuestion, optA, optB, optC, optD, answer);

		// Assert
		assertEquals(-1, result);
	}

	@Test
	void testDoUpdateNowRecord_Error() throws Exception {
		// Arrange
		String originalQuestion = "What is Java?";
		String newQuestion = "What is Python?";
		String optA = "Programming Language";
		String optB = "Fruit";
		String optC = "Animal";
		String optD = "Car";
		String answer = "A";

		when(mockConnection.prepareStatement(anyString())).thenThrow(new Exception("Database error"));

		// Act
		int result = QuestionDAO.doUpdateNowRecord(originalQuestion, newQuestion, optA, optB, optC, optD, answer);

		// Assert
		assertEquals(2, result); // Indicates error occurred
	}
}
