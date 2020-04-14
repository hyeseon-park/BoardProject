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
	<div id="boardInner">
		<div id="list">
			<ul>
				<li>
					<div><a id="writeButton" href="write">글쓰기</a></div>
				</li>
				<li id="listHead">
					<div>번호</div>
					<div>제목</div>
					<div>작성자</div>
				</li>
				<c:forEach items="${boardList}" var="board">
					<li>
						<div>${board.num}</div>
						<div><a href="view?num=${board.num}">${board.title}</a></div>
						<div>${board.name}</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</body>
</html>