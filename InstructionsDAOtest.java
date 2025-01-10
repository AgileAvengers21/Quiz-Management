import static org.junit.jupiter.api.Assertions.*;
import com.instructions.dao.*;

import org.junit.jupiter.api.Test;

import static org.mockito.Mockito.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.instructions.model.Instruction;
import com.provider.model.provider;

class InstructionDAOTest {

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
	void testInsertInstruction_Success() throws Exception {
		// Arrange
		Instruction instruction = new Instruction();
		instruction.setInstruction("Test Instruction");

		when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
		when(mockPreparedStatement.executeUpdate()).thenReturn(1);

		// Act
		boolean result = InstructionDAO.insertInstruction(instruction);

		// Assert
		assertTrue(result);
		verify(mockPreparedStatement).setString(1, "Test Instruction");
		verify(mockPreparedStatement).executeUpdate();
	}

	@Test
	void testInsertInstruction_Failure() throws Exception {
		// Arrange
		Instruction instruction = new Instruction();
		instruction.setInstruction("Test Instruction");

		when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
		when(mockPreparedStatement.executeUpdate()).thenReturn(0);

		// Act
		boolean result = InstructionDAO.insertInstruction(instruction);

		// Assert
		assertFalse(result);
	}

	@Test
	void testGetAllRecords() throws Exception {
		// Arrange
		when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
		when(mockPreparedStatement.executeQuery()).thenReturn(mockResultSet);
		when(mockResultSet.next()).thenReturn(true, false); // Simulate one record
		when(mockResultSet.getString(1)).thenReturn("Sample Instruction");

		// Act
		ArrayList<Instruction> result = InstructionDAO.getAllRecords();

		// Assert
		assertNotNull(result);
		assertEquals(1, result.size());
		assertEquals("Sample Instruction", result.get(0).getInstruction());
	}

	@Test
	void testDeleteRecord_Success() throws Exception {
		// Arrange
		Instruction instruction = new Instruction();
		instruction.setInstruction("Test Instruction");

		when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
		when(mockPreparedStatement.executeUpdate()).thenReturn(1);

		// Act
		int result = InstructionDAO.deleteRecord(instruction);

		// Assert
		assertEquals(1, result);
		verify(mockPreparedStatement).setString(1, "Test Instruction");
		verify(mockPreparedStatement).executeUpdate();
	}

	@Test
	void testDeleteRecord_Failure() throws Exception {
		// Arrange
		Instruction instruction = new Instruction();
		instruction.setInstruction("Test Instruction");

		when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
		when(mockPreparedStatement.executeUpdate()).thenReturn(0);

		// Act
		int result = InstructionDAO.deleteRecord(instruction);

		// Assert
		assertEquals(0, result);
	}

	@Test
	void testDoUpdateNowRecord_Success() throws Exception {
		// Arrange
		String original = "Old Instruction";
		String modified = "New Instruction";

		when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
		when(mockPreparedStatement.executeUpdate()).thenReturn(1);

		// Act
		int result = InstructionDAO.doUpdateNowRecord(original, modified);

		// Assert
		assertEquals(1, result);
		verify(mockPreparedStatement).setString(1, modified);
		verify(mockPreparedStatement).setString(2, original);
		verify(mockPreparedStatement).executeUpdate();
	}

	@Test
	void testDoUpdateNowRecord_Failure() throws Exception {
		// Arrange
		String original = "Old Instruction";
		String modified = "New Instruction";

		when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
		when(mockPreparedStatement.executeUpdate()).thenReturn(0);

		// Act
		int result = InstructionDAO.doUpdateNowRecord(original, modified);

		// Assert
		assertEquals(-1, result);
	}
}
