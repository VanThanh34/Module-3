<%--
<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.Customer" %>
<%@ page import="java.util.List" %>&lt;%&ndash;
  Created by IntelliJ IDEA.
  User: vvt13
  Date: 8/25/2025
  Time: 4:18 PM
  To change this template use File | Settings | File Templates.
&ndash;%&gt;
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    List<Customer> customerList = new ArrayList<>();
    customerList.add(new Customer("Võ Văn Thành", "2002-04-13", "Quảng Trị", "images/po.jpg"));
    customerList.add(new Customer("Hồ Văn Tịnh", "2002-10-13", "Đà Nẵng 2", "images/download (1).jpg"));
    customerList.add(new Customer("Lê Văn Tâm", "2004-03-27", "Raumanian", "images/dautrau.jpg"));
    customerList.add(new Customer("Vũ Bão", "1999-08-17", "Quảng Trị", "images/download (2).jpg"));
    request.setAttribute("customers", customerList);
    request.getRequestDispatcher("index.jsp").forward(request, response);
%>
--%>
