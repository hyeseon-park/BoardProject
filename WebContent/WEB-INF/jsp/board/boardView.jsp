<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardView</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/css/board.css"/>
</head>
<body>
	<div class="detail-wrap">
		<table id="detailTable">
			<tr>
				<th>제목</th>
				<td>${board.title}</td>
				<th>이름</th>
				<td>${board.name}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3">${board.content}</td>
			</tr>
			<tr>
				<td colspan="4">
					<button onclick="location.href='check?num=${board.num}&type=modify'">수정</button>
					<button onclick="location.href='check?num=${board.num}&type=delete'">삭제</button>
					<button onclick="location.href='list'">목록</button>
					<button onclick="location.href='write'">새글쓰기</button>
				</td>
			</tr>
		</table>
	</div><br>
</body>
</html>