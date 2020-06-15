<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<%@ include file="../setting.jsp"%>
<link rel='stylesheet' type='text/css' href='${root}/css/userlist.css' />
<title>Board List</title>
<script>
	function pageMove(pg) {
		$('#pg').val(pg);
		document.getElementById("pageform").action = "${root}/board/boards";
		document.getElementById("pageform").submit();
	}
	function submit(){
		$('#pg').val(1);
		$('#key').val($('#keys').val());
		$('#word').val($('#words').val());
		document.getElementById("pageform").action = "${root}/board/boards";
		document.getElementById("pageform").submit();
	}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	<div class="container">
		<form name="pageform" id="pageform" method="GET" action="">
			<input type="hidden" name="pg" id="pg" value="">
			<input type="hidden" name="key" id="key" value="">
			<input type="hidden" name="word" id="word" value="">
		</form>

		<div class="username_div">
			<div style="text-align: center;">
				<div class="form-group md">
					<div id="searchform" style="margin-left: 10%;">
						<c:if test="${ userinfo.getId() == 'admin' }">
							<input type="button" onClick="location.href='${root}/move/writeboardpage'" value="글쓰기" class="btn btn-default" style="float: left; margin-left: 5%; margin-right: 35% " />
						</c:if>
						<c:if test="${ userinfo.getId() != 'admin' }">
							<input type="button" class="btn btn-default" style="float: left; margin-left: 5%; margin-right: 40% " />
						</c:if>
						<input type="hidden" id="pg" value="">
						<select class="form-control" name="key" id="keys" tabindex="5" style="width: 100px; float: left; margin-right: 10px;">
							<option value="all">ALL</option>
							<option value="title" <c:if test="${key eq 'title'}">selected</c:if>>제목</option>
							<option value="content" <c:if test="${key eq 'content'}">selected</c:if>>내용</option>
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
							<th>번호</th>
							<th>제목</th>
							<th>등록일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="board" items="${ boards }">
							<tr>
								<td><strong>${ board.id }</strong></td>
								<td><a href="${ root }/board/board/${ board.id }">${ board.title }</a></td>
								<td>${ board.datetime }</td>
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