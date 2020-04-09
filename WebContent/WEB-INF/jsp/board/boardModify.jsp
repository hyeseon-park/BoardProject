<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardModify</title>
</head>
<body>
	<div>
		<form action="modify" method="post">
			<table>
				<tr>
					<th>번호</th>
					<td><input type="text" name="num" readonly="readonly" value="${board.num}"></td>
					<th>제목</th>
					<td><input type="text" name="title" value="${board.title}"></td>
					<td><input type="hidden" name="pass" value="${board.pass}"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" value="${board.name}"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3"><textarea rows="10" cols="54" name="content">${board.content}</textarea></td>
				</tr>
			</table>
		<input type="submit" value="수정 완료">
		</form>		
	</div>
</body>
</html>