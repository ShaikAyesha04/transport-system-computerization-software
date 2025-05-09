package main.java;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/ConfirmBillServlet")
public class ConfirmBillServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve all parameters from the request
        String product = request.getParameter("product");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double totalCost = Double.parseDouble(request.getParameter("totalCost"));
        String consigneeName = request.getParameter("consigneeName");
        String consigneeAddress = request.getParameter("consigneeAddress");
        String consignerName = request.getParameter("consignerName");
        String consignerAddress = request.getParameter("consignerAddress");
        double weight = Double.parseDouble(request.getParameter("weight")); // Assuming weight can be a decimal

        // Database connection and insertion logic
        try (Connection conn = JdbcUtil.getDBConnection();
             PreparedStatement ps = conn.prepareStatement("INSERT INTO bill_details (product, quantity, total_cost, consignee_name, consignee_address, consigner_name, consigner_address, weight) VALUES (?, ?, ?, ?, ?, ?, ?, ?)")) {
            
            // Set parameters for the prepared statement
            ps.setString(1, product);
            ps.setInt(2, quantity);
            ps.setDouble(3, totalCost);
            ps.setString(4, consigneeName);
            ps.setString(5, consigneeAddress);
            ps.setString(6, consignerName);
            ps.setString(7, consignerAddress);
            ps.setDouble(8, weight);
            ps.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle exception (e.g., log error, show error message, etc.)
        }

        // Set attributes for the confirmation page
        request.setAttribute("product", product);
        request.setAttribute("quantity", quantity);
        request.setAttribute("totalCost", totalCost);
        request.setAttribute("consigneeName", consigneeName);
        request.setAttribute("consigneeAddress", consigneeAddress);
        request.setAttribute("consignerName", consignerName);
        request.setAttribute("consignerAddress", consignerAddress);
        request.setAttribute("weight", weight);

        // Forward to confirmation page
        request.getRequestDispatcher("confirmation.jsp").forward(request, response);
    }
}
