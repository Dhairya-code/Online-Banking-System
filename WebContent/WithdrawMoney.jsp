<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head><title>Withdraw Money</title></head>
<body>
<div style="max-width:400px;margin:50px auto;padding:20px;border:1px solid #ccc;">
<h2>Withdraw Money</h2>
<form action="processWithdraw.jsp" method="post">
<label>Account Number:</label>
<input type="text" name="accountNo" required style="width:100%;padding:8px;margin:5px 0;">
<label>Amount:</label>
<input type="number" name="amount" required style="width:100%;padding:8px;margin:5px 0;">
<button type="submit" style="width:100%;padding:10px;background:#28a745;color:white;border:none;cursor:pointer;">Withdraw</button>
</form>
</div>
</body>
</html>
