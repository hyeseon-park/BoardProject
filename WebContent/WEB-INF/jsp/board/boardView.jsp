<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardView</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/css/board.css"/>
<script src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"/></script>
<script type="text/javascript">

</script>
</head>
<body>
	<div id="boardInner">
		<div id="detail">
			<div class="row">
				<span>제목</span>
				<span class="bold">${board.title}</span>
			</div>
			<div class="row">
				<span>작성자</span>
				<span class="bold">${board.name}</span>
			</div>
			<div id="content">
				<span class="bold">${board.content}</span>
			</div>
			<button onclick="location.href='check?num=${board.num}&type=modify'">수정</button>
			<button onclick="location.href='check?num=${board.num}&type=delete'">삭제</button>
			<button onclick="location.href='list'">목록</button>
			<button onclick="location.href='write'">새글쓰기</button>
		</div>
		<%-- 댓글 보기 --%>
		<table id="replies" border="1">
			<tr>
				<th>이름</th>
				<th>내용</th>
				<th>편집</th>
			</tr>
		</table><br>
		<%-- 모달 창 --%>
		<div class="modal-modify" id="reply-modal">
			<form id="modal-form">
				<table class="modal-table">
					<tr>
						<th>이름</th>
						<td><input type="text" name="name" id="modal-name"></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="pass" id="modal-password"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea rows="3" cols="30" name="content" id="modal-content"></textarea></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="hidden" name="id" id="modal-id">
							<input type="button" id="btnModify" value="수정">
							<input type="button" id="btnDelete" value="삭제">
							<input type="button" id="btnClose" value="닫기">
						</td>
					</tr>
				</table>
			</form>
		</div>
		<%-- 댓글 입력 --%>
		<div class="reply-wrap">
			<form id="replyForm">
				<table id="replyTable">
					<tr>
						<th>이름</th>
						<td><input type="text" name="name" id="r_name"></td>
						<th>비밀번호</th>
						<td><input type="password" name="pass" id="r_password"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3"><textarea rows="3" cols="30" name="content" id="r_content"></textarea></td>
					</tr>
					<tr>
						<td align="center" colspan="4">
							<input type="hidden" name="boardNum" value="${board.num}">
							<input type="submit" value="작성">
						</td>
					</tr>
				</table>
			</form>
		</div>		
	</div>
</body>
</html>