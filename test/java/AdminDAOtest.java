import com.admin.dao.*;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;
import com.admin.model.Admin;

class AdminDAORealDatabaseTest {

	@Test
	void testDoValidate_ValidCredentials() {
		// Arrange
		Admin admin = new Admin();
		admin.setUsername("admin");
		admin.setPassword("admin");

		// Act
		boolean result = AdminDAO.doValidate(admin);

		// Assert
		assertTrue(result, "The validation should succeed for valid credentials.");
	}

	@Test
	void testDoValidate_InvalidCredentials() {
		// Arrange
		Admin admin = new Admin();
		admin.setUsername("invalidUser");
		admin.setPassword("invalidPass");

		// Act
		boolean result = AdminDAO.doValidate(admin);

		// Assert
		assertFalse(result, "The validation should fail for invalid credentials.");
	}
}