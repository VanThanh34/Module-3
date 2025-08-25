<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: vvt13
  Date: 8/25/2025
  Time: 2:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Dictionary</title>
</head>
<body>
<%
    Map<String, String> dic = new HashMap<>();

    request.setCharacterEncoding("UTF-8");

    dic.put("hello", "Xin chào");
    dic.put("hi", "Xin chào");
    dic.put("hey", "Xin chào");
    dic.put("hungry", "Đói bụng");
    dic.put("thirsty", "Khát nước");

    String search = request.getParameter("search");
    String result = dic.get(search);

    if (search != null) {
%>
<p>Word: <strong><%= search %>
</strong></p>
<p>
    Result:
    <strong>
        <%= (result != null) ? result : "<span style='color:red;'>Not found!</span>" %>
    </strong>
</p>
<%
    }
%>

</body>
</html>
