<%@page import="java.util.ArrayList"%>
<%@page import="com.test.jsp.dto.DepartInfo"%>
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
<div class="container">
	<br> 
	<form class="form-signin" action="/depart/list" method="get">
		<select name="searchOption">
			<option value="diName">부서이름</option>
			<option value="diEtc">부서설명</option>
		</select>
		<input type="text" id="diName" name="diName"><button>검색</button>
	</form>
	<br>
	<table id="table" data-height="460"
	class="table table-bordered table-hover">
		<thead>
			<tr> 
				<th class="text-center" data-field="userNo">부서번호</th>
				<th class="text-center" data-field="userId">부서이름</th>
				<th class="text-center" data-field="userAge">부서설명</th>
				<th class="text-center" data-field="btn">삭제</th>
			</tr>
		</thead>
		<tbody id="result_tbody">
		<%
ArrayList<DepartInfo> departList = (ArrayList<DepartInfo>)request.getAttribute("departList");

for(DepartInfo di : departList){
%>
<tr >
	<td onclick="goView(<%=di.getDiNo()%>)"><%=di.getDiNo()%></td>
	<td onclick="goView(<%=di.getDiNo()%>)"><%=di.getDiName()%></td>
	<td onclick="goView(<%=di.getDiNo()%>)"><%=di.getDiEtc()%></td>
	<td>
	<button type="button" onclick="deleteDi(<%=di.getDiNo()%>)">삭제</button>
	</td>
</tr>
<%
}
%>
		</tbody>
	</table>
	<button type="button" id="diInsertBtn">부서입력</button>
</div>
<c:if test="${insert == 1}">
	<script>
		alert("정상입력 되었습니다.");
		location.href="/depart/list";
	</script>
</c:if>

<c:if test="${msg!=null}">
	<script>
		alert("${msg}");
		location.href="/depart/list";
	</script>
</c:if>
<script>
	$("#diInsertBtn").click(function(){
		location.href="/depart/insert";
	})
	function goView(diNo){
		location.href="/depart/view?dino=" + diNo;
	}
	function deleteDi(diNo){
		location.href="/depart/delete?dino=" + diNo;
	}
</script>
</body>
</html>