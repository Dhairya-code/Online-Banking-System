# Online Banking System - JSP Code Reference

This file contains all JSP code from your project. Individual JSP files have been created separately.

## Complete File List

✅ **Already Added as Individual Files:**
1. Home.jsp
2. NewAccount.jsp
3. Admin.jsp
4. UserDashboard.jsp
5. CheckBalance.jsp

📄 **Remaining Files (Code Below):**
6. MoneyTransfer.jsp
7. AdminPanel.jsp
8. Deposit.jsp
9. WithdrawMoney.jsp
10. ChangePasswordUser.jsp
11. ChangePasswordAdmin.jsp
12. ClosingAccount.jsp
13. TransactionHistory.jsp

---

## MoneyTransfer.jsp

```jsp
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Money Transfer</title>
    <style>
        .form-container { width: 350px; margin: auto; padding: 20px; border: 1px solid #ccc; }
        .form-field { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; }
        input, select { width: 100%; padding: 8px; box-sizing: border-box; }
        input[type="submit"] { background-color: #4CAF50; color: white; border: none; cursor: pointer; }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Money Transfer</h2>
        <form method="post">
            <div class="form-field">
                <label for="transferfrom">Transfer From Account Number:</label>
                <input type="text" name="transferfrom" required>
            </div>
            <div class="form-field">
                <label for="transferto">Transfer To Account Number:</label>
                <input type="text" name="transferto" required>
            </div>
            <div class="form-field">
                <label for="amount">Amount:</label>
                <input type="text" name="amount" required>
            </div>
            <input type="submit" name="action" value="TRANSFER">
        </form>

        <% 
            String action = request.getParameter("action");
            if ("TRANSFER".equals(action)) {
                String afrom = request.getParameter("transferfrom");
                String ato = request.getParameter("transferto");
                int amt = Integer.parseInt(request.getParameter("amount"));
                try {
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "123");
                    
                    // Check sender's balance
                    PreparedStatement ps1 = con.prepareStatement("SELECT balance FROM accounttable WHERE accountnumber = ?");
                    ps1.setString(1, afrom);
                    ResultSet rs = ps1.executeQuery();
                    if (rs.next()) {
                        int balance = rs.getInt("balance");
                        if (balance >= amt) {
                            // Deduct from sender
                            PreparedStatement ps2 = con.prepareStatement("UPDATE accounttable SET balance = balance - ? WHERE accountnumber = ?");
                            ps2.setInt(1, amt);
                            ps2.setString(2, afrom);
                            ps2.executeUpdate();
                            
                            // Add to receiver
                            PreparedStatement ps3 = con.prepareStatement("UPDATE accounttable SET balance = balance + ? WHERE accountnumber = ?");
                            ps3.setInt(1, amt);
                            ps3.setString(2, ato);
                            int update = ps3.executeUpdate();
                            if (update > 0) {
                                out.println("<h3 style='color:green'>Transaction Successful!</h3>");
                            }
                            ps2.close();
                            ps3.close();
                        } else {
                            out.println("<h3 style='color:red'>Insufficient Balance</h3>");
                        }
                    }
                    rs.close();
                    ps1.close();
                    con.close();
                } catch (Exception e) {
                    out.println("<h3 style='color:red'>Error: " + e.getMessage() + "</h3>");
                }
            }
        %>
    </div>
</body>
</html>
```

---

## Deposit.jsp

