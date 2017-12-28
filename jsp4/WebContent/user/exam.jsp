<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>
<body>
<div id="result_div"></div>
<script>
var userList = [{"uiName" : "red","uiAge":30},{"uiName" : "blue","uiAge":20}]

for(var user of userList){
	document.write("이름 : " + user.uiName + ", 나이 : " + user.uiAge);
	document.write("<br>");
}
</script>
</body>
</html>