import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

import com.provider.model.provider;
import com.students.dao.*;
import com.students.model.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class StudentsDAOTest {

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
	void testDoValidate_Success() throws Exception {
		// Arrange
		Students student = new Students();
		student.setUsername("testuser");
		student.setPassword("testpassword");

		when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
		when(mockPreparedStatement.executeQuery()).thenReturn(mockResultSet);
		when(mockResultSet.next()).thenReturn(true);
		when(mockResultSet.getString("name")).thenReturn("Test User");

		// Act
		boolean result = StudentsDAO.doValidate(student);

		// Assert
		assertTrue(result);
		assertEquals("Test User", student.getName());
	}

	@Test
	void testDoValidate_Failure() throws Exception {
		// Arrange
		Students student = new Students();
		student.setUsername("wronguser");
		student.setPassword("wrongpassword");

		when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
		when(mockPreparedStatement.executeQuery()).thenReturn(mockResultSet);
		when(mockResultSet.next()).thenReturn(false);

		// Act
		boolean result = StudentsDAO.doValidate(student);

		// Assert
		assertFalse(result);
	}

	@Test
	void testInsertStudent_Success() throws Exception {
		// Arrange
		Students student = new Students();
		student.setUsername("newuser");
		student.setPassword("newpassword");
		student.setName("New User");

		when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
		when(mockPreparedStatement.executeUpdate()).thenReturn(1);

		// Act
		boolean result = StudentsDAO.insertStudent(student);

		// Assert
		assertTrue(result);
	}

	@Test
	void testInsertStudent_Failure() throws Exception {
		// Arrange
		Students student = new Students();
		student.setUsername("newuser");
		student.setPassword("newpassword");
		student.setName("New User");

		when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
		when(mockPreparedStatement.executeUpdate()).thenReturn(0);

		// Act
		boolean result = StudentsDAO.insertStudent(student);

		// Assert
		assertFalse(result);
	}

	@Test
	void testGetAllRecords_Success() throws Exception {
		// Arrange
		ArrayList<Students> expectedList = new ArrayList<>();
		Students student = new Students();
		student.setUsername("testuser");
		student.setPassword("testpassword");
		student.setName("Test User");
		expectedList.add(student);

		when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
		when(mockPreparedStatement.executeQuery()).thenReturn(mockResultSet);
		when(mockResultSet.next()).thenReturn(true, false);
		when(mockResultSet.getString(1)).thenReturn("testuser");
		when(mockResultSet.getString(2)).thenReturn("testpassword");
		when(mockResultSet.getString(3)).thenReturn("Test User");

		// Act
		ArrayList<Students> result = StudentsDAO.getAllRecords();

		// Assert
		assertNotNull(result);
		assertEquals(1, result.size());
		assertEquals("testuser", result.get(0).getUsername());
	}

	@Test
	void testDeleteRecord_Success() throws Exception {
		// Arrange
		Students student = new Students();
		student.setUsername("testuser");

		when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
		when(mockPreparedStatement.executeUpdate()).thenReturn(1);

		// Act
		int result = StudentsDAO.deleteRecord(student);

		// Assert
		assertEquals(1, result);
	}

	@Test
	void testDeleteRecord_Failure() throws Exception {
		// Arrange
		Students student = new Students();
		student.setUsername("testuser");

		when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
		when(mockPreparedStatement.executeUpdate()).thenReturn(0);

		// Act
		int result = StudentsDAO.deleteRecord(student);

		// Assert
		assertEquals(0, result);
	}

	@Test
	void testGetStudentName_Success() throws Exception {
		// Arrange
		String expectedName = "Test User";
		when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
		when(mockPreparedStatement.executeQuery()).thenReturn(mockResultSet);
		when(mockResultSet.next()).thenReturn(true);
		when(mockResultSet.getString(1)).thenReturn(expectedName);

		// Act
		String result = StudentsDAO.getStudentName("testuser");

		// Assert
		assertEquals(expectedName, result);
	}

	@Test
	void testGetStudentName_Failure() throws Exception {
		// Arrange
		when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
		when(mockPreparedStatement.executeQuery()).thenReturn(mockResultSet);
		when(mockResultSet.next()).thenReturn(false);

		// Act
		String result = StudentsDAO.getStudentName("wronguser");

		// Assert
		assertEquals("DB-Error", result);
	}

	@Test
	void testDoUpdateNowRecord_Success() throws Exception {
		// Arrange
		String originalUsername = "testuser";
		String newUserId = "newuser";
		String newPassword = "newpassword";
		String newName = "New User";

		when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
		when(mockPreparedStatement.executeUpdate()).thenReturn(1);

		// Act
		int result = StudentsDAO.doUpdateNowRecord(originalUsername, newUserId, newPassword, newName);

		// Assert
		assertEquals(1, result);
	}

	@Test
	void testDoUpdateNowRecord_Failure() throws Exception {
		// Arrange
		String originalUsername = "testuser";
		String newUserId = "newuser";
		String newPassword = "newpassword";
		String newName = "New User";

		when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
		when(mockPreparedStatement.executeUpdate()).thenReturn(0);

		// Act
		int result = StudentsDAO.doUpdateNowRecord(originalUsername, newUserId, newPassword, newName);

		// Assert
		assertEquals(-1, result);
	}

	@Test
	void testDoUpdateNowRecord_Error() throws Exception {
		// Arrange
		String originalUsername = "testuser";
		String newUserId = "newuser";
		String newPassword = "newpassword";
		String newName = "New User";

		when(mockConnection.prepareStatement(anyString())).thenThrow(new SQLException("Database error"));

		// Act
		int result = StudentsDAO.doUpdateNowRecord(originalUsername, newUserId, newPassword, newName);

		// Assert
		assertEquals(2, result); // Error code for exception
	}
}