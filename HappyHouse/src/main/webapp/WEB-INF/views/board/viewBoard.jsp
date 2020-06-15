<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<%@ include file="../setting.jsp"%>
<link rel='stylesheet' type='text/css' href='${root}/css/view.css'/>
<title>View Board</title>
<script type="text/javascript">
	function remove() {
		$.ajax({
			type : 'DELETE',
			url : '${root}/board/board/${board.id}',
			success : function(data) {
				location.href = "${root}/board/boards?pg=1&key=&word=";
			},
			error : function(data) {
				location.href = "${root}/board/boards?pg=1&key=&word=";
			}
		});
	}
	function submit() {
		$.ajax({
			type : 'PUT',
			url : '${root}/board/board',
			data : {
				id : Number($('#boardid').text()),
				title : $("#sub").val(),
				content : $("#con").val()
			},
			success : function(data) {
				console.log('수정완료');
				location.href = "${root}/board/board/" + Number($('#boardid').text());
			},
			error : function(data) {
				console.log('수정실패');
				location.href = "${root}/board/boards?pg=1&key=&word=";
			}
		});
	}
	function modify() {
		contents = $("#brdcontent").text();
		$('#id').val('${ board.id }');
		$('#title').val('${ board.title }');
		$('#content').val(contents);
		document.getElementById("form").action = '${root}/move/modifyboardpage';
		document.getElementById("form").submit();
	}
	function back() {
		location.href = "${root}/board/boards?pg=1&key=&word=";
	}
	function del() {
		$('#confirm').show();
		$('#modaltext').text('정말 삭제하시겠습니까?');
		$('#modaltitle').text('Confirm');
		$('#myModal').modal('show');

		$('#confirm').click(function() {
			$('#confirm').hide();
			remove();
		});
	}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>

	<form name="form" id="form" method="POST" action="">
		<input type="hidden" name="id" id="id" value="">
		<input type="hidden" name="title" id="title" value="">
		<input type="hidden" name="content" id="content" value="">
	</form>

	<div id="viewdiv">
		<h1>#${ board.id }&nbsp;&nbsp; ${ board.title }</h1><br>
		<h5>${ board.datetime }</h5><br>
		<p><div id="brdcontent">${ board.content }</div></p>
	</div>
	
	<div id="boardmodify">
	
	</div>

	<div class="container" style="position: absolute; top: 80%; left: 10%">
		<div class="starter-template">
			<div align="center">
				<div style="width: 70%">
					<c:if test="${userinfo.getId() == 'admin'}">
						<button type="button" class="btn btn-link" onclick="modify();">수정</button>
						<button type="button" id="btn-tog" class="btn btn-link" onClick="del();">삭제</button>
					</c:if>
					<button type="button" class="btn btn-link" onclick="back();">목록</button>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/modal.jsp"%>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>