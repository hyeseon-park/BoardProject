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
					<div>
						<form action="${contextPath}/member/signOut" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							<input type="submit" value="로그아웃">
						</form>
					</div>
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
		<div id="listSearch">
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