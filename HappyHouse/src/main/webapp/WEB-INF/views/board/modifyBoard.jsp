<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<%@ include file="../setting.jsp"%>
<link rel='stylesheet' type='text/css' href='${root}/css/insertboard.css' />
<title>Modify Board</title>
<script>
$(document).ready(function() {
	$('#button-blue').click(function() {
		alert($('#content').text());
		$.ajax({
			type : 'PUT',
			url : '${root}/board/board',
			data : {
				id : $('#id').val(),
				title : $('#title').val(),
				content : $('#content').val()
			},
			success : function(data) {
				alert('수정완료');
				location.href = "${root}/board/board/${board.id}";
			},
			error : function(data) {
				alert('수정실패');
			}
		});
	});
})

</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>

	<div id="form-main">
		<div id="form-div">
			<form class="form" id="form" method="" action="">
				<input type="hidden" id="id" value="${board.id}">
				<p class="name">
					<input name="title" type="text" id="title"
						class="validate[required,custom[onlyLetter],length[0,100]] feedback-input"
						placeholder="제목" value="${board.title}"/>
				</p>

				<p class="text">
					<textarea name="content"
						class="validate[required,length[6,300]] feedback-input"
						id="content" placeholder="내용">${board.content}</textarea>
				</p>

				<div class="submit">
					<input type="button" value="등록" id="button-blue" onclick="submit();" />
					<div class="ease"></div>
				</div>
			</form>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/modal.jsp"%>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>