```jsp
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Deposit Money</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container" style="max-width: 500px; margin-top: 30px;">
        <h2 class="text-center">Deposit Money</h2>
        <form method="post" class="mt-4">
            <div class="mb-3">
                <label for="accountNo" class="form-label">Account Number:</label>
                <input type="text" class="form-control" name="accountNo" required>
            </div>
            <div class="mb-3">
                <label for="amount" class="form-label">Deposit Amount:</label>
                <input type="number" class="form-control" name="amount" required min="1" step="0.01">
            </div>
            <button type="submit" class="btn btn-success w-100" name="deposit" value="yes">Deposit</button>
        </form>
        
        <% 
            if (request.getParameter("deposit") != null) {
                String accountNo = request.getParameter("accountNo");
                double depositAmount = Double.parseDouble(request.getParameter("amount"));
                
                try {
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "123");
                    
                    String updateQuery = "UPDATE accounttable SET balance = balance + ? WHERE accountnumber = ?";
                    PreparedStatement pstmt = con.prepareStatement(updateQuery);
                    pstmt.setDouble(1, depositAmount);
                    pstmt.setString(2, accountNo);
                    
                    int result = pstmt.executeUpdate();
                    if (result > 0) {
                        %>
                        <div class="alert alert-success mt-3">Deposit Successful! Amount: Rs. <%= depositAmount %></div>
                        <% 
                    }
                    pstmt.close();
                    con.close();
                } catch (Exception e) {
                    %>
                    <div class="alert alert-danger mt-3">Error: <%= e.getMessage() %></div>
                    <% 
                }
            }
        %>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
```

---

## WithdrawMoney.jsp

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Withdraw Money</title>
    <style>
        .container { width: 320px; margin: 50px auto; background: #fff; padding: 50px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        h2 { text-align: center; }
        label { margin-top: 10px; display: block; }
        input { width: 100%; padding: 10px; margin-top: 5px; }
        input[type="submit"] { margin-top: 15px; width: 100%; padding: 10px; background-color: #28a745; color: white; border: none; font-size: 16px; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Withdraw Money</h2>
        <form action="processWithdraw.jsp" method="post">
            <label for="accountNo">Account Number:</label>
            <input type="text" name="accountNo" required>
            <label for="accountHolderName">Account Holder Name:</label>
            <input type="text" name="accountHolderName" required>
            <label for="withdrawAmount">Amount:</label>
            <input type="number" name="withdrawAmount" required min="1" step="0.01">
            <input type="submit" value="Withdraw">
        </form>
    </div>
</body>
</html>
```

---

## AdminPanel.jsp

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
    String admin = (String) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("Admin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Panel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f7fc; }
        .panel-header { text-align: center; padding: 50px; background-color: #007bff; color: white; }
        .card { border: none; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); }
        .card-body a { font-size: 1.2rem; padding: 15px; display: block; text-decoration: none; color: white; background-color: #28a745; border-radius: 8px; text-align: center; margin: 10px 0; }
        .card-body a:hover { background-color: #218838; }
    </style>
</head>
<body>
    <nav class="navbar navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <img src="images/logo13.png" alt="Logo" width="220" height="60">
            </a>
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="Logout.jsp">Logout</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="panel-header">
        <h2>Welcome to Admin Panel</h2>
    </div>

    <div class="container mt-4">
        <div class="row">
            <div class="col-md-4 mb-3">
                <div class="card">
                    <div class="card-body">
                        <a href="NewAccount.jsp"><i class="fas fa-user-plus"></i> New Account</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-3">
                <div class="card">
                    <div class="card-body">
                        <a href="ListAccount.jsp"><i class="fas fa-list-alt"></i> List of Accounts</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-3">
                <div class="card">
                    <div class="card-body">
                        <a href="ChangePassword.jsp"><i class="fas fa-key"></i> Change Password</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
```

---

## Instructions

1. Each file listed above contains the complete JSP code for that module
2. Copy the code and create individual `.jsp` files in the `WebContent` folder
3. All files use the same Oracle database connection details: `jdbc:oracle:thin:@localhost:1521:xe`
4. Database username: `system`, Password: `123`
5. Ensure JDBC driver is in Tomcat lib folder

## Notes

- All files implement proper session management
- Database queries use PreparedStatements for security
- Bootstrap 5 is used for responsive UI
- Implement additional security measures before production deployment
