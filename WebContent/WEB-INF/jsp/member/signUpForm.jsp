<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signUpForm</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/css/member.css"/>
</head>
<body>
	<div class="signup_box">
		<form action="signUp" method="post">
			<div class="box_upper">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<h3>아이디</h3>
				<input type="text" name="mID">
				<h3>비밀번호</h3>
				<input type="password" name="mPW">
				<h3>닉네임</h3>
				<input type="text" name="mName">
			</div>
			<div class="box_lower">
				<input type="submit" value="회원가입">
			</div>
		</form>
	</div>
</body>
</html>