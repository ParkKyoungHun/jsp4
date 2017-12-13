<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
</head>
<script>
function afterLogin(re){
	var obj = JSON.parse(re);
	alert(obj.msg);
	if(obj.result=='ok'){
		location.reload();
	}
}
function login(){
	var url = 'list.user';
	var id = document.getElementById("id");
	var pwd = document.getElementById("pwd");
	var param = '?cmd=login&id=' + id.value + '&pwd=' + pwd.value;
	var au = new AjaxUtil(url,param);
	au.changeCallBack(afterLogin);
	au.send();
}
</script>
<link rel="stylesheet" href="<%=rootPath%>/ui/signin.css"/>
<%
if(user!=null){
out.println(user.getUserName() + "님 환영해요~~");
out.println(user.getUserAge() + "살 이시네요");
}else{
%>
<div class="container">
	<form class="form-signin" action="/login.user" method="post">
		<h2 class="form-signin-heading">Please login</h2>
		<label for="inputEmail" class="sr-only">ID</label> <input type="text"
			id="id" name="id" class="form-control" placeholder="ID" required
			autofocus> <label for="inputPassword" class="sr-only">Password</label>
		<input type="password" name="pwd" id="pwd" class="form-control"
			placeholder="Password" required>
		<div class="checkbox">
			<label> <input type="checkbox" value="remember-me">
				Remember me
			</label>
		</div>
		<input type="hidden" name="command" value="login"/>
		<input  class="btn btn-lg btn-primary btn-block"
			type="submit" value="Login">
	</form>
</div>
<%
}
%>
</body>
</html>