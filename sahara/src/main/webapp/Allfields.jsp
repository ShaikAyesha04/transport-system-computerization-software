<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.lang.Integer" %>
<%@ page import="java.lang.Double" %>
<%
    HttpSession httpSession = request.getSession();

    // Retrieve session attributes for consignee
    String consigneeName = (String) httpSession.getAttribute("consigneeName");
    String consigneeAddress = (String) httpSession.getAttribute("consigneeAddress");
    String consigneeState = (String) httpSession.getAttribute("consigneeState");
    String consigneeCity = (String) httpSession.getAttribute("consigneeCity");
    String consigneePincode = (String) httpSession.getAttribute("consigneePincode");
    String consigneeMobile = (String) httpSession.getAttribute("consigneeMobile");
    String consigneeEmail = (String) httpSession.getAttribute("consigneeEmail");
    String consigneeAltContact = (String) httpSession.getAttribute("consigneeAltContact");

    // Retrieve session attributes for consigner
    String consignerName = (String) httpSession.getAttribute("consignerName");
    String consignerAddress = (String) httpSession.getAttribute("consignerAddress");
    String consignerState = (String) httpSession.getAttribute("consignerState");
    String consignerCity = (String) httpSession.getAttribute("consignerCity");
    String consignerPincode = (String) httpSession.getAttribute("consignerPincode");
    String consignerMobile = (String) httpSession.getAttribute("consignerMobile");
    String consignerEmail = (String) httpSession.getAttribute("consignerEmail");
    String consignerAltContact = (String) httpSession.getAttribute("consignerAltContact");

    // Retrieve product details
    String product = (String) httpSession.getAttribute("product");
    Integer quantity = (Integer) httpSession.getAttribute("quantity"); 
    Double weight = (Double) httpSession.getAttribute("weight");
    String weightType = (String) httpSession.getAttribute("weightType");
    String rateAsPer = (String) httpSession.getAttribute("rateAsPer");
    Double rate = (Double) httpSession.getAttribute("rate");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Consignee and Consigner Details</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f5f8fa;
            font-family: Arial, sans-serif;
        }
        .form-container {
            background: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 30px;
        }
        .form-title {
            font-weight: 600;
            font-size: 1.5rem;
            color: #007bff;
            margin-bottom: 20px;
        }
        .form-label {
            font-weight: 500;
        }
        .form-control {
            border: none;
            box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.1);
            padding: 10px;
            border-radius: 4px;
        }
        .row-container {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }
        .col-field {
            flex: 1 1 48%;
        }
        .btn-custom {
            background-color: #007bff;
            color: white;
            width: 100%;
        }
        .btn-custom:hover {
            background-color: #0056b3;
        }
        .save-button {
            width: 100%;
            font-size: 1.2rem;
            margin-top: 20px;
        }
    </style>
    <script>
        function toggleEditFields(formClass) {
            let inputs = document.querySelectorAll(`.${formClass} input`);
            inputs.forEach(input => {
                input.readOnly = !input.readOnly;
            });
        }

        function redirectTo(page) {
            window.location.href = page;
        }
    </script>
