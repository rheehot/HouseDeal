<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<%@ include file="../setting.jsp"%>
<link rel='stylesheet' type='text/css' href='${root}/css/join.css' />
<title>Modify</title>
<script>	
	function idcheck() {
		if('${user.id}' != $('#userid').val()) {
			alert('ID는 수정이 불가능합니다.');
			$('#userid').val('${user.id}');
			return;
		}
	}
	
	function update() {
		$.ajax({
			method: 'POST',
			url: '${root}/user/update',
			date : {
				id : $('#userid').val(),
				password : $('#userpwd').val(),
				name : $('#username').val(),
				tel : $('#usertel').val(),
				address : $('#useraddr').val(),
			}
		});
	}
</script>
</head>
<body>
	<%@ include file="../header.jsp"%>
	
	<div class="container" style="height: 400px;">
		<div class="login-box">
			<h2>Update</h2>
			<form id="loginform" method="post" action="">
				<div class="user-box">
					<input type="text" id="userid" name="id" value="${user.id}" onblur="javascript:idcheck();" required=""> <label>ID</label>
				</div>
				<div class="user-box">
					<input type="password" id="userpwd" name="password" required=""> <label>Password</label>
				</div>
				<div class="user-box">
					<input type="password" id="userpwdver" name="password" required=""> <label>Password Verification</label>
				</div>
				<div class="user-box">
					<input type="text" id="username" name="name" value="${user.name}" required=""> <label>Name</label>
				</div>
				<div class="user-box">
					<input type="text" id="usertel" name="tel" value="${user.tel}" required=""> <label>Tel</label>
				</div>
				<div class="user-box">
					<input type="text" id="useraddr" name="address" value="${user.address}" required=""> <label>Address</label>
				</div>
				<a href="#" onclick="javascript:update();"> <span></span> <span></span> <span></span> <span></span>
					Update
				</a>
			</form>
		</div>
	</div>
	
	<%@ include file="../footer.jsp"%>
</body>
</html>