<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: Arial, sans-serif;
        }
        .login-container {
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
        }
        .login-container h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
            font-weight: bold;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: 500;
        }
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            box-sizing: border-box;
        }
        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #667eea;
            outline: none;
            box-shadow: 0 0 5px rgba(102, 126, 234, 0.3);
        }
        button {
            width: 100%;
            padding: 12px;
            background-color: #667eea;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #764ba2;
        }
        .message {
            text-align: center;
            margin-top: 15px;
            font-weight: bold;
        }
        .error {
            color: #d9534f;
        }
        .success {
            color: #5cb85c;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Admin Login</h2>
        <form method="post" action="AdminPanel.jsp">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit" name="login" value="LOGIN">Login</button>
        </form>

        <% 
            String login = request.getParameter("login");
            if (login != null && login.equals("LOGIN")) {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                
                if (username != null && password != null && !username.trim().isEmpty() && !password.trim().isEmpty()) {
                    try {
                        Class.forName("oracle.jdbc.driver.OracleDriver");
                        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "123");
                        
                        String query = "SELECT * FROM admintable WHERE username = ? AND password = ?";
                        PreparedStatement pstmt = con.prepareStatement(query);
                        pstmt.setString(1, username);
                        pstmt.setString(2, password);
                        
                        ResultSet rs = pstmt.executeQuery();
                        
                        if (rs.next()) {
                            session.setAttribute("admin", username);
                            response.sendRedirect("AdminPanel.jsp");
                        } else {
                            %>
                            <div class="message error">Invalid username or password!</div>
                            <% 
                        }
                        
                        rs.close();
                        pstmt.close();
                        con.close();
                    } catch (Exception e) {
                        %>
                        <div class="message error">Error: <%= e.getMessage() %></div>
                        <% 
                    }
                }
            }
        %>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
