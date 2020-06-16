<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${ pageContext.request.contextPath }" />
<script src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCZfdQwv6kw3YqjpTPj7AdoOSaBWK-vgsk&callback=initMap"></script>
<link rel='stylesheet' type='text/css' href='${root}/css/googlemap.css' />
<div style="margin-top: 50px;">
	<div class="starter-template">
		<div class="form-group md" style="float: right;">
			<select class="form-control" name="dong" id="dong">
				<option value="0">선택</option>
			</select>
		</div>
		<div class="form-group md" style="float: right;">
			<select class="form-control" name="gugun" id="gugun">
				<option value="0">선택</option>
			</select>
		</div>
		<div class="form-group md" style="float: right;">
			<select class="form-control" name="sido" id="sido">
				<option value="0">선택</option>
			</select>
		</div>
	</div>

	<div id="map" style="width: 90%; height: 500px; margin: auto;"></div>
	<table class="table mt-2" style="width: 90%; text-align: center;">
		<thead>
			<tr>
				<th>No</th>
				<th>법정동</th>
				<th>아파트이름</th>
				<th>지번</th>
				<th>지역코드</th>
				<th>위도</th>
				<th>경도</th>
			</tr>
		</thead>
		<tbody class='tbody'>
		</tbody>
	</table>
	<button type="button" id="btn-tog"class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" style="visibility: hidden;">
	</button>
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">확인 다이얼로그</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-primary" onclick="search()">정보 보러가기</button>
	      </div>
	    </div>
	  </div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$.ajax({
				url : "${root}/selectbox/sido",
				success : function(data, status) {
					$.each(data, function(idx, vo){
						let tempStr = "<option value="+ vo.sidoCode +">" + vo.sidoName + "</option>";
						$('#sido').append(tempStr);
					});
				},
				dataType : "json"
			});
			$("#sido").change(function(){
				$('#gugun').empty();
				let tempStr = "<option>선택</option>";
				$('#gugun').append(tempStr);
				$(document).ready(function() {
					$.ajax({
						url : "${root}/selectbox/gugun/" + $("#sido").val().substring(0, 2),
						success : function(data, status) {
							$.each(data, function(idx, vo){
								let tempStr = "<option value="+ vo.gugunCode +">" + vo.gugunName + "</option>";
								$('#gugun').append(tempStr);
							});
						},
						dataType : "json"
					});
				});
			});
			$("#gugun").change(function(){
				$('#dong').empty();
				let tempStr = "<option>선택</option>";
				$('#dong').append(tempStr);
				$(document).ready(function() {
					$.ajax({
						url : "${root}/selectbox/dong/" + $("#gugun").val().substring(0, 5),
						success : function(data, status) {
							//$('#dong').empty();
							$.each(data, function(idx, vo){
								let tempStr = "<option value="+ vo.dong +">" + vo.dong + "</option>";
								$('#dong').append(tempStr);
							});
						},
						error : function(){
							
						},
						dataType : "json"
					});
				});
			});
			$("#dong").change(function() {
				initMap();
				$.ajax({
					url : "${root}/selectbox/apt/" + $("#dong").val(),
					success : function(data, status){
						$('.tbody').empty();
						$.each(data, function(index, vo) {
							let str = "<tr>"
							+ "<td id=apt_"+vo.no+">" + vo.no + "</td>"
							+ "<td>" + vo.dong + "</td>"
							+ "<td>" + vo.aptName + "</td>"
							+ "<td>" + vo.jibun + "</td>"
							+ "<td>" + vo.code
							+ "</td><td id='lat_"+index+"'>" + vo.lat + "</td><td id='lng_"+index+"'>" + vo.lng + "</td></tr>";
							$(".tbody").append(str);
						});
						geocode(data);
					},
					dataType : "json"
				});
				$.ajax({
					type : 'POST',
					url : '${root}/search',
					data : {
						dong : $("#dong").val(),
						aptName : '',
					},
					success : function(data){
						
					},
				});
			});
		});
		function geocode(jsonData) {
			let idx = 0;
			$.each(jsonData, function(index, vo) {
				let tmpLat;
				let tmpLng;
				$.get("https://maps.googleapis.com/maps/api/geocode/json"
						,{	key:'AIzaSyCZfdQwv6kw3YqjpTPj7AdoOSaBWK-vgsk'
							, address:vo.dong+"+"+vo.aptName+"+"+vo.jibun
						}
						, function(data, status) {
							//alert(data.results[0].geometry.location.lat);
							//tmpLat = data.results[0].geometry.location.lat;
							//tmpLng = data.results[0].geometry.location.lng;
							tmpLat = vo.lat;
							tmpLng = vo.lng;
							$("#lat_"+index).text(tmpLat);
							$("#lng_"+index).text(tmpLng);
							addMarker(tmpLat, tmpLng, vo.aptName, index);
						}
						, "json"
				);//get
			});//each
		}
	</script>
	<script>
	var aptName = 0;
	var multi = {lat: 37.5665734, lng: 126.978179};
	var map;
	function initMap() {
		map = new google.maps.Map(document.getElementById('map'), {
			center: multi, zoom: 12
		});
	}
	function addMarker(tmpLat, tmpLng, aptName, index) {
		var marker = new google.maps.Marker({
			position: new google.maps.LatLng(parseFloat(tmpLat),parseFloat(tmpLng)),
			/* label: aptName, */
			title: aptName
		});
		marker.addListener('click', function() {
			map.setZoom(17);
			map.setCenter(marker.getPosition());
			callHouseDealInfo(index);
			$('.modal-body').text(getInfo(index));
			$('#btn-tog').click();
		});
		marker.setMap(map);
	}
	function callHouseDealInfo(position) {
		position = '#lat_'+position;
		aptName = $(position).siblings()[2].textContent;
	}
	function getInfo(position){
		var result = "";
		position = '#lat_'+position;
		result += $(position).siblings()[0].textContent + "번 '";
		result += $(position).siblings()[2].textContent + "' 아파트를 상세히 보시겠습니까?";
		return result;
	}
	function search(){
		$.ajax({
			type : 'POST',
			url : '${root}/search',
			data : {
				dong : $("#dong").val(),
				aptName : aptName
			},
			success : function(data){
				
			},
		});
		location.href = "${root}/house/detail/"+ $("#dong").val() + "/" + aptName;
	}
	</script>
</div>