<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<%@ include file="../setting.jsp"%>
<%-- <link rel='stylesheet' type='text/css' href='${root}/css/login.css' /> --%>
<title>House Detail Information</title>
<script>

</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>

	<div class="container">
		<c:if test="${ userinfo != null }">
			<div class="username_div">
				<h2 style="text-align: center;">${ house.no }번${ house.aptName } 상세 정보 입니다.</h2>
				<hr>
				<div>
					<!--  -->
					<div style="text-align: center;">
						<%-- <img id="img" src="${root}/img/${ imgurl }.jpg" onerror="setImg();"> --%>
					</div>
				</div>
				<table class="table table-active table-bordered"
					style="text-align: center;">
					<thead class="table-primary">
						<tr>
							<th>번호</th>
							<th>동 명</th>
							<th>아파트 이름</th>
							<th>법정동 코드</th>
							<th>건축 연도</th>
							<th>지번</th>
						</tr>
					</thead>
					<tbody class="table-hover">
						<tr class="table-light">
							<th>${ house.no }</th>
							<th>${ house.dong }</th>
							<th>${ house.aptName }</th>
							<th>${ house.code }</th>
							<th>${ house.buildYear }</th>
							<th>${ house.jibun }</th>
						</tr>
					</tbody>
				</table>
			</div>
			<script type="text/javascript">
				function setImg() {
					$("#img").attr('src', "${root}/img/다세대주택.jpg");
				}
			</script>
		</c:if>
	</div>

	<%@ include file="/WEB-INF/views/modal.jsp"%>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>