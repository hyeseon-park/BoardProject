<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardView</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/css/board.css"/>
</head>
<body>
	<div id="boardInner">
		<div id="detail">
			<div class="row">
				<span>제목</span>
				<span class="bold">${board.title}</span>
			</div>
			<div class="row">
				<span>작성자</span>
				<span class="bold">${board.name}</span>
			</div>
			<div id="content">
				<span class="bold">${board.content}</span>
			</div>
			<button onclick="location.href='check?num=${board.num}&type=modify'">수정</button>
			<button onclick="location.href='check?num=${board.num}&type=delete'">삭제</button>
			<button onclick="location.href='list'">목록</button>
			<button onclick="location.href='write'">새글쓰기</button>
		</div>
	</div>
</body>
</html>