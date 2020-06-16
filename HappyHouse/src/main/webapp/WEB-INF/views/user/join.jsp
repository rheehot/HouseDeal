<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<%@ include file="../setting.jsp"%>
<link rel='stylesheet' type='text/css' href='${root}/css/join.css' />
<title>Sign Up</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	$(document).ready(function(){
		$("#useraddr").click(function(){//daum address
		    new daum.Postcode({
		        oncomplete: function(data) {
	 	        	$("#useraddr").val(data.address);
		        }//oncomplete
		    }).open();
		});//click
	});//ready
</script>
<script>
	function signup() {
		if($.trim($('#userid').val()) == '') {
			$('#modaltext').text('아이디를 입력해 주세요.');
			$('#modaltitle').text('Fail To SignUp');
			$('#myModal').modal('show');
			//$('#userid').focus();
			return;
		} else if($('#userpwd').val() == '') {
			$('#modaltext').text('비밀번호를 입력해 주세요.');
			$('#modaltitle').text('Fail To SignUp');
			$('#myModal').modal('show');
			return;
		} else if($('#userpwdver').val() == '') {
			$('#modaltext').text('비밀번호를 입력해 주세요.');
			$('#modaltitle').text('Fail To SignUp');
			$('#myModal').modal('show');
			return;
		} else if($.trim($('#username').val()) == '') {
			$('#modaltext').text('이름을 입력해 주세요.');
			$('#modaltitle').text('Fail To SignUp');
			$('#myModal').modal('show');
			return;
		} else if($('#userpwd').val() != $('#userpwdver').val()) {
			$('#modaltext').text('동일한 비밀번호를 입력해 주세요.');
			$('#modaltitle').text('Fail To SignUp');
			$('#myModal').modal('show');
			return;
		}
		
		$.ajax({
			method : 'POST',
			url : '${root}/user/join',
			data: {
				id : $('#userid').val(),
				password : $('#userpwd').val(),
				name : $('#username').val(),
				tel : $('#usertel').val(),
				address : $('#useraddr').val(),
			},
			success : function(data) {
				if(data == 'success'){
					$('#modaltext2').text('회원가입이 완료되었습니다.');
					$('#modaltitle2').text('Success To SignUp');
					$('#myModal2').modal('show');
					$('#modalok2').click(function() {
						location.href = '${root}';
					});
				}else if(data == 'fail'){
					alert("이미 가입되어있는 아이디 입니다.");
				}else{
					alert('회원 가입 도중 에러가 발생했습니다.');
				}
			}
		})
	}
	
	$(document).ready(function() {
	})
</script>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="container" style="height: 400px;">
		<div class="login-box">
			<h2>Sign Up</h2>
			<form id="loginform" method="post" action="">
				<input type="hidden" name="act" value="login">
				<div class="user-box">
					<input type="text" id="userid" name="id" required=""> <label>ID</label>
				</div>
				<div class="user-box">
					<input type="password" id="userpwd" name="password" required=""> <label>Password</label>
				</div>
				<div class="user-box">
					<input type="password" id="userpwdver" name="password" required=""> <label>Password Verification</label>
				</div>
				<div class="user-box">
					<input type="text" id="username" name="name" required=""> <label>Name</label>
				</div>
				<div class="user-box">
					<input type="text" id="usertel" name="tel" required=""> <label>Tel</label>
				</div>
				<div class="user-box">
					<input type="text" id="useraddr" name="address" required=""> <label>Address</label>
				</div>
				<a href="#" onclick="javascript:signup();"> <span></span> <span></span> <span></span> <span></span>
					SignUp
				</a>
			</form>
		</div>
	</div>

	<div id="myModal2" class="modal fade" role="dialog"
		style="display: none">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="modaltitle2">Fail To LogIn</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<p id="modaltext2">Some text in the modal.</p>
				</div>
				<div class="modal-footer">
					<button type="button" id="modalok2" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../modal.jsp"%>
	<%@ include file="../footer.jsp"%>
</body>
</html>