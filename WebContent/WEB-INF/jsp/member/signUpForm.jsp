<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signUpForm</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/css/member.css"/>
</head>
<body>
	<div id="wrap">
		<div id="signUpBox">
			<form action="signUp" method="post">
				<div class="box-upper">
					<h3>아이디</h3>
					<input type="text" name="mID">
					<h3>비밀번호</h3>
					<input type="password" name="mPass">
					<h3>닉네임</h3>
					<input type="text" name="mName">
				</div>
				<div class="box-lower">
					<input type="submit" value="회원가입">
				</div>
			</form>
		</div>
	</div>
</body>
</html>