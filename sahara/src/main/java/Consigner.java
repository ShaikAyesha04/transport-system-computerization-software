import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/Consigner")
public class Consigner extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String state = request.getParameter("state");
        String city = request.getParameter("city");
        String pincode = request.getParameter("pincode");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");
        String altContact = request.getParameter("altContact");

        HttpSession session = request.getSession();
        // Store data in the session
        session.setAttribute("consignerName", name);
        session.setAttribute("consignerAddress", address);
        session.setAttribute("consignerState", state);
        session.setAttribute("consignerCity", city);
        session.setAttribute("consignerPincode", pincode);
        session.setAttribute("consignerMobile", mobile);
        session.setAttribute("consignerEmail", email);
        session.setAttribute("consignerAltContact",altContact);
        
        if (session.getAttribute("Consignerid") != null) {
            int consignerId = (int) session.getAttribute("Consignerid");
            System.out.println("Consigner ID: " + consignerId);
        } else {
            System.out.println("Consigner ID is not set in the session.");
        }

        Connection conn = null;
        PreparedStatement statement = null;
        try {
            // Establish database connection
            conn = JdbcUtil.getDBConnection();

            // Check if consigner data already exists
            if (session.getAttribute("Consignerid") != null) {
                // Update existing record
                int consignerId = (int) session.getAttribute("Consignerid");
                String updateSQL = "UPDATE consigner SET name=?, address=?, state=?, city=?, pincode=?, mobile=?, email=?, altContact=? WHERE id=?";
                statement = conn.prepareStatement(updateSQL);
                statement.setString(1, name);
                statement.setString(2, address);
                statement.setString(3, state);
                statement.setString(4, city);
                statement.setString(5, pincode);
                statement.setString(6, mobile);
                statement.setString(7, email);
                statement.setString(8, altContact);
                statement.setInt(9, consignerId);
                int rowsUpdated = statement.executeUpdate(); // Execute the update
                if (rowsUpdated > 0) {
                    System.out.println("Update successful. Rows affected: " + rowsUpdated);
                } else {
                    System.out.println("Update failed. No rows were affected.");
                }
            
                System.out.println("Enter into update portion");
            } else {
                // Insert new record
                String insertSQL = "INSERT INTO consigner (name, address, state, city, pincode, mobile, email, altContact) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                statement = conn.prepareStatement(insertSQL, PreparedStatement.RETURN_GENERATED_KEYS);
                statement.setString(1, name);
                statement.setString(2, address);
                statement.setString(3, state);
                statement.setString(4, city);
                statement.setString(5, pincode);
                statement.setString(6, mobile);
                statement.setString(7, email);
                statement.setString(8, altContact);
                System.out.println("Entered into Insert");
                int rowsInserted = statement.executeUpdate();
                if (rowsInserted > 0) {
                    var generatedKeys = statement.getGeneratedKeys();
                    if (generatedKeys.next()) {
                        int newConsignerId = generatedKeys.getInt(1);
                        session.setAttribute("Consignerid", newConsignerId); // Store consigner ID
                        System.out.println("Consigner ID (new): " + newConsignerId); // Print consignerId for new record

                    }
                }
               
            }

            response.sendRedirect("receiver.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("An error occurred while processing the form.");
        } finally {
            // Close resources
            try {
                JdbcUtil.closeResource(conn, statement);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