</head>
<body>
    <div class="container">
        <!-- Consolidated Form Container -->
        <div class="form-container">
            <h2 class="form-title">Edit Details</h2>
            <form action="SaveEditedDetails" method="post">
                <!-- Consignee Form -->
                <h3 class="form-title">Consignee Details</h3>
                <div class="row-container">
                    <div class="form-group col-field">
                        <label class="form-label">Name:</label>
                        <input type="text" name="consigneeName" class="form-control" value="<%= consigneeName %>" required readonly>
                    </div>
                    <div class="form-group col-field">
                        <label class="form-label">Address:</label>
                        <input type="text" name="consigneeAddress" class="form-control" value="<%= consigneeAddress %>" required readonly>
                    </div>
                    <div class="form-group col-field">
                        <label class="form-label">State:</label>
                        <input type="text" name="consigneeState" class="form-control" value="<%= consigneeState %>" required readonly>
                    </div>
                    <div class="form-group col-field">
                        <label class="form-label">City:</label>
                        <input type="text" name="consigneeCity" class="form-control" value="<%= consigneeCity %>" required readonly>
                    </div>
                    <div class="form-group col-field">
                        <label class="form-label">Pincode:</label>
                        <input type="text" name="consigneePincode" class="form-control" value="<%= consigneePincode %>" required readonly>
                    </div>
                    <div class="form-group col-field">
                        <label class="form-label">Mobile:</label>
                        <input type="text" name="consigneeMobile" class="form-control" value="<%= consigneeMobile %>" required readonly>
                    </div>
                    <div class="form-group col-field">
                        <label class="form-label">Email:</label>
                        <input type="email" name="consigneeEmail" class="form-control" value="<%= consigneeEmail %>" required readonly>
                    </div>
                    <div class="form-group col-field">
                        <label class="form-label">Alternate Contact:</label>
                        <input type="text" name="altcontact" class="form-control" value="<%= consigneeAltContact %>" readonly>
                    </div>
                </div>

                <!-- Consigner Form -->
                <h3 class="form-title">Consigner Details</h3>
                <div class="row-container">
                    <div class="form-group col-field">
                        <label class="form-label">Name:</label>
                        <input type="text" name="consignerName" class="form-control" value="<%= consignerName %>" required readonly>
                    </div>
                    <div class="form-group col-field">
                        <label class="form-label">Address:</label>
                        <input type="text" name="consignerAddress" class="form-control" value="<%= consignerAddress %>" required readonly>
                    </div>
                    <div class="form-group col-field">
                        <label class="form-label">State:</label>
                        <input type="text" name="consignerState" class="form-control" value="<%= consignerState %>" required readonly>
                    </div>
                    <div class="form-group col-field">
                        <label class="form-label">City:</label>
                        <input type="text" name="consignerCity" class="form-control" value="<%= consignerCity %>" required readonly>
                    </div>
                    <div class="form-group col-field">
                        <label class="form-label">Pincode:</label>
                        <input type="text" name="consignerPincode" class="form-control" value="<%= consignerPincode %>" required readonly>
                    </div>
                    <div class="form-group col-field">
                        <label class="form-label">Mobile:</label>
                        <input type="text" name="consignerMobile" class="form-control" value="<%= consignerMobile %>" required readonly>
                    </div>
                    <div class="form-group col-field">
                        <label class="form-label">Email:</label>
                        <input type="email" name="consignerEmail" class="form-control" value="<%= consignerEmail %>" required readonly>
                    </div>
                    <div class="form-group col-field">
                        <label class="form-label">Alternate Contact:</label>
                        <input type="text" name="altContact" class="form-control" value="<%= consignerAltContact %>" readonly>
                    </div>
                </div>

                <!-- Product Details Form -->
                <h3 class="form-title">Product Details</h3>
                <div class="row-container">
                    <div class="form-group col-field">
                        <label class="form-label">Product:</label>
                        <input type="text" name="product" class="form-control" value="<%= product %>" required readonly>
                    </div>
                    <div class="form-group col-field">
                        <label class="form-label">Quantity:</label>
                        <input type="number" name="quantity" class="form-control" value="<%= quantity %>" required readonly>
                    </div>
                    <div class="form-group col-field">
                        <label class="form-label">Weight:</label>
                        <input type="number" name="weight" class="form-control" value="<%= weight %>" required readonly>
                    </div>
                    <div class="form-group col-field">
                        <label class="form-label">Weight Type:</label>
                        <input type="text" name="weightType" class="form-control" value="<%= weightType %>" readonly>
                    </div>
                    <div class="form-group col-field">
                        <label class="form-label">Rate As Per:</label>
                        <input type="text" name="rateAsPer" class="form-control" value="<%= rateAsPer %>" required readonly>
                    </div>
                    <div class="form-group col-field">
                        <label class="form-label">Rate:</label>
                        <input type="number" name="rate" class="form-control" value="<%= rate %>" required readonly>
                    </div>
                </div>

                <!-- Edit Buttons -->
				<div class="form-group">
				    <button type="button" class="btn btn-primary" onclick="window.location.href='receiver.jsp'">Edit Consignee</button>
				    <button type="button" class="btn btn-primary" onclick="window.location.href='sender.jsp'">Edit Consigner</button>
				    <button type="button" class="btn btn-primary" onclick="window.location.href='condetails.jsp'">Edit Product</button>
				</div>


                <!-- Save Button -->
                <button type="submit" class="btn btn-custom save-button">Save Changes</button>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
