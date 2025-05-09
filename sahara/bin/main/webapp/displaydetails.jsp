<%@ page import="java.sql.*" %>
<%@ page import="com.sahara.util.JdbcUtil" %>
<%@ page import="java.sql.Connection, java.sql.Statement, java.sql.ResultSet, java.sql.SQLException" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Shipment Details</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h2 class="mt-4">Saved Shipment Details</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Consignee Name</th>
                    <th>Consignee Address</th>
                    <th>Consigner Name</th>
                    <th>Consigner Address</th>
                    <th>Product</th>
                    <th>Quantity</th>
                    <th>Weight</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try (Connection conn = JdbcUtil.getDBConnection();
                         Statement stmt = conn.createStatement();
                         ResultSet rs = stmt.executeQuery("SELECT * FROM shipment_details")) {
                        
                        while (rs.next()) {
                %>
                            <tr>
                                <td><%= rs.getString("consignee_name") %></td>
                                <td><%= rs.getString("consignee_address") %></td>
                                <td><%= rs.getString("consigner_name") %></td>
                                <td><%= rs.getString("consigner_address") %></td>
                                <td><%= rs.getString("product") %></td>
                                <td><%= rs.getInt("quantity") %></td>
                                <td><%= rs.getDouble("weight") %></td>
                                <td>
                                    <form action="DeleteDetailServlet" method="post">
                                        <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                                        <button type="submit" class="btn btn-danger">Delete</button>
                                    </form>
                                </td>
                            </tr>
                <%
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
