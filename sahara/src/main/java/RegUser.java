

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/RegUser1")
public class RegUser extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fullName = request.getParameter("firstname");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm-password"); // Updated to match HTML name

        // Check if passwords match
        if (!password.equals(confirmPassword)) {
            response.getWriter().println("Passwords do not match!");
            return;
        }

        // Hash the password before storing (SHA-256 example)
        String hashedPassword = hashPassword(password);

        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = JdbcUtil.getDBConnection();
            String sql = "INSERT INTO users (full_name, email, mobile, password) VALUES (?, ?, ?, ?)";
            statement = connection.prepareStatement(sql);
            statement.setString(1, fullName);  // Set first parameter
            statement.setString(2, email);      // Set second parameter
            statement.setString(3, mobile);     // Set third parameter
            statement.setString(4, hashedPassword); // Set fourth parameter

            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
//                response.sendRedirect("success.jsp");
                // Redirect on success
                response.getWriter().println("User Successfully Singed Up");
            }else {
            	response.sendRedirect("Failure.jsp"); 
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Database error: " + e.getMessage());
        } finally {
            // Close resources
            try {
                JdbcUtil.closeResource(connection, statement);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(password.getBytes());
            StringBuilder hexString = new StringBuilder();
            for (byte b : hash) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    
	}

}
