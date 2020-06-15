<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<%@ include file="../setting.jsp"%>
<link rel='stylesheet' type='text/css' href='${root}/css/userlist.css' />
<title>User Management</title>
<script>

	function pageMove(pg) {
		$('#pg').val(pg);
		document.getElementById("pageform").action = "${root}/user/userlist/" + pg;
		document.getElementById("pageform").submit();
	}

	function submit() {
		$('#key').val($('#keys option:selected').val());
		$('#word').val($('#words').val());
		document.getElementById("pageform").action = "${root}/user/userlist/1";
		document.getElementById("pageform").submit();
	}
	
	function del() {
		list = [];
		values = document.getElementsByName("dels");
		
		console.log(list);
		for(var i = 0; i < values.length; i++) {
			if(values[i].checked) {
				list.push(values[i].value);
				console.log(values[i].value);
			}
		}
		console.log(list);
		
		$('#confirm').show();
		$('#modaltext').text('정말 삭제하시겠습니까?');
		$('#modaltitle').text('Confirm');
		$('#myModal').modal('show');
		
		$('#confirm').click(function() {
			$('#confirm').hide();
			$.ajax({
				method:'GET',
				url:'${root}/user/delete/' + list,
				success: function(data) {
					$('#modaltext2').text('삭제가 완료되었습니다.');
					$('#modaltitle2').text('Success Delete');
					$('#myModal2').modal('show');
					$('#modalok2').click(function() {
						submit();
					})
				}
			});
		});
	}
</script>
</head>
<body>
	<%@ include file="../header.jsp"%>
	
	<form name="pageform" id="pageform" method="GET" action="">
		<input type="hidden" name="pg" id="pg" value="">
		<input type="hidden" name="key" id="key" value="">
		<input type="hidden" name="word" id="word" value="">
	</form>
	
	<form id="deleteform" method="GET" action="">
		<input type="hidden" name="del" id="del" value="">
	</form>
	
	<div style="text-align: center;">
		<div class="form-group md">
			<div id="searchform" style="margin-left: 43%;">
				<input type="hidden" id="pg" value="">
				<select class="form-control" name="key" id="keys" tabindex="5"
					style="width: 100px; float: left; margin-right: 10px;">
					<option value="all">ALL</option>
					<option value="id" 	 <c:if test="${key eq 'id'}">selected</c:if>>ID</option>
					<option value="name" <c:if test="${key eq 'name'}">selected</c:if>>NAME</option>
				</select>
				<input id="words" name="word" onkeydown="javascript:if(event.keyCode == 13) {submit();}" style="float: left;">
				<input type="button" onClick="submit();" value="검색" id="search" class="btn btn-default" style="float: left;"/>
				<input type="button" onClick="del();" value="삭제" id="delete" class="btn btn-default" style="float: left; margin-left: 5%"/>
			</div>
		</div>
	</div>
	<div id="listall">
		<table>
			<thead>
				<tr>
					<th>ID</th>
					<th>NAME</th>
					<th>TEL</th>
					<th>ADDRESS</th>
					<th>DELETE</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items="${ list }">
					<tr>
						<td><a href="${root}/user/userinfo/${user.getId()}"><strong>${user.getId()}</strong></a></td>
						<td>${user.getName()}</td>
						<td>${user.getAddress()}</td>
						<td>${user.getTel()}</td>
						<td><input type="checkbox" id='dels' name="dels" value="${user.getUserNo()}"></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="center-block" align="center">
		<table>
			<tr>
				<td>
					<!-- page 출력부분 -->
					${navigation.navigator}
				</td>
			</tr>
		</table>
	</div>
	
	<div id="myModal2" class="modal fade" role="dialog" style="display: none">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="modaltitle">Fail To LogIn</h4>
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