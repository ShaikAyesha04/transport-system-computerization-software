<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consignment Details Form</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* Custom CSS */
        h2 {
            font-weight: bold;
        }
        .container {
            max-width: 600px;
            margin-top: 50px;
        }
        .card-header {
            font-size: 1.5em;
        }
        .form-control {
            font-size: 1em;
        }
    </style>
</head>
<body>
    <section class="container">
        <div class="card shadow">
            <div class="card-header bg-primary text-white text-center">
                <h2>Enter Consignment Details</h2>
            </div>
            <div class="card-body">
                <form method="post" action="Consignment">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="product">Product Details:</label>
                            <select class="form-control" id="product" name="product" required>
                                <option value="cement" <%= session.getAttribute("product") != null && session.getAttribute("product").equals("cement") ? "selected" : "" %>>Cement</option>
                                <option value="bricks" <%= session.getAttribute("product") != null && session.getAttribute("product").equals("bricks") ? "selected" : "" %>>Bricks</option>
                                <option value="stones" <%= session.getAttribute("product") != null && session.getAttribute("product").equals("stones") ? "selected" : "" %>>Stones</option>
                                <option value="sand" <%= session.getAttribute("product") != null && session.getAttribute("product").equals("sand") ? "selected" : "" %>>Sand</option>
                                <option value="paintings" <%= session.getAttribute("product") != null && session.getAttribute("product").equals("paintings") ? "selected" : "" %>>Paintings</option>
                                <option value="waterDrums" <%= session.getAttribute("product") != null && session.getAttribute("product").equals("waterDrums") ? "selected" : "" %>>Water Drums</option>
                                <option value="packages" <%= session.getAttribute("product") != null && session.getAttribute("product").equals("packages") ? "selected" : "" %>>Packages</option>
                                <option value="reinforcingBarks" <%= session.getAttribute("product") != null && session.getAttribute("product").equals("reinforcingBarks") ? "selected" : "" %>>Reinforcing Barks</option>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="quantity">Quantity:</label>
                            <input type="number" class="form-control" id="quantity" name="quantity" placeholder="Enter quantity" value="<%= session.getAttribute("quantity") != null ? session.getAttribute("quantity") : "" %>" required>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="weight">Actual Weight:</label>
                            <input type="number" class="form-control" id="weight" name="weight" placeholder="Enter weight" value="<%= session.getAttribute("weight") != null ? session.getAttribute("weight") : "" %>" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="weightType">Weight Type:</label>
                            <select class="form-control" id="weightType" name="weightType" required>
                                <option value="kg" <%= session.getAttribute("weightType") != null && session.getAttribute("weightType").equals("kg") ? "selected" : "" %>>Kilograms</option>
                                <option value="quintal" <%= session.getAttribute("weightType") != null && session.getAttribute("weightType").equals("quintal") ? "selected" : "" %>>Quintals</option>
                                <option value="tonne" <%= session.getAttribute("weightType") != null && session.getAttribute("weightType").equals("tonne") ? "selected" : "" %>>Tonnes</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="rateAsPer">Rate As Per:</label>
                            <select class="form-control" id="rateAsPer" name="rateAsPer" required>
                                <option value="weight" <%= session.getAttribute("rateAsPer") != null && session.getAttribute("rateAsPer").equals("weight") ? "selected" : "" %>>Weight</option>
                                <option value="quantity" <%= session.getAttribute("rateAsPer") != null && session.getAttribute("rateAsPer").equals("quantity") ? "selected" : "" %>>Quantity</option>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="rate">Rate:</label>
                            <input type="number" class="form-control" id="rate" name="rate" placeholder="Enter rate" value="<%= session.getAttribute("rate") != null ? session.getAttribute("rate") : "" %>" required>
                        </div>
                    </div>

                    <div class="form-row justify-content-center">
                        <button type="submit" class="btn btn-primary">Submit & Next</button>
                    </div>
                </form>
            </div>
        </div>
    </section>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
