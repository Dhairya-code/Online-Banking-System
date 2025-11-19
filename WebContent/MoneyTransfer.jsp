<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Money Transfer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: #f0f0f0; padding: 30px; }
        .container { max-width: 500px; margin: 0 auto; background: white; padding: 25px; border-radius: 8px; box-shadow: 0 0 8px rgba(0,0,0,0.1); }
        h2 { text-align: center; margin-bottom: 20px; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 8px; font-weight: bold; }
        input { width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; }
        button { width: 100%; padding: 10px; background: #28a745; color: white; border: none; border-radius: 4px; cursor: pointer; }
        button:hover { background: #218838; }
        .message { margin-top: 15px; font-weight: bold; text-align: center; }
        .error { color: #d9534f; }
        .success { color: #28a745; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Money Transfer</h2>
        <form method="post">
            <div class="form-group">
                <label>From Account Number:</label>
                <input type="text" name="fromAccount" required>
            </div>
            <div class="form-group">
                <label>To Account Number:</label>
                <input type="text" name="toAccount" required>
            </div>
            <div class="form-group">
                <label>Amount:</label>
                <input type="number" name="amount" required min="1" step="0.01">
            </div>
            <button type="submit" name="transfer" value="yes">Transfer Money</button>
        </form>
        <% 
            if (request.getParameter("transfer") != null) {
                String fromAcc = request.getParameter("fromAccount");
                String toAcc = request.getParameter("toAccount");
                double amount = Double.parseDouble(request.getParameter("amount"));
                
                try {
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "123");
                    
                    PreparedStatement ps1 = con.prepareStatement("SELECT balance FROM accounttable WHERE accountnumber = ?");
                    ps1.setString(1, fromAcc);
                    ResultSet rs = ps1.executeQuery();
                    if (rs.next()) {
                        double balance = rs.getDouble("balance");
                        if (balance >= amount) {
                            PreparedStatement ps2 = con.prepareStatement("UPDATE accounttable SET balance = balance - ? WHERE accountnumber = ?");
                            ps2.setDouble(1, amount);
                            ps2.setString(2, fromAcc);
                            ps2.executeUpdate();
                            
                            PreparedStatement ps3 = con.prepareStatement("UPDATE accounttable SET balance = balance + ? WHERE accountnumber = ?");
                            ps3.setDouble(1, amount);
                            ps3.setString(2, toAcc);
                            ps3.executeUpdate();
                            %>
                            <div class="message success">Transfer Successful! Amount: Rs. <%= amount %></div>
                            <% 
                        } else {
                            %>
                            <div class="message error">Insufficient Balance!</div>
                            <% 
                        }
                    }
                    con.close();
                } catch (Exception e) {
                    %>
                    <div class="message error">Error: <%= e.getMessage() %></div>
                    <% 
                }
            }
        %>
    </div>
</body>
</html>
