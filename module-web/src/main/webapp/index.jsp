<%@ page import="service.SimpleService" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<html>
<body>
<h2>Hello World</h2>
</body>
<%SimpleService s1 = new SimpleService(); %>
<%= s1.getStrLine()%>

</html>
