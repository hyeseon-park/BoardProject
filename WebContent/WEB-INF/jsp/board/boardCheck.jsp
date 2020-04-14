<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardCheck</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/css/board.css"/>
</head>
<body>
	<div id="boardInner">
		<form action="check" method="post">
			<div id="check">
				<div class="row">
					<span>비밀번호를 입력하세요.</span>
				</div>
				<div>
					<input type="password" name="password">
					<input type="hidden" name="num" value="${param.num}">
					<input type="hidden" name="type" value="${param.type}">
				</div>	
				<div id="buttons">
					<input type="submit" value="확인">
					<input type="button" value="취소" onclick="location.href='view?num=${param.num}'">
				</div>
			</div>
		</form>
	</div>
</body>
</html>