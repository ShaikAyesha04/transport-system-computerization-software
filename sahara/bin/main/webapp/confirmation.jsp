<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bill Confirmation</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Roboto', sans-serif;
        }
        .card {
            margin-top: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s;
        }
        .card:hover {
            transform: translateY(-5px);
        }
        .card-header {
            border-radius: 10px 10px 0 0;
        }
        .btn-primary, .btn-secondary {
            transition: background-color 0.3s, transform 0.2s;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }
        .btn-secondary:hover {
            background-color: #5a6268;
            transform: scale(1.05);
        }
        h4.card-title {
            border-bottom: 2px solid #28a745;
            padding-bottom: 10px;
            color: #343a40;
        }
        .text-muted {
            color: #6c757d;
        }
        .flex-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }
        .flex-item {
            flex: 1 1 45%; /* Responsive layout */
            margin: 10px;
            padding: 10px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <div class="card shadow-lg">
            <div class="card-header bg-success text-white text-center">
                <h2>Bill Confirmed</h2>
            </div>
            <div class="card-body flex-container">
                <div class="flex-item">
                    <h4 class="card-title">Product Details</h4>
                    <p class="lead"><strong>Product:</strong> <span class="text-muted"><%= request.getAttribute("product") %></span></p>
                    <p class="lead"><strong>Quantity:</strong> <span class="text-muted"><%= request.getAttribute("quantity") %></span></p>
                    <p class="lead"><strong>Total Cost:</strong> <span class="text-muted">$<%= request.getAttribute("totalCost") %></span></p>
                </div>
                <div class="flex-item">
                    <h4 class="card-title">Weight</h4>
                    <p class="lead"><strong>Weight:</strong> <span class="text-muted"><%= request.getAttribute("weight") %> kg</span></p>
                </div>
                <div class="flex-item">
                    <h4 class="card-title">Consignee Details</h4>
                    <p class="lead"><strong>Name:</strong> <span class="text-muted"><%= request.getAttribute("consigneeName") %></span></p>
                    <p class="lead"><strong>Address:</strong> <span class="text-muted"><%= request.getAttribute("consigneeAddress") %></span></p>
                </div>
                <div class="flex-item">
                    <h4 class="card-title">Consigner Details</h4>
                    <p class="lead"><strong>Name:</strong> <span class="text-muted"><%= request.getAttribute("consignerName") %></span></p>
                    <p class="lead"><strong>Address:</strong> <span class="text-muted"><%= request.getAttribute("consignerAddress") %></span></p>
                </div>
                <div class="text-center mt-4 col-12">
                    <p>Thank you for your order!</p>
                    <a href="website.jsp" class="btn btn-primary">Back to Home</a>
                    <a href="DownloadReceipt?product=<%= request.getAttribute("product") %>&quantity=<%= request.getAttribute("quantity") %>&totalCost=<%= request.getAttribute("totalCost") %>&consigneeName=<%= request.getAttribute("consigneeName") %>&consigneeAddress=<%= request.getAttribute("consigneeAddress") %>&consignerName=<%= request.getAttribute("consignerName") %>&consignerAddress=<%= request.getAttribute("consignerAddress") %>&weight=<%= request.getAttribute("weight") %>" class="btn btn-secondary">Download Receipt</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
