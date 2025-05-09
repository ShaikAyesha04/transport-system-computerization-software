

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/GenerateBillServlet")
public class GenerateBillServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String product = request.getParameter("product");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String consigneeName = request.getParameter("consigneeName");
        String consigneeAddress = request.getParameter("consigneeAddress");
        String consignerName = request.getParameter("consignerName");
        String consignerAddress = request.getParameter("consignerAddress");
        double weight = Double.parseDouble(request.getParameter("weight"));

        // Define prices for products
        double pricePerUnit;
        switch (product.toLowerCase()) {
        case "cement":
            pricePerUnit = 5.0;
            break;
        case "bricks":
            pricePerUnit = 0.5;
            break;
        case "stones":
            pricePerUnit = 2.0;
            break;
        case "sand":
            pricePerUnit = 3.0; // Example price for sand
            break;
        case "paintings":
            pricePerUnit = 100.0; // Example price for paintings
            break;
        case "waterdrums":
            pricePerUnit = 15.0; // Example price for water drums
            break;
        case "packages":
            pricePerUnit = 20.0; // Example price for packages
            break;
        case "reinforcingbarks":
            pricePerUnit = 8.0; // Example price for reinforcing barks
            break;
        default:
            pricePerUnit = 0; // If no valid product is found
        }

        double totalCost = pricePerUnit * quantity;

        // Set attributes to pass to the JSP
        request.setAttribute("product", product);
        request.setAttribute("quantity", quantity);
        request.setAttribute("totalCost", totalCost);
        request.setAttribute("consigneeName", consigneeName);
        request.setAttribute("consigneeAddress", consigneeAddress);
        request.setAttribute("consignerName", consignerName);
        request.setAttribute("consignerAddress", consignerAddress);
        request.setAttribute("weight", weight);

        // Forward to JSP to display the bill
        request.getRequestDispatcher("billForm.jsp").forward(request, response);
    }
}
