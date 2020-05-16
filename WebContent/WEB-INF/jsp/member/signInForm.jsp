<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signInForm</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/css/member.css"/>
<link rel="stylesheet" type="text/css" href="${contextPath}/css/reset.css"/>
</head>
<body>
	<div class="signin_box">
		<form action="signIn" method="post">
			<div class="box_upper">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<h3>아이디</h3>
				<input type="text" name="mID">
				<h3>비밀번호</h3>
				<input type="password" name="mPass">
			</div>
			<div class="signin_sentence">
				<c:if test='${param.signIn eq "false"}'>
					<span>권한이 없습니다.</span>
				</c:if>
				<c:if test='${param.signIn eq "fail"}'>
					<span>로그인에 실패했습니다.</span>
				</c:if>
			</div>
			<div class="box_lower">
				<input type="submit" value="로그인">
				<input type="button" value="가입" onclick="location.href='signUp'"><br>
			</div>
		</form>
		
	</div>
</body>
</html>