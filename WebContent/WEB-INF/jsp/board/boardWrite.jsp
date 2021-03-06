<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardWrite</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/css/board.css"/>
</head>
<body>
	<div class="board_inner">
		<form action="write" method="post" id="writeForm" enctype="multipart/form-data">
			<div class="write_inner">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<div class="row">
					<label>
						<span>제목</span>
						<input type="text" name="bTitle">
					</label>
				</div>
				<div>
					<label>
						<span>이름</span>
						<input type="text" name="bName">
					</label>
				</div>
				<div>
					<label>
						<span>비밀번호</span>
						<input type="password" name="bPW">
					</label>
				</div>
				<div>
					<label>
						<span>첨부파일</span>
						<input type="file" name="file">
					</label>
				</div>
				<div>
					<label>
						<span>내용</span>
						<textarea rows="20" cols="80" name="bContent"></textarea>
					</label>
				</div>
				<input type="submit" value="등록">
				<input type="reset" value="다시 작성">
				<input type="button" value="목록" onclick="location.href='list'">
			</div>
		</form>
	</div>
</body>
</html>