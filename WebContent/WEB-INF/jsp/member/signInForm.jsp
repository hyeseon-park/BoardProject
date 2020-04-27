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
</head>
<body>
	<div id="wrap">
		<div id="signInBox">
			<form action="signIn" method="post">
				<div class="box-upper">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					<h3>아이디</h3>
					<input type="text" name="mID">
					<h3>비밀번호</h3>
					<input type="password" name="mPass">
				</div>
				<div class="box-lower">
					<input type="submit" value="로그인">
					<input type="button" value="회원가입" onclick="location.href='signUp'"><br>
				</div>
			</form>
<%-- 			<c:if test='${param.login eq "false"}'> --%>
<!-- 				로그인을 안 했군요? 로그인 후에 이용하세요. -->
<%-- 			</c:if> --%>
<%-- 			<c:if test='${param.login eq "fail"}'> --%>
<!-- 				로그인에 실패했습니다. 아이디 또는 비밀번호를 확인해주세요. -->
<%-- 			</c:if> --%>
		</div>
	</div>
</body>
</html>