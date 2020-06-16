<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<%@ include file="../setting.jsp"%>
<link rel='stylesheet' type='text/css' href='${root}/css/userlist.css' />
<title>Shop List</title>
<script>
	function pageMove(pg) {
		$('#pg').val(pg);
		document.getElementById("pageform").action = "${root}/shop/list";
		document.getElementById("pageform").submit();
	}
	function submit(){
		$('#pg').val(1);
		$('#key').val($('#keys').val());
		$('#word').val($('#words').val());
		document.getElementById("pageform").action = "${root}/shop/list";
		document.getElementById("pageform").submit();
	}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	<div class="container" style="min-height: 580px;">
		<form name="pageform" id="pageform" method="GET" action="">
			<input type="hidden" name="pg" id="pg" value="">
			<input type="hidden" name="key" id="key" value="">
			<input type="hidden" name="word" id="word" value="">
		</form>

		<div class="username_div">
			<div style="text-align: center;">
				<div class="form-group md">
					<div id="searchform" style="margin-left: 53%;">
						<input type="hidden" id="pg" value="">
						<select class="form-control" name="key" id="keys" tabindex="5" style="width: 100px; float: left; margin-right: 10px;">
							<option value="all">모두</option>
							<option value="gu" 		<c:if test="${key eq 'gu'}">selected</c:if>>구</option>
							<option value="dong" 	<c:if test="${key eq 'dong'}">selected</c:if>>동</option>
							<option value="name" 	<c:if test="${key eq 'name'}">selected</c:if>>상호명</option>
							<option value="mainName"<c:if test="${key eq 'mainName'}">selected</c:if>>대분류</option>
							<option value="midName" <c:if test="${key eq 'midName'}">selected</c:if>>중분류</option>
							<option value="subName" <c:if test="${key eq 'subName'}">selected</c:if>>소분류</option>
						</select>
						<input id="words" name="search" value="${word}" onkeydown="javascript:if(event.keyCode == 13) {submit();}" style="float: left;">
						<input type="button" onClick="submit();" value="검색" id="search" class="btn btn-default" style="float: left;"/>
					</div>
				</div>
			</div>

			<br>
			<div id="listall">
				<table>
					<thead>
						<tr>
							<th>구</th>
							<th>동</th>
							<th>상호명</th>
							<th>대분류</th>
							<th>중분류</th>
							<th>소분류</th>
							<th>도로명주소</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="shop" items="${ shops }">
							<tr>
								<td><strong>${ shop.gu }</strong></td>
								<td>${ shop.dong }</td>
								<td>${ shop.name }</td>
								<td>${ shop.mainName }</td>
								<td>${ shop.midName }</td>
								<td>${ shop.subName }</td>
								<td>${ shop.streetAddress }</td>
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
		</div>
	</div>
	
	<%@ include file="/WEB-INF/views/modal.jsp"%>
	<%@ include file="/WEB-INF/views/footer.jsp"%>

	</body>
</html>