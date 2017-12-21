<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
application : ${ct_application }<br>

<c:forEach var="i" begin="1" end="10" step="1">
  <c:out value="${i}" />

  <br />
</c:forEach>
<%
  String[] names = { "A","B", "C", "D" };
request.setAttribute("names", names);
%>
<c:forEach var="name" items="${names}">
  <c:out value="${name}" />

  <br />
</c:forEach>
</body>
</html>