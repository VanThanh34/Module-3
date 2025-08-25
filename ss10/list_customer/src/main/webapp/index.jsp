<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>LIST CUSTOMER</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #f4f6f8;
      margin: 0;
      padding: 20px;
    }

    h1 {
      text-align: center;
      color: #333;
      margin-bottom: 20px;
    }

    table {
      width: 80%;
      margin: 0 auto;
      border-collapse: collapse;
      background: #fff;
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
      border-radius: 8px;
      overflow: hidden;
    }

    th, td {
      padding: 12px 15px;
      text-align: center;
      border-bottom: 1px solid #ddd;
    }

    th {
      background-color: #4CAF50;
      color: white;
      font-size: 16px;
    }

    tr:hover {
      background-color: #f1f1f1;
    }

    img {
      width: 100px;
      border-radius: 8px;
      transition: transform 0.3s ease;
    }

    img:hover {
      transform: scale(1.1);
    }
  </style>
</head>
<body>
<h1>Danh sách khách hàng</h1>
<table>
  <tr>
    <th>Tên</th>
    <th>Ngày Sinh</th>
    <th>Địa Chỉ</th>
    <th>Ảnh</th>
  </tr>
  <c:forEach var="c" items="${customers}">
    <tr>
      <td>${c.name}</td>
      <td>${c.dob}</td>
      <td>${c.address}</td>
      <td><img src="${c.image}" alt="Ảnh khách hàng"></td>
    </tr>
  </c:forEach>
</table>
</body>
</html>
