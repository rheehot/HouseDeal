<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<%@ include file="setting.jsp"%>
<title>Happy House</title>
<script type="text/javascript">
$(document).ready(function(){
	
});
function showMain(){
	console.log("test");
}
</script>
</head>

<body>
	<%@ include file="header.jsp"%>
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
					style="background-image: url('https://cdn.wallpapersafari.com/80/94/wfc1rJ.jpg')">
					<div class="carousel-caption d-none d-md-block">
						<h3>Happy Seoul House</h3>
						<p>해피 서울 하우스에 오신것을 환영합니다.</p>
					</div>
				</div>
				<!-- Slide Two - Set the background image for this slide in the line below -->
				<div class="carousel-item"
					style="background-image: url('https://lh4.googleusercontent.com/proxy/gSITt5dYe68aKdex4tVMq1uAG6Z2N9EMfg9KGhiTtrn4HEI-H-oJGnA40gT2ScIdw_3tafBJiKWqfnUgIvGVCE-9K-FB9GvDYuPxvkrxtPKpPFB_5n40DFThMhrAqA3xhOtxDtOmN0k5Inz0SsxI84iovL2C8KWyREwA=s0-d')">
					<div class="carousel-caption d-none d-md-block">
						<h3>What house do you want?</h3>
						<p>당신은 어떤 하우스 정보를 얻고 싶으신가요?</p>
					</div>
				</div>
				<!-- Slide Three - Set the background image for this slide in the line below -->
				<div class="carousel-item"
					style="background-image: url('https://wallpaperaccess.com/full/295822.jpg')">
					<div class="carousel-caption d-none d-md-block">
						<h3>Add a region of interest!</h3>
						<p>지금 당장 관심지역을 추가해서 다양하게 확인하세요!</p>
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
	<!-- Page Content -->
	<div class="container">

		<h1 class="my-4">Welcome to Happy House</h1>

		<!-- Features Section -->
		<div class="row">
			<div class="col-lg-6">
				<h2>Happy House Features</h2>
				<p>저희 해피하우스는 다음과 같은 서비스를 제공해드립니다.</p>
				<ul>
					<li>구글 맵과 연동한 하우스 정보 제공</li>
					<li>여러 고객들과 소통할 자유 게시판</li>
					<li>서울구별 실시간 미세먼지 상황</li>
					<li>하우스 정보 검색 및 확인</li>
					<li>----</li>
				</ul>
				<p>해피하우스는 여러분들이 필요한 데이터와 정보들을 더 좋은 서비스로 제공해드리기 위해
				최선을 다하겠습니다.</p>
			</div>
			<div class="col-lg-6">
				<img class="img-fluid rounded" src="images/attention.png" alt="">
			</div>
		</div>
		<!-- /.row -->

		<hr>

		<!-- Call to Action Section -->
		<div class="row mb-4">
			<div class="col-md-8">
				<h4>그럼 지금 바로 검색을 이용해보세요!</h4>
			</div>
			<div class="col-md-4">
				<a class="btn btn-lg btn-secondary btn-block" onClick="showMain()">Call to Action</a>
			</div>
		</div>

		<%-- <%@ include file="dust/index.jsp"%> --%>
	</div>
	<!-- /.container -->

	<%@ include file="footer.jsp"%>
</body>
</html>