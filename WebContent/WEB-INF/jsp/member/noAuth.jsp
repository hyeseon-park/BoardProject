<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noAuth</title>
</head>
<body>
<h3>권한이 없습니다.</h3>
<button onclick="location.href='${contextPath}/info'">정보보기</button>
<button onclick="history.go(-1)">돌아가기</button>
</body>
</html>