<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../setting.jsp"%>
<link rel='stylesheet' type='text/css' href='${root}/css/login.css' /> <!-- css/login.css -->
<title>Log In</title>
<script type="text/javascript">
	function login() {
		if (document.getElementById("userid").value == "") {
			$('#modaltext').text('아이디를 입력해 주세요.');
			$('#myModal').modal('show');
			return;
		} else if (document.getElementById("userpwd").value == "") {
			$('#modaltext').text('비밀번호를 입력해 주세요.');
			$('#myModal').modal('show');
			return;
		} else {
			document.getElementById("loginform").action = "user/login";
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

	<div id="myModal" class="modal fade" role="dialog" style="display: none">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Fail To LogIn</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<p id="modaltext">Some text in the modal.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="../footer.jsp"%>
</body>
</html>