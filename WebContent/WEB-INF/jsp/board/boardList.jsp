<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardList</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/css/board.css"/>
</head>
<body>
	<div>
		<table id="boardListTable">
			<tr>
				<td colspan="6"><a href="write">글쓰기</a></td>
			</tr>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
			</tr>
			<c:forEach items="${boardList}" var="board">
				<tr>
					<td>${board.num}</td>
					<td><a href="view?num=${board.num}">${board.title}</a></td>
					<td>${board.name}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<br>
</body>
</html>