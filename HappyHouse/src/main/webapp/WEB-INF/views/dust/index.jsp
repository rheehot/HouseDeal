<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${ pageContext.request.contextPath }" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.css" />

<!-- Page Content -->
<script src="https://d3js.org/d3.v3.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.js"></script>

<div class="container">
	<br>
	<div style='float: left;'>
		<h5>
			<input type="checkbox" name="fav_location" onclick='boxChecked(this);'> 실시간 미세먼지 수치
		</h5>
	</div>
	<div style='float: right; margin-right: 5%;'>
		<h5>
			<input id="search_name" placeholder="지역구"></input>
		</h5>
	</div>
	<br>
	<div id="linechart"></div>
	<br>
	<div style="text-align: center;">
		<div style="float: left; width: 50%">
			<img alt="미세먼지 수치" src="${root}/images/pm10dust.png" width="80%" />
		</div>
		<div style="float: right; width: 50%">
			<img alt="초 미세먼지 수치" src="${root}/images/pm25dust.png" width="80%" />
		</div>
	</div>
	<br> <br> <br>
	
	<script type="text/javascript">
		var datas = [];
		$.ajax({
			type : 'GET',
			url : '/happyhouse/api/dust',
			success : function(data) {
				$.each(data, function(i, item) {
					datas.push([ item.cityName, item.pm10Value, item.pm25Value ]);
				});
				getC3Object(datas);
			},
		});
		$("#search_name").keypress(function(e) {
			if ($("#search_name").val() == '') {
				$.ajax({
					type : 'GET',
					url : '/happyhouse/api/dust',
					success : function(data) {
						$.each(data, function(i, item) {
							datas.push([ item.cityName, item.pm10Value,
									item.pm25Value ]);
						});
						getC3Object(datas);
					},
				});
			}
			let searchDatas = [];
			if (e.which == 13) {
				$.each(datas, function(i, item) {
					if (item[0].includes($("#search_name").val())) {
						searchDatas.push(item);
					}
				});
				getC3Object(searchDatas);
			}
		});

		function getC3Object(list) {
			c3.generate({
				bindto : "#linechart",
				data : {
					columns : list,
					type : 'bar'
				},
				bar : {
					width : {
						ratio : 0.8
					// this makes bar width 50% of length between ticks
					}
				}
			});
		}
		function boxChecked(cb){
			if(cb.checked){
				if(${userinfo != null}){
					let searchDatas = [];
					$.ajax({
						type : 'GET',
						url : '/happyhouse/favorite/gugun/fav/${userinfo.userNo}',
 						success: function(data){
 	 						if(data == null && data == ''){
 	 	 						alert('관심지역을 설정하지 않았습니다.');
 	 	 						searchDatas = datas;
 	 						}else{
 	 							$.each(datas, function(i, item) {
 	 								if (item[0].includes(data)) {
 	 									searchDatas.push(item);
 	 								}
 	 							});
 	 	 					}
 	 						getC3Object(searchDatas);
 	 					},
					});
				}else{
					alert("회원 전용만 가능합니다.");
					cb.checked = false;
					return;
				}
			}else{
				getC3Object(datas);
			}
		}
	</script>
</div>