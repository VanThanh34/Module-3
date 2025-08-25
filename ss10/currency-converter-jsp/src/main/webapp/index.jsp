<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Currency Converter</title>
</head>
<body>
<h2>Currency Converter</h2>
<form action="converter.jsp" method="post">
    <label for="rate">Rate: </label>
    <input type="number" id="rate" name="rate" placeholder="Rate" value="24500">
    <label for="usd">USD: </label>
    <input type="number" id="usd" name="usd" placeholder="USD" value="0">
    <button type="submit" id="submit">Converter</button>
</form>
</body>
</html>