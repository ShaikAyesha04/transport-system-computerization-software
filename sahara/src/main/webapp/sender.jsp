<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consigner Details Form</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <style>
        /* Custom CSS */
        .form-container {
            max-width: 700px;
            margin: 50px auto;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #007bff;
        }
        .form-group label {
            font-weight: bold;
        }
        .submit-row {
            text-align: center;
        }
        .submit-row input[type="submit"] {
            width: 100%;
            padding: 10px;
        }
    </style>
</head>
<body>

    <section class="form-container bg-light p-4">
        <h2>Enter Consigner Details</h2>
        <form method="post" action="Consigner">

            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="name">Consigner Name:</label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="Enter consigner name" 
                           value="<%= session.getAttribute("consignerName") != null ? session.getAttribute("consignerName") : "" %>" required>
                </div>
                <div class="form-group col-md-6">
                    <label for="address">Address:</label>
                    <input type="text" class="form-control" id="address" name="address" placeholder="Enter address" 
                           value="<%= session.getAttribute("consignerAddress") != null ? session.getAttribute("consignerAddress") : "" %>" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="state">State:</label>
                    <select class="form-control" id="state" name="state" required>
						<option value="">Select a state</option>
						  <option value="Andhra Pradesh" <%= "Andhra Pradesh".equals(session.getAttribute("consignerState")) ? "selected" : "" %>>Andhra Pradesh</option>
						  <option value="Arunachal Pradesh" <%= "Arunachal Pradesh".equals(session.getAttribute("consignerState")) ? "selected" : "" %>>Arunachal Pradesh</option>
						  <option value="Assam" <%= "Assam".equals(session.getAttribute("consignerState")) ? "selected" : "" %>>Assam</option>
						  <option value="Bihar" <%= "Bihar".equals(session.getAttribute("consignerState")) ? "selected" : "" %>>Bihar</option>
						  <option value="Chhattisgarh" <%= "Chhattisgarh".equals(session.getAttribute("consignerState")) ? "selected" : "" %>>Chhattisgarh</option>
						  <option value="Goa" <%= "Goa".equals(session.getAttribute("consignerState")) ? "selected" : "" %>>Goa</option>
						  <option value="Gujarat" <%= "Gujarat".equals(session.getAttribute("consignerState")) ? "selected" : "" %>>Gujarat</option>
						  <option value="Haryana" <%= "Haryana".equals(session.getAttribute("consignerState")) ? "selected" : "" %>>Haryana</option>
						  <option value="Himachal Pradesh" <%= "Himachal Pradesh".equals(session.getAttribute("consignerState")) ? "selected" : "" %>>Himachal Pradesh</option>
						  <option value="Jharkhand" <%= "Jharkhand".equals(session.getAttribute("consignerState")) ? "selected" : "" %>>Jharkhand</option>
						  <option value="Karnataka" <%= "Karnataka".equals(session.getAttribute("consignerState")) ? "selected" : "" %>>Karnataka</option>
						  <option value="Kerala" <%= "Kerala".equals(session.getAttribute("consignerState")) ? "selected" : "" %>>Kerala</option>
						  <option value="Madhya Pradesh" <%= "Madhya Pradesh".equals(session.getAttribute("consignerState")) ? "selected" : "" %>>Madhya Pradesh</option>
						  <option value="Maharashtra" <%= "Maharashtra".equals(session.getAttribute("consignerState")) ? "selected" : "" %>>Maharashtra</option>
						  <option value="Manipur" <%= "Manipur".equals(session.getAttribute("consignerState")) ? "selected" : "" %>>Manipur</option>
						  <option value="Meghalaya" <%= "Meghalaya".equals(session.getAttribute("consignerState")) ? "selected" : "" %>>Meghalaya</option>
						  <option value="Mizoram" <%= "Mizoram".equals(session.getAttribute("consignerState")) ? "selected" : "" %>>Mizoram</option>
						  <option value="Nagaland" <%= "Nagaland".equals(session.getAttribute("consignerState")) ? "selected" : "" %>>Nagaland</option>
						  <option value="Odisha" <%= "Odisha".equals(session.getAttribute("consignerState")) ? "selected" : "" %>>Odisha</option>
						  <option value="Punjab" <%= "Punjab".equals(session.getAttribute("consignerState")) ? "selected" : "" %>>Punjab</option>
						  <option value="Rajasthan" <%= "Rajasthan".equals(session.getAttribute("consignerState")) ? "selected" : "" %>>Rajasthan</option>
						  <option value="Sikkim" <%= "Sikkim".equals(session.getAttribute("consignerState")) ? "selected" : "" %>>Sikkim</option>
						  <option value="Tamil Nadu" <%= "Tamil Nadu".equals(session.getAttribute("consignerState")) ? "selected" : "" %>>Tamil Nadu</option>
						  <option value="Telangana" <%= "Telangana".equals(session.getAttribute("consignerState")) ? "selected" : "" %>>Telangana</option>
						  <option value="Tripura" <%= "Tripura".equals(session.getAttribute("consignerState")) ? "selected" : "" %>>Tripura</option>
						  <option value="Uttar Pradesh" <%= "Uttar Pradesh".equals(session.getAttribute("consignerState")) ? "selected" : "" %>>Uttar Pradesh</option>
						  <option value="Uttarakhand" <%= "Uttarakhand".equals(session.getAttribute("consignerState")) ? "selected" : "" %>>Uttarakhand</option>
						  <option value="West Bengal" <%= "West Bengal".equals(session.getAttribute("consignerState")) ? "selected" : "" %>>West Bengal</option>
                    </select>
                </div>
                <div class="form-group col-md-6">
                    <label for="city">City:</label>
                    <input type="text" class="form-control" id="city" name="city" placeholder="Enter city" 
                           value="<%= session.getAttribute("consignerCity") != null ? session.getAttribute("consignerCity") : "" %>" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="pincode">Pincode:</label>
                    <input type="text" class="form-control" id="pincode" name="pincode" placeholder="Enter pincode" 
                           value="<%= session.getAttribute("consignerPincode") != null ? session.getAttribute("consignerPincode") : "" %>" required>
                </div>
                <div class="form-group col-md-6">
                    <label for="mobile">Mobile Number:</label>
                    <input type="text" class="form-control" id="mobile" name="mobile" placeholder="Enter mobile number" 
                           value="<%= session.getAttribute("consignerMobile") != null ? session.getAttribute("consignerMobile") : "" %>" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="email">Email:</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="Enter email" 
                           value="<%= session.getAttribute("consignerEmail") != null ? session.getAttribute("consignerEmail") : "" %>" required>
                </div>
                <div class="form-group col-md-6">
                    <label for="altContact">Alternate Contact Number:</label>
                    <input type="text" class="form-control" id="altContact" name="altContact" placeholder="Enter alternate contact number" 
                           value="<%= session.getAttribute("consignerAltContact") != null ? session.getAttribute("consignerAltContact") : "" %>">
                </div>
            </div>

            <div class="submit-row">
                <input type="submit" class="btn btn-primary" value="Submit">
            </div>

        </form>
    </section>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
