<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${ pageContext.request.contextPath }" />

<%@ include file="../header.jsp"%>

<div class="container">
	<c:if test="${ userinfo != null }">
		<div class="username_div">
			<p style="font-size: large;">
				<strong>${ userinfo.getName() } (${ userinfo.getId() })</strong>님 환영합니다.
				<button type="button" class="btn btn-info" onclick="logout()">로그아웃</button>
			</p>
		</div>
	</c:if>
	<div class="starter-template">
		<h1>회원가입 페이지 입니다.</h1>
		<form id="memberform" method="post" action="">
		<input type="hidden" name="act" id="act" value="join">
			<div class="form-group" align="left">
				<label for="">아이디</label>
				<input type="text" class="form-control" id="userid" name="id" placeholder="">
			</div>
			<div class="form-group" align="left">
				<label for="">비밀번호</label>
				<input type="password" class="form-control" id="userpwd" name="pw" placeholder="">
			</div>
			<div class="form-group" align="left">
				<label for="">비밀번호재입력</label>
				<input type="password" class="form-control" id="pwdcheck" name="pwcheck" placeholder="">
			</div>
			<div class="form-group" align="left">
				<label for="name">이름</label>
				<input type="text" class="form-control" id="username" name="name" placeholder="">
			</div>
			<div class="form-group" align="left">
				<label for="">주소</label><br>
				<input type="text" class="form-control" id="address" name="address" placeholder="">
			</div>
			<div class="form-group" align="left">
				<label for="tel">전화번호</label>
				<input type="text" class="form-control" id="phone" name="phone" placeholder="">
			</div>
			<div class="form-group" align="center">
				<button type="button" class="btn btn-primary" id="registerBtn">회원가입</button>
				<button type="reset" class="btn btn-warning">초기화</button>
			</div>
		</form>
	</div>
</div>

<%@ include file="../footer.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
	$("#registerBtn").click(function() {
		if($("#username").val() == "") {
			alert("이름 입력!!!");
			return;
		} else if($("#userid").val() == "") {
			alert("아이디 입력!!!");
			return;
		} else if($("#userpwd").val() == "") {
			alert("비밀번호 입력!!!");
			return;
		} else if($("#userpwd").val() != $("#pwdcheck").val()) {
			alert("비밀번호 확인!!!");
			return;
		} else {
			$("#memberform").attr("action", "join").submit();
		}
	});
});
</script>