<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bill Form</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
            margin-top: 20px;
        }
        .total-cost {
            font-size: 1.5rem; /* Adjusted size for better visibility */
            position: absolute; /* Positioned in the corner */
            top: 20px; /* Distance from the top */
            right: 20px; /* Distance from the right */
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <h2 class="text-center">Bill Details</h2>

        <div class="card">
            <div class="card-body">
                <!-- Display Total Cost -->
                <div class="total-cost">
                    <strong>Total Cost:</strong> $<%= request.getAttribute("totalCost") %>
                </div>

                <!-- Product Details Section -->
                <h4 class="card-title">Product Details</h4>
                <div class="row mb-3">
                    <div class="col-md-4">
                        <p><strong>Product:</strong> <%= request.getAttribute("product") %></p>
                    </div>
                    <div class="col-md-4">
                        <p><strong>Quantity:</strong> <%= request.getAttribute("quantity") %></p>
                    </div>
                    <div class="col-md-4">
                        <p><strong>Weight:</strong> <%= request.getParameter("weight") %> kg</p>
                    </div>
                </div>

                <!-- Consignee and Consigner Details Section -->
                <h4 class="card-title">Consignee and Consigner Details</h4>
                <div class="row mb-3">
                    <div class="col-md-6">
                        <p><strong>Consignee Name:</strong> <%= request.getAttribute("consigneeName") %></p>
                        <p><strong>Consignee Address:</strong> <%= request.getAttribute("consigneeAddress") %></p>
                    </div>
                    <div class="col-md-6">
                        <p><strong>Consigner Name:</strong> <%= request.getAttribute("consignerName") %></p>
                        <p><strong>Consigner Address:</strong> <%= request.getAttribute("consignerAddress") %></p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Form to accept the bill -->
        <div class="text-center mt-4">
            <form action="ConfirmBillServlet" method="post">
                <input type="hidden" name="product" value="<%= request.getAttribute("product") %>">
                <input type="hidden" name="quantity" value="<%= request.getAttribute("quantity") %>">
                <input type="hidden" name="totalCost" value="<%= request.getAttribute("totalCost") %>">
                <input type="hidden" name="consigneeName" value="<%= request.getAttribute("consigneeName") %>">
                <input type="hidden" name="consigneeAddress" value="<%= request.getAttribute("consigneeAddress") %>">
                <input type="hidden" name="consignerName" value="<%= request.getAttribute("consignerName") %>">
                <input type="hidden" name="consignerAddress" value="<%= request.getAttribute("consignerAddress") %>">
                <input type="hidden" name="weight" value="<%= request.getParameter("weight") %>">
                <button type="submit" class="btn btn-primary btn-lg">Accept Bill</button>
            </form>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
