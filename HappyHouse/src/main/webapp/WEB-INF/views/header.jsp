<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
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
				<li class="nav-item"><a class="nav-link" href="about.html">공지사항</a></li>
				<li class="nav-item"><a class="nav-link" href="services.html">QnA</a></li>
				<c:if test="${ userinfo == null }">
					<li class="nav-item"><a class="nav-link" href="loginpage">로그인</a></li>
					<li class="nav-item"><a class="nav-link" href="joinpage">회원가입</a></li>
				</c:if>
				<%-- <c:if test="${ userinfo != null }"> --%>
					<li class="nav-item"><a class="nav-link" href="contact.html">HouseInfo</a></li>
					<li class="nav-item"><a class="nav-link" href="contact.html">대기환경 정보</a></li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<strong>${ userinfo.getName() } (${ userinfo.getId() })</strong>님 환영합니다.</a>
						<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
							<!-- admin일 경우 회원 목록 보기 + 삭제 기능 추가 -->
							<%-- <c:if test="${userinfo.getId() eq 'admin'}">  --%>
								<a class="dropdown-item" href="${ root }/userlist">회원관리</a>
							<%-- </c:if> --%>
							<a class="dropdown-item" href="">관심지역 변경</a>
							<a class="dropdown-item" href="">회원정보 수정</a>
							<a class="dropdown-item" href="">로그아웃</a>
						</div>
					</li>
				<%-- </c:if> --%>
			</ul>
		</div>
	</div>
</nav>

<header>
	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<!-- Slide One - Set the background image for this slide in the line below -->
			<div class="carousel-item active"
				style="background-image: url('http://placehold.it/1900x1080')">
				<div class="carousel-caption d-none d-md-block">
					<h3>First Slide</h3>
					<p>This is a description for the first slide.</p>
				</div>
			</div>
			<!-- Slide Two - Set the background image for this slide in the line below -->
			<div class="carousel-item"
				style="background-image: url('http://placehold.it/1900x1080')">
				<div class="carousel-caption d-none d-md-block">
					<h3>Second Slide</h3>
					<p>This is a description for the second slide.</p>
				</div>
			</div>
			<!-- Slide Three - Set the background image for this slide in the line below -->
			<div class="carousel-item"
				style="background-image: url('http://placehold.it/1900x1080')">
				<div class="carousel-caption d-none d-md-block">
					<h3>Third Slide</h3>
					<p>This is a description for the third slide.</p>
				</div>
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
</header>