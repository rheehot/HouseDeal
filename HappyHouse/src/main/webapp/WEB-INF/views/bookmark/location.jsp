<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<%@ include file="../setting.jsp"%>
<link rel='stylesheet' type='text/css' href='${root}/css/favorite.css' />
<title>Favorite Location</title>
<script>
	$(document).ready(function(){
		var selectTarget = $('.selectbox select');

		selectTarget.on('blur', function(){
			$(this).parent().removeClass('focus');
		});
		

		selectTarget.change(function(){
		    var select_name = $(this).children('option:selected').text();
		    $(this).siblings('label').text(select_name);
		    
		    $.ajax({
				method: 'GET',
				url: '${root}/favorite/gugun/' + $('#sidoSelect option:selected').val(),
				success: function(data) {
					var htmlTxt = '<label for="gugunSelect">구/군</label><select id="gugunSelect"><option selected>구/군</option>';
					$.each(data, function(index, value) {
						htmlTxt += '<option value="' + value.gugunCode + '">' + value.gugunName + '</option>';
					});
					htmlTxt += '</select>';
					$('#gugunDiv').html(htmlTxt);
					$('#gugunDiv').show();
					
					$('#gugunSelect').blur(function() {
						$(this).parent().removeClass('focus');
					});
					
					$('#gugunSelect').change(function() {
					    var select_name = $('#gugunSelect option:selected').text();
					    console.log(select_name);
					    
					    $('#gugunSelect').siblings('label').text(select_name);
					});
				}
			});
	    });
	});
	
	function modify() {
		$.ajax({
			method: 'PUT',
			url: '${root}/favorite',
			data: {
				code: $('#gugunSelect option:selected').val()
			},
			success: function(data) {
				$('#modaltext').text('관심지역 설정이 완료되었습니다.');
				$('#modaltitle').text('Success to Setting Favorite Region');
				$('#myModal').modal('show');
				$('#modalok').click(function() {
					location.href="${root}";
				});
			}
		});
	};
</script>
</head>
<body>
	<%@ include file="../header.jsp"%>
	
	<div class="container">
		<div class="login-box">
			<h2>Favorite Location</h2>
			<div class="selectbox">
				<label for="sidoSelect">시/도</label>
					<select id="sidoSelect">
					<option selected>시/도</option>
					<c:forEach var="sido" items="${ sidolist }">
						<option value="${sido.getSidoCode()}">${sido.getSidoName()}</option>
					</c:forEach>
				</select>
			</div>

			<div class="selectbox" id="gugunDiv" style="display: none; margin-top: 10%;">
			</div>
			<form id="loginform" method="post" action="">
				<a href="#" onclick="javascript:modify();"> <span></span> <span></span> <span></span> <span></span>
					Modify
				</a>
			</form>
		</div>
	</div>
	
	<%@ include file="../modal.jsp"%>
	<%@ include file="../footer.jsp"%>
</body>
</html>