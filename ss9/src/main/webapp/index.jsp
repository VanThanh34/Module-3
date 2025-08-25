<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>Product Discount Calculator</title>
</head>
<body>
<h2>Product Discount Calculator</h2>
<form action="discount" method="post">
  <p>
    <label for="description">Product Description:</label>
    <input type="text" id="description" name="description" required>
  </p>
  <p>
    <label for="price">List Price:</label>
    <input type="number" id="price" name="price" step="0.01" required>
  </p>
  <p>
    <label for="discountPercent">Discount Percent:</label>
    <input type="number" id="discountPercent" name="discountPercent" step="0.01" required>
  </p>
  <p>
    <button type="submit">Calculate Discount</button>
  </p>
</form>
</body>
</html>
