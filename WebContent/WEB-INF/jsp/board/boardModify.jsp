<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardModify</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/css/board.css"/>
</head>
<body>
	<div class="board_inner">
		<form action="modify" method="post" id="modifyForm">
			<div class="modify_inner">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<input type="hidden" name="bNum" value="${board.bNum}">
				<input type="hidden" name="bPW" value="${board.bPW}">
				<div>
					<label>	
						<span>제목</span>
						<input type="text" name="bTitle" value="${board.bTitle}">
					</label>
				</div>
				<div>
					<label>
						<span>이름</span>
						<input type="text" name="bName" value="${board.bName}">
					</label>
				</div>
				<div>
					<label>
						<span>내용</span>
						<textarea rows="10" cols="54" name="bContent">${board.bContent}</textarea>
					</label>
				</div>
				<input type="submit" value="수정 완료">
			</div>
		</form>		
	</div>
</body>
</html>