

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
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/UpdateUser")
public class UpdateUser extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        // Check if new password and confirm password match
        if (!newPassword.equals(confirmPassword)) {
            response.getWriter().println("New password and confirm password do not match!");
            return;
        }

        Connection connection = null;
        PreparedStatement selectStmt = null;
        PreparedStatement updateStmt = null;
        ResultSet resultSet = null;

        try {
            connection = JdbcUtil.getDBConnection();
            // Check if the email exists in the database
            String selectSql = "SELECT * FROM users WHERE email = ?";
            selectStmt = connection.prepareStatement(selectSql);
            selectStmt.setString(1, email);
            resultSet = selectStmt.executeQuery();

            if (resultSet.next()) {
                // Hash the new password before storing it
                String hashedPassword = hashPassword(newPassword);

                // Update the password in the database
                String updateSql = "UPDATE users SET password = ? WHERE email = ?";
                updateStmt = connection.prepareStatement(updateSql);
                updateStmt.setString(1, hashedPassword);
                updateStmt.setString(2, email);

                int rowsUpdated = updateStmt.executeUpdate();
                if (rowsUpdated > 0) {
                    response.sendRedirect("LogU.html"); // Redirect on successful update
                } else {
                    response.sendRedirect("failure.jsp"); // Redirect if update fails
                }
            } else {
                response.getWriter().println("Email not found in the database.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Database error: " + e.getMessage());
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (selectStmt != null) selectStmt.close();
                if (updateStmt != null) updateStmt.close();
                if (connection != null) connection.close();
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
