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
		<h1>로그인 페이지 입니다.</h1>
		<form id="loginform" method="post" action="">
		<input type="hidden" name="act" value="login">
			
			<div class="form-group" align="left">
				<label for="">아이디</label>
				<input type="text" class="form-control" id="userid" name="id" placeholder="" value="">
			</div>
			
			<div class="form-group" align="left">
				<label for="">비밀번호</label>
				<input type="password" class="form-control" id="userpwd" name="pw" placeholder="" onkeydown="javascript:if(event.keyCode == 13) {login();}">
			</div>
			
			<div class="form-group" align="center">
				<button type="button" class="btn btn-warning" onclick="javascript:login();">로그인</button>
				<button type="button" class="btn btn-primary" onclick="javascript:moveJoin();">회원가입</button>
			</div>
		</form>
	</div>
</div>

<%@ include file="../footer.jsp"%>
<script type="text/javascript">
function login() {
	if(document.getElementById("userid").value == "") {
		alert("아이디 입력!!!");
		return;
	} else if(document.getElementById("userpwd").value == "") {
		alert("비밀번호 입력!!!");
		return;
	} else {
		document.getElementById("loginform").action = "login";
		document.getElementById("loginform").submit();
	}
}
function moveJoin() {
	document.location.href = "${ root }/joinpage";
}	
</script>