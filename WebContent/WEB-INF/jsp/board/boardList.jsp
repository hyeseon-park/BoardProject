<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardList</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/css/board.css"/>
<link rel="stylesheet" type="text/css" href="${contextPath}/css/reset.css"/>
</head>
<body>
	<div class="board_inner">
		<div>
			<form action="${contextPath}/member/signOut" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<input type="submit" value="로그아웃">
			</form>
		</div>
		
		<div class="list_inner">
			<div class="board_write_btn" onclick="location.href='${contextPath}/board/write'">글쓰기</div>
			
			<c:forEach items="${boardList}" var="board">
				<div class="board_list_box" onclick="location.href='view?bNum=${board.bNum}'">
					<div>${board.bTitle}</div>
				</div>
			</c:forEach>
		</div>
		
		<div class="board_list_search">
			<form action="list">
				<select name="type">
					<option value="1">제목</option>
					<option value="2">내용</option>
					<option value="3">제목+내용</option>
					<option value="4">작성자</option>
				</select>
				<input type="text" name="keyword" placeholder="검색어를 입력하세요.">
				<input type="submit" value="검색">
			</form>
		</div>		
	</div>
</body>
</html>