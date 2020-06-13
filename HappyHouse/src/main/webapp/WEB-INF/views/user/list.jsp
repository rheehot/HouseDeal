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
	function goSearch(pg) {
		//alert(pg);
		//$('#pg').val(pg);
		
		$.ajax({
			method: 'POST',
			url: '${root}/user/search',
			data: {
				type : $('#type option:selected').val(),
				value : $('#searchvalue').val(),
				//currentPage : $('#pg').val()
			},
			success: function(data) {
				var htmlTxt = '<table><thead><tr><th>ID</th><th>NAME</th><th>TEL</th><th>ADDRESS</th><th>DELETE</th></tr></thead><tbody>';
				$.each(data, function(index, value) {
					htmlTxt += '<tr><td><a href="${root}/user/userinfo/' + value.id + '"><strong>' + value.id + '</strong></a></td>' +
					'<td>' + value.name + '</td>' + 
					'<td>' + value.address + '</td>' + 
					'<td>' + value.tel + '</td>' +
					'<td><input type="checkbox" name="del" value=""></td></tr>';
				});
				htmlTxt += '</tbody></table>';
				$('#searchdiv').html(htmlTxt);
				$('#listall').hide();
				$('#searchdiv').show();
			}
		});
	}
</script>
</head>
<body>
	<%@ include file="../header.jsp"%>
	
	<div style="text-align: center;">
		<div class="form-group md">
			<form id="searchform" method="" action="" style="margin-left: 43%;">
				<input type="hidden" id="pg" value="">
				<select class="form-control" name="type" id="type" tabindex="5"
					style="width: 100px; float: left; margin-right: 10px;">
					<option value="id">ID</option>
					<option value="name">NAME</option>
				</select>
				<input id="searchvalue" name="searchValue" style="float: left;">
				<input type="button" onClick="javascript:goSearch(1);" value="검색" id="search" class="btn btn-default" style="float: left;"/>
				<input type="button" onClick="" value="삭제" id="delete" class="btn btn-default" style="float: left; margin-left: 5%"/>
			</form>
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
						<td><input type="checkbox" name="del" value=""></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div id="searchdiv" style="display: none;"></div>
	<%@ include file="../footer.jsp"%>
</body>
</html>