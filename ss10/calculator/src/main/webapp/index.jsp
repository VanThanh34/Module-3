<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1>Simple Calculator</h1>
<p>Calculator</p>
<form action="calculate" method="get">
<label for="num1">First operand: </label>
<input type="number" id="num1" name="num1"><br><br>
<label for="cal">Operator: </label>
<select style="margin-left:50px" id="cal" name="cal">
    <option value="add">Addition</option>
    <option value="sub">Subtraction</option>
    <option value="mul">Multiplication</option>
    <option value="div">Division</option>
</select><br><br>
<label for="num2">First operand: </label>
<input type="number" id="num2" name="num2"><br><br>
<button type="submit">Calculate</button>
</form>
</body>
</html>