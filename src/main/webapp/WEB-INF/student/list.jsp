<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 22/08/2025
  Time: 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Danh sách học sinh</h1>
<%--Hiển thị danh sách sử dụng JSP thuần hoặc JSTL--%>
<button type="button" onclick="window.location.href='/students?action=create'">Thêm mới</button>
<table border="1" style="width: 500px">
  <tr>
    <td>STT</td>
    <td>Name</td>
    <td>DOB</td>
    <td>Point</td>
  </tr>
<%--  for (Student student: students)--%>
  <c:forEach items="${students}" var="student" varStatus="temp">
    <tr>
      <td>${temp.count}</td>
      <td>${student.name}</td>
      <td>${student.dob}</td>
      <c:if test="${student.point == null}">
        <td>
          Chưa có điểm
        </td>
      </c:if>
      <c:if test="${student.point != null}">
        <td>
            ${student.point}
        </td>
      </c:if>
    </tr>
  </c:forEach>
</table>
<p id="message">${message}</p>
</body>
<script>
  setTimeout(function () {
    document.getElementById("message").style.display="none";
  }, 3000)
</script>
</html>
