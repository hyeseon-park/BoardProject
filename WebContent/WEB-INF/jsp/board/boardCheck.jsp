<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardCheck</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/css/board.css"/>
</head>
<body>
	<div class="board_inner">
		<form action="check" method="post">
			<div class="check_inner">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<div class="row">
					<span>비밀번호를 입력하세요.</span>
				</div>
				<div>
					<input type="password" name="password">
					<input type="hidden" name="bNum" value="${param.bNum}">
					<input type="hidden" name="type" value="${param.type}">
				</div>	
				<div id="buttons">
					<input type="submit" value="확인">
					<input type="button" value="취소" onclick="location.href='view?bNum=${param.bNum}'">
				</div>
			</div>
		</form>
	</div>
</body>
</html>