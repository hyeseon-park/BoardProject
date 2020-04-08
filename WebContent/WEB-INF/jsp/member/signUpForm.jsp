<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signUpForm</title>
</head>
<body>
	<div>
		<form action="signUp" method="post">
			<label>아이디 : <input type="text" name="mID"></label><br>
			<label>비밀번호 : <input type="password" name="mPass"></label><br>
			<label>닉네임 : <input type="text" name="mName"></label><br>
			<input type="submit" value="회원가입"><br>
		</form>
	</div>
</body>
</html>