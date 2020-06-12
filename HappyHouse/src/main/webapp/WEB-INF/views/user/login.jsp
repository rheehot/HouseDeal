<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<%@ include file="../setting.jsp"%>
<link rel='stylesheet' type='text/css' href='${root}/css/login.css' /> <!-- css/login.css -->
<title>Log In</title>
<script type="text/javascript">
	function login() {
		if (document.getElementById("userid").value == "") {
			$('#modaltext').text('아이디를 입력해 주세요.');
			$('#modaltitle').text('Fail To LogIn');
			$('#myModal').modal('show');
			return;
		} else if (document.getElementById("userpwd").value == "") {
			$('#modaltext').text('비밀번호를 입력해 주세요.');
			$('#modaltitle').text('Fail To LogIn');
			$('#myModal').modal('show');
			return;
		} else {
			document.getElementById("loginform").action = "${root}/user/login";
			document.getElementById("loginform").submit();
		}
	}
	function moveJoin() {
		document.location.href = "${ root }/user/joinpage";
	}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	
	<div class="container">
		<div class="login-box">
			<h2>LogIn</h2>
			<form id="loginform" method="post" action="">
				<input type="hidden" name="act" value="login">
				<div class="user-box">
					<input type="text" id="userid" name="id" required=""> <label>ID</label>
				</div>
				<div class="user-box">
					<input type="password" id="userpwd" name="password" required="" onkeydown="javascript:if(event.keyCode == 13) {login();}"> <label>Password</label>
				</div>
				<a href="#" onclick="javascript:login();"> <span></span> <span></span> <span></span> <span></span>
					LogIn
				</a>
				<a href="#" onclick="javascript:moveJoin();"> <span></span> <span></span> <span></span> <span></span>
					SignUp
				</a>
			</form>
		</div>
	</div>

	<%@ include file="../modal.jsp"%>
	<%@ include file="../footer.jsp"%>
</body>
</html>