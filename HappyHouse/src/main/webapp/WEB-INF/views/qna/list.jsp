<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<%@ include file="../setting.jsp"%>
<link rel='stylesheet' type='text/css' href='${root}/css/houselist.css' />
<!-- css/login.css -->
<title>QnA</title>
<script type="text/javascript">
window.onload = function() {
    if(!window.location.hash) {
    	location.href = "${root}/api/qna";
        window.location = window.location + '#loaded';
        window.location.reload();
    }
}
function login() {
	if (document.getElementById("userid").value == "") {
		$('#modaltext').text('아이디를 입력해 주세요.');
		$('#myModal').modal('show');
		return;
	} else if (document.getElementById("userpwd").value == "") {
		$('#modaltext').text('비밀번호를 입력해 주세요.');
		$('#myModal').modal('show');
		return;
	} else {
		document.getElementById("loginform").action = "${root}/user/login";
		$('#login_link').val("qna/list");
		console.log($('#login_link').val());
		document.getElementById("loginform").submit();
	}
}
function moveJoin() {
	document.location.href = "${ root }/user/joinpage";
}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>

	<div class="container">
		<div style="margin-top: 100px;">
			<c:if test="${ userinfo == null }">
				<h3">로그인이 필요한 페이지 입니다.</h3>
				<div class="login-box">
					<h2>LogIn</h2>
					<form id="loginform" method="post" action="">
						<input type="hidden" name="act" value="login">
						<input id="login_link" type="hidden" name="address" value="">
						<div class="user-box">
							<input type="text" id="userid" name="id" required=""> <label>ID</label>
						</div>
						<div class="user-box">
							<input type="password" id="userpwd" name="password" required="" onkeydown="javascript:if(event.keyCode == 13) {login();}"> <label>Password</label>
						</div>
						<a href="#" onclick="javascript:login();"> <span></span> <span></span> <span></span> <span></span>
							LogIn
						</a>
						<a href="#" onclick="javascript:moveJoin();"> <span></span> <span></span> <span></span> <span></span>
							SignUp
						</a>
					</form>
				</div>
			</c:if>
			<c:if test="${ userinfo != null }">
				<!-- Page Heading/Breadcrumbs -->
				<h1 class="mt-4 mb-3"">Happy House 자유 게시판
				</h1>

				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="${ root }">Happy
							House</a></li>
					<li class="breadcrumb-item active">자유 게시판</li>
				</ol>

				<div align="right">
					<button onclick="location.href='${root}/move/qnainsert'"
						class="btn btn-secondary">게시글 작성하기</button>
				</div>
				<br>
				<!-- Blog Post -->
				<c:forEach var="qna" items="${ qnas }">
					<div class="card mb-4">
						<div class="card-body">
							<div class="row">
								<div class="col-lg-6">
									<a href="#"> <img class="img-fluid rounded"
										src="${ root }/images/${ qna.qnaImage }" alt="">
									</a>
								</div>
								<div class="col-lg-6">
									<h3 class="card-title">#${ qna.qnaTitle }</h3>
									<p class="card-text">${ qna.qnaContent }</p>
									<a href="${ root }/api/qna/${ qna.qnaNo }"
										class="btn btn-secondary">Read More &rarr;</a>
								</div>
							</div>
						</div>
						<div id='reply_count_div' class="card-footer text-muted">
							<a href="${ root }/api/qna/${ qna.qnaNo }">${ qna.replyCnt }개의
								답글이 달렸습니다.</a>
						</div>
					</div>
				</c:forEach>

				<!-- Pagination -->
				<!-- <ul class="pagination justify-content-center mb-4">
	      <li class="page-item">
	        <a class="page-link" href="#">&larr; Older</a>
	      </li>
	      <li class="page-item disabled">
	        <a class="page-link" href="#">Newer &rarr;</a>
	      </li>
	    </ul> -->
			</c:if>
		</div>
	</div>
	<!-- <script>
		location.reload();
	</script> -->

	<%@ include file="../footer.jsp"%>
</body>
</html>