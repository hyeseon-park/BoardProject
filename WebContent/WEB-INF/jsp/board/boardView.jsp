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
			<button onclick="location.href='check?num=${board.num}&type=modify'">수정</button>
			<button onclick="location.href='check?num=${board.num}&type=delete'">삭제</button>
			<button onclick="location.href='list'">목록</button>
			<button onclick="location.href='write'">새글쓰기</button>
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
		</div>
		
		<%-- 댓글 보기 --%>
		<div id="replies">
			<ul>
				<li>이름</li>
				<li>내용</li>
				<li>편집</li>
			</ul>
		</div>
		
		<%-- 댓글 입력 --%>
		<div id="replyWriteForm">
			<form id="replyForm">
				<div>
					<span>이름</span>
					<input type="text" name="name" id="r_name">
				</div>
				<div>
					<span>비밀번호</span>
					<input type="password" name="pass" id="r_password">
				</div>
				<div>
					<span>내용</span>
					<textarea rows="3" cols="30" name="content" id="r_content"></textarea>
				</div>
				<div>
					<input type="hidden" name="boardNum" value="${board.num}">
					<input type="submit" value="작성">
				</div>
			</form>
		</div>
				
		<%-- 모달 창 --%>
		<div id="replyModifyForm">
			<form id="replyFormModal">
				<div>
					<span>이름</span>
					<input type="text" name="name" id="modal-name">
				</div>
				<div>
					<span>비밀번호</span>
					<input type="password" name="pass" id="modal-password">
				</div>
				<div>
					<span>내용</span>
					<textarea rows="3" cols="30" name="content" id="modal-content"></textarea>
				</div>
				<div>
					<input type="hidden" name="id" id="modal-id">
					<input type="button" id="btnModify" value="수정">
					<input type="button" id="btnDelete" value="삭제">
					<input type="button" id="btnClose" value="닫기">
				</div>
			</form>
		</div>		
	</div>
</body>
</html>