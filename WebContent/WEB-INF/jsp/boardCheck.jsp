<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardCheck</title>
</head>
<body>
<div>
	<form action="check" method="post">
		<table>
			<tr>
				<th colspan="2"><h2>비밀번호를 입력하세요.</h2></th>
			</tr>
			<tr>
				<td>
					<input type="password" name="password">
					<input type="hidden" name="num" value="${param.num}">
					<input type="hidden" name="type" value="${param.type}">
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="확인">
					<input type="button" value="취소" onclick="location.href='view?num=${param.num}'">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>