<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consignee Details Form</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Custom styles for form container */
        .form-container {
            max-width: 600px;
            margin: 3rem auto;
            padding: 2rem;
            background: #f9f9f9;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        h2 {
            font-size: 1.8rem;
            font-weight: bold;
            color: #333;
            margin-bottom: 1.5rem;
        }
        .form-control {
            border-radius: 5px;
        }
        .btn-custom {
            background-color: #007bff;
            border-color: #007bff;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }
        .btn-custom:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        .form-group label {
            font-weight: 600;
            color: #555;
        }
    </style>
</head>
<body>

<div class="container form-container">
    <h2 class="text-center">Enter Consignee Details</h2>
    <form method="post" action="Consignee">

        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="name">Consignee Name:</label>
                <input type="text" id="name" name="name" class="form-control"
                       placeholder="Enter consignee name" required
                       value="<%= session.getAttribute("consigneeName") != null ? session.getAttribute("consigneeName") : "" %>">
            </div>
            <div class="form-group col-md-6">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" class="form-control"
                       placeholder="Enter address" required
                       value="<%= session.getAttribute("consigneeAddress") != null ? session.getAttribute("consigneeAddress") : "" %>">
            </div>
        </div>

        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="state">State:</label>
                <select id="state" name="state" class="form-control" required>
                    <option value="">Select a state</option>
                    <%
                        String[] states = {
                            "Andhra Pradesh", "Arunachal Pradesh", "Assam", "Bihar", "Chhattisgarh", 
                            "Goa", "Gujarat", "Haryana", "Himachal Pradesh", "Jharkhand", 
                            "Karnataka", "Kerala", "Madhya Pradesh", "Maharashtra", "Manipur", 
                            "Meghalaya", "Mizoram", "Nagaland", "Odisha", "Punjab", 
                            "Rajasthan", "Sikkim", "Tamil Nadu", "Telangana", "Tripura", 
                            "Uttar Pradesh", "Uttarakhand", "West Bengal"
                        };
                        String selectedState = (String) session.getAttribute("consigneeState");
                        for (String state : states) {
                    %>
                        <option value="<%= state %>" <%= state.equals(selectedState) ? "selected" : "" %> >
                            <%= state %>
                        </option>
                    <%
                        }
                    %>
                </select>
            </div>
            <div class="form-group col-md-6">
                <label for="city">City:</label>
                <input type="text" id="city" name="city" class="form-control"
                       placeholder="Enter city" required
                       value="<%= session.getAttribute("consigneeCity") != null ? session.getAttribute("consigneeCity") : "" %>">
            </div>
        </div>

        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="pincode">Pincode:</label>
                <input type="text" id="pincode" name="pincode" class="form-control"
                       placeholder="Enter pincode" required
                       value="<%= session.getAttribute("consigneePincode") != null ? session.getAttribute("consigneePincode") : "" %>">
            </div>
            <div class="form-group col-md-6">
                <label for="mobile">Mobile Number:</label>
                <input type="text" id="mobile" name="mobile" class="form-control"
                       placeholder="Enter mobile number" required
                       value="<%= session.getAttribute("consigneeMobile") != null ? session.getAttribute("consigneeMobile") : "" %>">
            </div>
        </div>

        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" class="form-control"
                       placeholder="Enter email" required
                       value="<%= session.getAttribute("consigneeEmail") != null ? session.getAttribute("consigneeEmail") : "" %>">
            </div>
            <div class="form-group col-md-6">
                <label for="altcontact">Alternate Contact Number:</label>
                <input type="text" id="altcontact" name="altcontact" class="form-control"
                       placeholder="Enter alternate contact number" required
                       value="<%= session.getAttribute("consigneeAltContact") != null ? session.getAttribute("consigneeAltContact") : "" %>">
            </div>
        </div>

        <div class="form-group text-center">
            <button type="submit" class="btn btn-custom btn-lg">Submit & Next</button>
        </div>

    </form>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
