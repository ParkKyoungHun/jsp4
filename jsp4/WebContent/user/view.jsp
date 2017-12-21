<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>
<link rel="stylesheet" href="<%=rootPath%>/ui/sign.css"/>
<body>
<script>
function afterView(result){
	for(var key in result){
		$("#" + key).val(result[key]);
	}
}
$(document).ready(function(){
	var url = "join.user";
	var param = {};
	param["cmd"] = "view";
	param["userno"] = "<%=request.getParameter("userno")%>";
	$.ajax({
		type : "post",
		url : url,
		dataType: "json",
		data : param,
		success : afterView,
		error : function(xhr,status){
			alert("에러 : " + xhr.responseText);
		}
	});
})
</script>
<form class="form-signin">
		<h2 class="form-signin-heading">회원정보</h2>
		<label for="id" class="sr-only">ID</label> 
		<input type="text" id="userId" name="id" class="form-control" 
			placeholder="ID" required autofocus disabled>
		
		<label for="pwd" class="sr-only">Password</label>
		<input type="password" name="pwd" id="userPwd" class="form-control"
			placeholder="Password" required disabled>
			
		<label for="id" class="sr-only">이름</label> 
		<input type="text" id="userName" name="name" class="form-control" 
			placeholder="이름" required disabled> 
			
		<label for="id" class="sr-only">나이</label> 
		<input type="text" id="userAge" name="age" class="form-control" 
			placeholder="나이" required disabled>  
			
		<label for="id" class="sr-only">주소</label> 
		<input type="text" id="userAddress" name="address" class="form-control" 
			placeholder="주소" required disabled>
<%
if(user!=null && 
user.getUserNo().toString().equals(request.getParameter("userno"))){
%>
		<input type="text" id="checkPwd" name="checkPwd" class="form-control"><br>
		<input type="button" value="회원수정" id="btnCheck" class="form-control">
		<input type="button" value="회원수정" id="btnUpdate" class="form-control" style="display:none"> 
		<input type="button" onclick="deleteUser()" value="회원탈퇴" class="form-control">
<script>

function afterUpdate(result){
	alert(result.msg);
	if(result.result=="ok"){
		location.href = result.url;
	}
}
$("#btnUpdate").click(function(){
	if(confirm("진짜 업데이트 할꺼야?")){
		var url = "join.user";
		var params = {};
		params["userPwd"] = $("#userPwd").val();
		params["userName"] = $("#userName").val();
		params["userAge"] = $("#userAge").val();
		params["userAddress"] = $("#userAddress").val();
		var param = {};
		param["cmd"] = "update"
		param["params"] = JSON.stringify(params);
		$.ajax({
			type : "post",
			url : url,
			dataType: "json",
			data : param,
			success : afterUpdate,
			error : function(xhr,status){
				alert("에러 : " + xhr.responseText);
			}
		});
	}
})
function afterCheckPwd(result){
	if(result.result=="ok"){
		$("#userAddress").removeAttr("disabled");
		$("#userPwd").removeAttr("disabled");
		$("#userName").removeAttr("disabled");
		$("#userAge").removeAttr("disabled");
		$("#btnCheck").css("display","none");
		$("#btnUpdate").css("display","");
	}else{
		alert(result.msg);
	}
}
$("#btnCheck").click(function(){
	var url = "update.user";
	var param = {};
	param["cmd"] = "checkPwd";
	param["checkPwd"] = "" + $("#checkPwd").val();
	$.ajax({
		type : "post",
		url : url,
		dataType: "json",
		data : param,
		success : afterCheckPwd,
		error : function(xhr,status){
			alert("에러 : " + xhr.responseText);
		}
	});
})
function afterDelete(result){
	alert(result.msg);
	if(result.result=="ok"){
		location.href = result.url;
	}
}
function deleteUser(){
	var url = "delete.user";
	var param = {};
	param["cmd"] = "delete";
	param["checkPwd"] = $("#checkPwd").val();
	$.ajax({
		type : "post",
		url : url,
		dataType: "json",
		data : param,
		success : afterDelete,
		error : function(xhr,status){
			alert("에러 : " + xhr.responseText);
		}
	});
}
</script>
<%
}
%>
	</form>
</body>
</html>