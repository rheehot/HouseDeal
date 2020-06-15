<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<%@ include file="../setting.jsp"%>
<link rel='stylesheet' type='text/css' href='${root}/css/insertboard.css' />
<title>Insert Board</title>
<script>
function submin(){
	$.ajax({
		type : 'POST',
		url : '${ root }/board/writeboard',
		data : {
			title : $("#title").val(),
			content : $("#content").val()
		},
		success : function(data) {
			$('#modaltext').text('공지사항이 등록되었습니다');
			$('#modaltitle').text('Success To Add Board');
			$('#myModal').modal('show');
			$('#modalok').click(function() {
				location.href = '${root}/board/boards?key=""&word=""&pg=1';
			})
		},
		error : function(data) {
			console.log('입력실패');
		}
	});
}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>

	<div id="form-main">
		<div id="form-div">
			<form class="form" id="form" method="post" action="">
				<p class="name">
					<input name="title" type="text" id="title"
						class="validate[required,custom[onlyLetter],length[0,100]] feedback-input"
						placeholder="제목" />
				</p>

				<p class="text">
					<textarea name="content"
						class="validate[required,length[6,300]] feedback-input"
						id="content" placeholder="내용"></textarea>
				</p>

				<div class="submit">
					<input type="button" value="등록" id="button-blue" onclick="submin();" />
					<div class="ease"></div>
				</div>
			</form>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/modal.jsp"%>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>