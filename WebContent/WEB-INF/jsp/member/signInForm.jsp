<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signInForm</title>
</head>
<body>
	<div>
		<form action="signIn" method="post">
			<label>아이디 : <input type="text" name="mID"></label><br>
			<label>비밀번호 : <input type="password" name="mPass"></label><br>
			<input type="submit" value="로그인">
			<input type="button" value="회원가입" onclick="location.href='signUp'"><br>
		</form>
		<h3><%= request.getAttribute("msg") %></h3>
	</div>
</body>
</html>