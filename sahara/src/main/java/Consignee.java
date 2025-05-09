import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/Consignee")
public class Consignee extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        // Retrieve form parameters
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String state = request.getParameter("state");
        String city = request.getParameter("city");
        String pincode = request.getParameter("pincode");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");
        String altcontact = request.getParameter("altcontact");
        
        
        // Create or retrieve the HttpSession
        HttpSession session = request.getSession();

        // Store data in the session with new naming conventions
        session.setAttribute("consigneeName", name);
        session.setAttribute("consigneeAddress", address);
        session.setAttribute("consigneeState", state);
        session.setAttribute("consigneeCity", city);
        session.setAttribute("consigneePincode", pincode);
        session.setAttribute("consigneeMobile", mobile);
        session.setAttribute("consigneeEmail", email);
        session.setAttribute("consigneeAltContact", altcontact);
        
        if (session.getAttribute("consigneeId") != null) {
            int consigneeId = (int) session.getAttribute("consigneeId");
            System.out.println("consignee ID: " + consigneeId);
        } else {
            System.out.println("consignee ID is not set in the session.");
        }

        Connection connection = null;
        PreparedStatement statement = null;

        try {
            // Get a connection using JdbcUtil
            connection = JdbcUtil.getDBConnection();

            if (session.getAttribute("consigneeId") != null) {
                // Update existing record if consigneeId exists in session
                int consigneeId = (int) session.getAttribute("consigneeId");
                String updateSQL = "UPDATE consignee SET name=?, address=?, state=?, city=?, pincode=?, mobile=?, email=?, altcontact=? WHERE id=?";
                statement = connection.prepareStatement(updateSQL);
                statement.setString(1, name);
                statement.setString(2, address);
                statement.setString(3, state);
                statement.setString(4, city);
                statement.setString(5, pincode);
                statement.setString(6, mobile);
                statement.setString(7, email);
                statement.setString(8, altcontact);
                statement.setInt(9, consigneeId);
                int rowsUpdated = statement.executeUpdate(); // Execute the update
                if (rowsUpdated > 0) {
                    System.out.println("Update successful. Rows affected: " + rowsUpdated);
                } else {
                    System.out.println("Update failed. No rows were affected.");
                }
                System.out.println("Entered into Updated Portion Consignee");

            } else {
                // Insert new record if consigneeId doesn't exist in session
                String insertSQL = "INSERT INTO consignee (name, address, state, city, pincode, mobile, email, altcontact) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                statement = connection.prepareStatement(insertSQL, PreparedStatement.RETURN_GENERATED_KEYS);
                statement.setString(1, name);
                statement.setString(2, address);
                statement.setString(3, state);
                statement.setString(4, city);
                statement.setString(5, pincode);
                statement.setString(6, mobile);
                statement.setString(7, email);
                statement.setString(8, altcontact);
//                int rowsUpdated = statement.executeUpdate(); // Execute the update
               

                int rowsInserted = statement.executeUpdate();
//                if (rowsInserted > 0) {
//                    System.out.println("Update successful. Rows affected: " + rowsInserted);
//                } else {
//                    System.out.println("Update failed. No rows were affected.");
//                }
            
                if (rowsInserted > 0) {
                    var generatedKeys = statement.getGeneratedKeys();
                    if (generatedKeys.next()) {
                        session.setAttribute("consigneeId", generatedKeys.getInt(1)); // Store consignee ID
                    }
                }
            }
            
            response.sendRedirect("Allfields.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: Unable to save consignee details.");
        } finally {
            // Close resources using JdbcUtil
            try {
                JdbcUtil.closeResource(connection, statement);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
