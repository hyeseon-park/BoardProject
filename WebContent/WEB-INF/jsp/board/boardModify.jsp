<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardModify</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/css/board.css"/>
</head>
<body>
	<div id="boardInner">
		<form action="modify" method="post" id="modifyForm">
			<div id="modify">
				<div class="row">
					<label>
						<span>번호</span>
						<input type="text" name="num" readonly="readonly" value="${board.num}">
					</label>
				</div>
				<div>
					<label>	
						<span>제목</span>
						<input type="text" name="title" value="${board.title}">
						<input type="hidden" name="pass" value="${board.pass}">
					</label>
				</div>
				<div>
					<label>
						<span>이름</span>
						<input type="text" name="name" value="${board.name}">
					</label>
				</div>
				<div>
					<label>
						<span>내용</span>
						<textarea rows="10" cols="54" name="content">${board.content}</textarea>
					</label>
				</div>
				<input type="submit" value="수정 완료">
			</div>
		</form>		
	</div>
</body>
</html>