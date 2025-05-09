import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;

import java.io.IOException;
import java.io.OutputStream;

@WebServlet("/DownloadReceipt")
public class DownloadReceipt extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve parameters from the request
        String product = request.getParameter("product");
        String quantity = request.getParameter("quantity");
        String totalCost = request.getParameter("totalCost");
        String consigneeName = request.getParameter("consigneeName");
        String consigneeAddress = request.getParameter("consigneeAddress");
        String consignerName = request.getParameter("consignerName");
        String consignerAddress = request.getParameter("consignerAddress");
        String weight = request.getParameter("weight");

        // Set response headers for file download
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=receipt.pdf");

        // Create PDF document
        try (OutputStream out = response.getOutputStream()) {
            PdfWriter writer = new PdfWriter(out);
            PdfDocument pdfDoc = new PdfDocument(writer);
            Document document = new Document(pdfDoc);

            // Add content to the PDF
            document.add(new Paragraph("Receipt").setBold().setFontSize(20));
            document.add(new Paragraph("-------------------------------------------------"));
            document.add(new Paragraph("Product: " + product));
            document.add(new Paragraph("Quantity: " + quantity));
            document.add(new Paragraph("Total Cost: $" + totalCost));
            document.add(new Paragraph("Consignee Name: " + consigneeName));
            document.add(new Paragraph("Consignee Address: " + consigneeAddress));
            document.add(new Paragraph("Consigner Name: " + consignerName));
            document.add(new Paragraph("Consigner Address: " + consignerAddress));
            document.add(new Paragraph("Weight: " + weight + " kg"));
            document.add(new Paragraph("-------------------------------------------------"));
            document.add(new Paragraph("Thank you for your order!"));

            document.close();
        }
    }
}
