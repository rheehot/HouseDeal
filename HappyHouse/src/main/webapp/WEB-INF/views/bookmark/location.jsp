<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<%@ include file="../setting.jsp"%>
<link rel='stylesheet' type='text/css' href='${root}/css/join.css' />
<title>Favorite Location</title>
</head>
<body>
	<%@ include file="../header.jsp"%>
	
	
	<%@ include file="../modal.jsp"%>
	<%@ include file="../footer.jsp"%>
</body>
</html>