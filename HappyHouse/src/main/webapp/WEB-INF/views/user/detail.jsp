<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<%@ include file="../setting.jsp"%>
<link rel='stylesheet' type='text/css' href='${root}/css/userlist.css' />
<title>User Detail</title>
</head>
<body>
	<%@ include file="../header.jsp"%>
	
	<table>
		<thead>
			<tr>
				<th>ID</th>
				<th>NAME</th>
				<th>TEL</th>
				<th>ADDRESS</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${ user.getId() }</td>
				<td>${ user.getName() }</td>
				<td>${ user.getAddress() }</td>
				<td>${ user.getTel() }</td>
				<td><a href="delete?id=${ user.getId() }">삭제</a></td>
			</tr>
		</tbody>
	</table>

	<%@ include file="../footer.jsp"%>
</body>
</html>