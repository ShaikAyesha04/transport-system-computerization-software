

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


@WebServlet("/SaveEditedDetails")
public class SaveEditedDetails extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String consigneeName = request.getParameter("consigneeName");
        String consigneeAddress = request.getParameter("consigneeAddress");
        String consignerName = request.getParameter("consignerName");
        String consignerAddress = request.getParameter("consignerAddress");
        String product = request.getParameter("product");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double weight = Double.parseDouble(request.getParameter("weight"));

        // Database connection and insertion logic
        try (Connection conn = JdbcUtil.getDBConnection();
             PreparedStatement ps = conn.prepareStatement("INSERT INTO shipment_details (consignee_name, consignee_address, consigner_name, consigner_address, product, quantity, weight) VALUES (?, ?, ?, ?, ?, ?, ?)")) {
            
            ps.setString(1, consigneeName);
            ps.setString(2, consigneeAddress);
            ps.setString(3, consignerName);
            ps.setString(4, consignerAddress);
            ps.setString(5, product);
            ps.setInt(6, quantity);
            ps.setDouble(7, weight);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Set attributes to request
        request.setAttribute("consigneeName", consigneeName);
        request.setAttribute("consigneeAddress", consigneeAddress);
        request.setAttribute("consignerName", consignerName);
        request.setAttribute("consignerAddress", consignerAddress);
        request.setAttribute("product", product);
        request.setAttribute("quantity", quantity);
        request.setAttribute("weight", weight);

        // Forward to JSP page
        request.getRequestDispatcher("GenerateBillServlet").forward(request, response);
       
    }
}

