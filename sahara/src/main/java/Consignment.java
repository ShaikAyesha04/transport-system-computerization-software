import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;


@WebServlet("/Consignment")
public class Consignment extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String product = request.getParameter("product");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double weight = Double.parseDouble(request.getParameter("weight"));
        String weightType = request.getParameter("weightType");
        String rateAsPer = request.getParameter("rateAsPer");
        double rate = Double.parseDouble(request.getParameter("rate"));

        HttpSession session = request.getSession();
        session.setAttribute("product", product);
        session.setAttribute("quantity", quantity);
        session.setAttribute("weight", weight);
        session.setAttribute("weightType", weightType);
        session.setAttribute("rateAsPer", rateAsPer);
        session.setAttribute("rate", rate);
        
        if (session.getAttribute("id") != null) {
            int consignerId = (int) session.getAttribute("id");
            System.out.println("Consigner ID: " + consignerId);
        } else {
            System.out.println("Consigner ID is not set in the session.");
        }

        Connection conn = null;
        PreparedStatement statement = null;
        try {
            conn = JdbcUtil.getDBConnection();

            // Check if the session contains existing consignment data
            if (session.getAttribute("id") != null) {
                // Update the existing record
                int consignmentId = (int) session.getAttribute("id");
                String updateSQL = "UPDATE consignments SET product=?, quantity=?, weight=?, weightType=?, rateAsPer=?, rate=? WHERE id=?";
                statement = conn.prepareStatement(updateSQL);
                statement.setString(1, product);
                statement.setInt(2, quantity);
                statement.setDouble(3, weight);
                statement.setString(4, weightType);
                statement.setString(5, rateAsPer);
                statement.setDouble(6, rate);
                statement.setInt(7, consignmentId);
                int rowsUpdated = statement.executeUpdate(); // Execute the update
                if (rowsUpdated > 0) {
                    System.out.println("Update successful. Rows affected: " + rowsUpdated);
                } else {
                    System.out.println("Update failed. No rows were affected.");
                }
                System.out.println("Enter into update portion");
            } else {
                // Insert new record
                String insertSQL = "INSERT INTO consignments (product, quantity, weight, weightType, rateAsPer, rate) VALUES (?, ?, ?, ?, ?, ?)";
                statement = conn.prepareStatement(insertSQL, PreparedStatement.RETURN_GENERATED_KEYS);
                statement.setString(1, product);
                statement.setInt(2, quantity);
                statement.setDouble(3, weight);
                statement.setString(4, weightType);
                statement.setString(5, rateAsPer);
                statement.setDouble(6, rate);

                int rowsInserted = statement.executeUpdate();
                if (rowsInserted > 0) {
                	 var generatedKeys = statement.getGeneratedKeys();
                     if (generatedKeys.next()) {
                         int newConsignerId = generatedKeys.getInt(1);
                         session.setAttribute("id", newConsignerId); // Store consigner ID
                         System.out.println("Consigner ID (new): " + newConsignerId); // Print consignerId for new record
                         				
                     }
                }
            }
            					
            response.sendRedirect("sender.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("An error occurred while processing the form.");
        } finally {
            try {
                JdbcUtil.closeResource(conn, statement);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
