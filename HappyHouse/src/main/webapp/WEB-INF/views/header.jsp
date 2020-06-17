<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
function boardlist() {
	document.getElementById("pageform").action = "${root}/board/boards";
	document.getElementById("pageform").submit();
}
function shoplist() {
	document.getElementById("pageform").action = "${root}/shop/list";
	document.getElementById("pageform").submit();
}
</script>
<form name="pageform" id="pageform" method="GET" action="">
	<input type="hidden" name="pg" id="pg" value="1">
	<input type="hidden" name="key" id="key" value="${key}">
	<input type="hidden" name="word" id="word" value="${word}">
	<!-- <input type="hidden" name="filter" id="filter" value="on"> -->
</form>
<!-- Navigation -->
<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
	<div class="container">
		<a class="navbar-brand" href="${ root }">Happy House</a>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="javascript:boardlist();">공지사항</a></li>
				<c:if test="${ userinfo == null }">
					<li class="nav-item"><a class="nav-link" href="${root}/user/loginpage">로그인</a></li>
					<li class="nav-item"><a class="nav-link" href="${root}/user/joinpage">회원가입</a></li>
				</c:if>
				<c:if test="${ userinfo != null }">
					<li class="nav-item"><a class="nav-link" href="${root}/move/house">아파트 정보</a></li>
					<li class="nav-item"><a class="nav-link" href="javascript:shoplist();">상권 정보</a></li>
					<li class="nav-item"><a class="nav-link" href="${root}/api/qna">QnA</a></li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<strong>${ userinfo.getName() } (${ userinfo.getId() })</strong>님 환영합니다.</a>
						<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
							<!-- admin일 경우 회원 목록 보기 + 삭제 기능 추가 -->
							<c:if test="${userinfo.getId() eq 'admin'}">
								<a class="dropdown-item" href="${ root }/user/userlist/1">회원관리</a>
							</c:if>
							<a class="dropdown-item" href="${ root }/favorite/changeloc">관심지역 변경</a>
							<a class="dropdown-item" href="${ root }/user/updatepage">회원정보 수정</a>
							<a class="dropdown-item" href="${ root }/user/logout">로그아웃</a>
						</div>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
</nav>
