<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardWrite</title>
</head>
<body>
	<div class="wrap">
		<form action="write" method="post" id="writeForm">
			<table>
				<tr>
					<th>제목</th>
					<td><input type="text" name="title"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pass"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea rows="10" cols="30" name="content"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="등록">
						<input type="reset" value="다시 작성">
						<input type="button" value="목록" onclick="location.href='list'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>