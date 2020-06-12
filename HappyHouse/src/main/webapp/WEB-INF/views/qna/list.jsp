<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<%@ include file="../setting.jsp"%>
<link rel='stylesheet' type='text/css' href='${root}/css/login.css' /> <!-- css/login.css -->
<title>Log In</title>
<script type="text/javascript">
	
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	
	<div class="container">
		<c:if test="${ userinfo == null }">
			<h3>로그인이 필요한 페이지 입니다.</h3>
			<button type="button" class="btn btn-warning" onclick="login()"></button>
		</c:if>
		<c:if test="${ userinfo != null }">
		<!-- Page Heading/Breadcrumbs -->
		<h1>Happy House 자유 게시판</h1>
	    <h1 class="mt-4 mb-3" style="color: white;">Happy House 자유 게시판
	    </h1>
	
	    <ol class="breadcrumb">
	      <li class="breadcrumb-item">
	        <a href="${ root }">Happy House</a>
	      </li>
	      <li class="breadcrumb-item active">자유 게시판</li>
	    </ol>
	
		<div align="right">
	      	<button onclick="location.href='${root}/move/qnainsert'" class="btn btn-primary">게시글 작성하기</button>
      	</div>
		<br>
	    <!-- Blog Post -->
	    <c:forEach var="qna" items="${ qnas }">
			<div class="card mb-4">
		      <div class="card-body">
		        <div class="row">
		          <div class="col-lg-6">
		            <a href="#">
		              <img class="img-fluid rounded" src="${ root }/images/${ qna.qnaImage }" alt="">
		            </a>
		          </div>
		          <div class="col-lg-6">
		            <h3 class="card-title">#${ qna.qnaTitle }</h3>
		            <p class="card-text">${ qna.qnaContent }</p>
		            <a href="${ root }/api/qna/${ qna.qnaNo }" class="btn btn-primary">Read More &rarr;</a>
		          </div>
		        </div>
		      </div>
		      <div class="card-footer text-muted">
		        <a href="${ root }/api/qna/${ qna.qnaNo }">${ qna.replyCnt }개의 답글이 달렸습니다.</a>
		      </div>
		    </div>
	    </c:forEach>
	
	    <!-- Pagination -->
	    <ul class="pagination justify-content-center mb-4">
	      <li class="page-item">
	        <a class="page-link" href="#">&larr; Older</a>
	      </li>
	      <li class="page-item disabled">
	        <a class="page-link" href="#">Newer &rarr;</a>
	      </li>
	    </ul>
	    </c:if>
	</div>
	
	<%@ include file="../footer.jsp"%>
</body>
</html>