<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${ pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<%@ include file="../setting.jsp"%>
<link rel='stylesheet' type='text/css' href='${root}/css/houselist.css' />
<title>House Detail Information</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
 	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCZfdQwv6kw3YqjpTPj7AdoOSaBWK-vgsk&callback=initMap&libraries=places" type="text/javascript"></script>
	<div class="container">		
		
		<div class="username_div">
			<h2 style="text-align: center;">선택하신 상세 정보입니다.</h2>
			<hr>
			
			<div id="map" style="width: 90%; height: 500px; margin: auto;"></div>
			
			<script>
				// Initialize and add the map
				var map;
				function initMap() {
				  // The location of Uluru
				  
				  let multi = {lat: 37.5665734, lng: 126.978179};				  // The map, centered at Uluru
				  map = new google.maps.Map(
				      document.getElementById('map'), {zoom: 12, center: multi});

				  var list = getObject();
				  for(var i = 0; i < list.length; i++){
					  multi = {lat: parseFloat(list[i][2]), lng :parseFloat(list[i][3])};
					  var marker = new google.maps.Marker({position: multi, map: map, label:list[i][0], title:list[i][1]});
					  marker.setMap(map);					  
				  }
				}
				function getObject() {
					var obj = [];
					var houses = '${houses}';
					let t = houses.split("HouseDetail");
					for(var i = 1; i<t.length; i++){
						let a = t[i].split('=');
						let no = a[1].split(',')[0];
						let aptName = a[3].split(',')[0];
						let lat = a[13].split(',')[0];
						let lng = a[14].split(',')[0].slice(0,-2);
						obj.push([no, aptName, lat, lng]);
					}
					return obj;
				}
				
		    </script>
			
			<div>
				<!--  -->
				<div style="text-align: center;">
					<%-- <img id="img" src="${root}/img/${ imgurl }.jpg" onerror="setImg();"> --%>
				</div>
			</div>
			<table">
				<thead class="table-primary">
					<tr>
						<th>번호</th>
						<th>동 명</th>
						<th>아파트 이름</th>
						<th>건축 년도</th>
						<th>거래 월/일</th>
						<th>크기</th>
						<th>층 수</th>
						<th>지번</th>
						<th>임대료</th>
						<th>거래액</th>
					</tr>
				</thead>
				<tbody class="table-hover">
					<c:forEach var="house" items="${ houses }">
						<tr class="table-light">
							<th>${ house.no }</th>
							<th>${ house.dong }</th>
							<th>${ house.aptName }</th>
							<th>${ house.buildYear }</th>
							<th>${ house.dealMonth } / ${ house.dealDay }</th>
							<th>${ house.area }</th>
							<th>${ house.floor }</th>
							<th>${ house.jibun }</th>
							<th>${ house.rentMoney }</th>
							<th>${ house.dealAmount }</th>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<script type="text/javascript">
			function setImg() {
				$("#img").attr('src', "${root}/img/다세대주택.jpg");
			}
		</script>
	</div>
	<%@ include file="/WEB-INF/views/modal.jsp"%>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>