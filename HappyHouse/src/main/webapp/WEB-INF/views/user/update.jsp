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
	function idcheck() {
		if('${user.id}' != $('#userid').val()) {
			alert('ID는 수정이 불가능합니다.');
			$('#userid').val('${user.id}');
			return;
		}
	}
	
	function update() {
		if($.trim($('#userid').val()) == '') {
			$('#modaltext').text('아이디를 입력해 주세요.');
			$('#modaltitle').text('Fail To Update');
			$('#myModal').modal('show');
			//$('#userid').focus();
			return;
		} else if($('#userpwd').val() == '') {
			$('#modaltext').text('비밀번호를 입력해 주세요.');
			$('#modaltitle').text('Fail To Update');
			$('#myModal').modal('show');
			return;
		} else if($('#userpwdver').val() == '') {
			$('#modaltext').text('비밀번호를 입력해 주세요.');
			$('#modaltitle').text('Fail To Update');
			$('#myModal').modal('show');
			return;
		} else if($.trim($('#username').val()) == '') {
			$('#modaltext').text('이름을 입력해 주세요.');
			$('#myModal').modal('show');
			return;
		} else if($('#userpwd').val() != $('#userpwdver').val()) {
			$('#modaltext').text('동일한 비밀번호를 입력해 주세요.');
			$('#modaltitle').text('Fail To SignUp');
			$('#myModal').modal('show');
			return;
		}
		
		$.ajax({
			method: 'POST',
			url: '${root}/user/update',
			data : {
				id : $('#userid').val(),
				password : $('#userpwd').val(),
				name : $('#username').val(),
				tel : $('#usertel').val(),
				address : $('#useraddr').val()
			},
			success: function(data) {
				$('#modaltext').text('수정이 완료되었습니다.');
				$('#modaltitle').text('Success To SignUp');
				$('#myModal').modal('show');
				$('#modalok').click(function() {
					location.href = '${root}';
				});
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
	
	<%@ include file="../modal.jsp"%>
	<%@ include file="../footer.jsp"%>
</body>
</html>