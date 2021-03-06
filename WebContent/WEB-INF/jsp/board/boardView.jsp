<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardView</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/css/board.css"/>
<script type="text/javascript">

$(function() {
	var fName = getOriginFileName('${board.fName}');
	$("#attachFile").text(fName);
	
	createReplyList();

	$("#replyForm").on("submit", function() {
		var d = $(this).serialize();
		$.ajax({
			url : "../reply/write",
			data : d, 
			type : "post",
			dataType : "json",
			success : function(data) {
				if(data) {
					$("#replyForm").reset();
					alert("등록 성공");
				} else {
					alert("등록 실패");
				}
				createReplyList();
			},
			error : function(request, status, error) {
				alert("request:"+request+" status:"+status+" error:"+error);
			}
		})
		return false;
	});	
	
	$("#btnClose").on("click", function() {
		$("#replyModifyForm").hide("slow");
	});	
	
	$("#btnModify").on("click", function() {
		var d = $("#replyFormModal").serialize();
		$.ajax({
			url : "../reply/modify",
			data : d,
			type : "post",
			dataType : "json",
			success : function(result) {
				if(result) {
					alert("수정 완료");
				} else {
					alert("수정 실패");
				}
				createReplyList();
				$("#replyModifyForm").hide("slow");
			},
			error: function(request, status, error) {
				alert("request:"+request+" status:"+status+" error:"+error);
			}
		});
	});
	
	$("#btnDelete").on("click", function() {
		var d = $("#replyFormModal").serialize();
		$.ajax({
			url : "../reply/delete",
			data : d,
			type : "post",
			dataType : "json",
			success: function(result) {
				if(result) {
					alert("삭제 완료");
				} else {
					alert("삭제 실패");
				}
				createReplyList();
			},
			error: function(request, status, error) {
				alert("request:"+request+" status:"+status+" error:"+error);
			}
		});
	});
	
})

function getOriginFileName(fName) {
	if(fName == null) {
		return;
	}
	var index = fName.indexOf("_");
	return fName.substring(index+1);
}

function createReplyList() {
	
	$("#replies div:gt(0)").remove();
	var repliesDiv = $("#replies");
	var bNum = ${board.bNum};
	
	$.ajax({
		url : "${contextPath}/reply/all/"+bNum,
		type : "get",
		dataType : "json",
		success : function(replyList) {
			for(var i in replyList) {
				var div = $("<div>");
				var button = $("<button>편집</button>");
				
				div.append($("<div>").text(replyList[i].rName));
				div.append($("<div>").text(replyList[i].rContent));
				div.append($("<div>").append(button));
				div.appendTo(repliesDiv);
				
				(function(j) {
					button.on("click", function() {
						$("#replyModifyForm").show("slow");
						$("#modal-rName").val(replyList[j].rName);
						$("#modal-rPass").val(replyList[j].rPass);
						$("#modal-rContent").val(replyList[j].rContent);
						$("#modal-rNum").val(replyList[j].rNum);
					});
				})(i)
			}
		},
		error: function(request, status, error) {
			alert("request:"+request+" status:"+status+" error:"+error);
		}
	});
}

</script>
</head>
<body>
	<div class="board_inner">
		<div class="view_inner">
			<button onclick="location.href='check?bNum=${board.bNum}&type=modify'">수정</button>
			<button onclick="location.href='check?bNum=${board.bNum}&type=delete'">삭제</button>
			<button onclick="location.href='list'">목록</button>
			<button onclick="location.href='write'">새글쓰기</button>
			
			<div>
				<span>제목</span>
				<span class="bold">${board.bTitle}</span>
			</div>
			<div>
				<span>작성자</span>
				<span class="bold">${board.bName}</span>
			</div>
			<div>
				<span>첨부파일</span>
				<a href="download?num=${board.bNum}" id="attachFile"></a>
			</div>
			<div class="content">
				<span class="bold">${board.bContent}</span>
			</div>
		</div>
		
		<%-- 댓글 보기 --%>
		<div id="replies">
		</div>
		
		<%-- 댓글 입력 --%>
		<div id="replyWriteForm">
			<form id="replyForm">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
				<div>
					<span>이름</span>
					<input type="text" name="rName" id="rName">
				</div>
				<div>
					<span>비밀번호</span>
					<input type="password" name="rPW" id="rPW">
				</div>
				<div>
					<span>내용</span>
					<textarea rows="3" cols="30" name="rContent" id="rContent"></textarea>
				</div>
				<div>
					<input type="hidden" name="bNum" value="${board.bNum}">
					<input type="submit" value="작성">
				</div>
			</form>
		</div>
				
		<%-- 모달 창 --%>
		<div id="replyModifyForm">
			<form id="replyFormModal">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<div>
					<span>이름</span>
					<input type="text" name="rName" id="modal_rName">
				</div>
				<div>
					<span>비밀번호</span>
					<input type="password" name="rPW" id="modal_rPW">
				</div>
				<div>
					<span>내용</span>
					<textarea rows="3" cols="30" name="rContent" id="modal_rContent"></textarea>
				</div>
				<div>
					<input type="hidden" name="rNum" id="modal_rNum">
					<input type="button" id="btnModify" value="수정">
					<input type="button" id="btnDelete" value="삭제">
					<input type="button" id="btnClose" value="닫기">
				</div>
			</form>
		</div>		
		
	</div>
</body>
</html>