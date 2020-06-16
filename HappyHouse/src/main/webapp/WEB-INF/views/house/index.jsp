<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<%@ include file="../setting.jsp"%>
<link rel='stylesheet' type='text/css' href='${root}/css/houselist.css' />
<title>House Information</title>
<script type="text/javascript">

// 네이게이션 출력 x
// 검색 할때 엔터치면 검색 안됨
	$(document).ready(function(){
		validationCheck(1);
	});
	function pageMove(pg) {
		validationCheck(pg+1);
	}
	function validationCheck(pg) {
		var values = document.getElementsByName("deal");
		var flag = false;
		for (var i = 0; i < values.length; i++) {
			if (values[i].checked) {
				flag = true;
				break;
			}
		}
		if (!flag) {
			alert("1개 이상 체크 해주세요.");
		} else {
			list = [];
			values = document.getElementsByName("deal");
		
			for(var i = 0; i < values.length; i++) {
				if(values[i].checked) {
					list.push(values[i].value);
				}
			}
			
			$.ajax({
				method: 'GET',
				url: '${root}/house/list',
				traditional: true,
				data: {
					currentPage: pg,
					'deal': list,
					key: $('#dealoption option:selected').val(),
					word: $('#search_name').val()
				},
				success: function(data) {
					var htmlTxt = '<table><thead><tr><th>번호</th><th>아파트명</th><th>동</th><th>코드</th><th>건축년도</th><th>지번</th></tr></thead><tbody>';
					$.each(data.list, function(index, value) {
						htmlTxt += 	'<tr><td><strong>' + value.no + '</strong></td>' +
									'<td><a href="${root}/house/detail/' + value.no + '">' + value.aptName + '</a></td>' +
									'<td>' + value.dong + '</td>' +
									'<td>' + value.code + '</td>' +
									'<td>' + value.buildYear + '</td>' +
									'<td>' + value.jibun + '</td></tr>'
					});
					htmlTxt += '</tbody></table>';
					$('#list').html(htmlTxt);
					$('#list').show();
					$('#navi').show();
					$('#navi2').empty();
					$('#navi2').append(data.pageNavigation.navigator);
					
				}
			});
		}
	}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>

	<div class="container" style="margin-top: 2%;">
		<div style="margin-left: 40%">
				<input type="hidden" name="act" id="act" value="${root}/house/list">
				<input type="hidden" name="currentPage" id="pg" value="3">
				<div>
					<input type="checkbox" name="deal" value="1" checked="checked" />아파트 매매
					<input type="checkbox" name="deal" value="2" checked="checked" />아파트 전월세
					<input type="checkbox" name="deal" value="3" checked="checked" />다세대,주택 매매
					<input type="checkbox" name="deal" value="4" checked="checked" />다세대, 주택 전월세
				</div>
				<div style="margin-left: 32%">
					<select class="form-control" name="dealoption" id="dealoption" tabindex="5" style="width: 90px; float: left;">
						<option value="all">--all--</option>
						<option value="dong">동</option>
						<option value="apt">아파트</option>
					</select>
					<input type="text" name="word" value="" id="search_name">
				</div>
		</div>
	</div>
	
	<div id="list" style="display: none;"></div>
	
	<div class="center-block" id="navi" align="center" style="display: none;" >
		<table>
			<tr>
				<td id="navi2">
					<!-- page 출력부분 -->
				</td>
			</tr>
		</table>
	</div>
	<script type="text/javascript">
	$("#search_name").keypress(function(e) {
		if (e.which == 13) {
			validationCheck(1);
		}
	});
	</script>
	
	<%@ include file="/WEB-INF/views/modal.jsp"%>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>