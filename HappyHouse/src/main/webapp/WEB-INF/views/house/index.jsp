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

	function pageMove(pg) {
		$('#pg').val(pg);
		document.getElementById("pageform").action = "${root}/user/userlist/" + pg;
		document.getElementById("pageform").submit();
	}

	function validationCheck() {
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
		
			console.log(list);
			for(var i = 0; i < values.length; i++) {
				if(values[i].checked) {
					list.push(values[i].value);
				}
			}
			console.log(list);
			
			$.ajax({
				method: 'POST',
				url: '${root}/house/list',
				traditional: true,
				data: {
					currentPage: 1,
					'deal': list,
					key: $('#dealoption option:selected').val(),
					word: $('#searchform input[name=word]').val()
				},
				success: function(data) {
					var htmlTxt = '<table><thead><tr><th>번호</th><th>아파트명</th><th>동</th><th>코드</th><th>건축년도</th><th>지번</th></tr></thead><tbody>';
					$.each(data, function(index, value) {
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
			<form id="searchform">
				<input type="hidden" name="act" id="act" value="${root}/house/list">
				<div>
					<input type="checkbox" name="deal" value="1" checked="checked" />아파트 매매
					<input type="checkbox" name="deal" value="2" checked="checked" />아파트 전월세
					<input type="checkbox" name="deal" value="3" checked="checked" />다세대,주택 매매
					<input type="checkbox" name="deal" value="4" checked="checked" />다세대, 주택 전월세
				</div>
				<div style="margin-left: 22%">
					<select class="form-control" name="dealoption" id="dealoption" tabindex="5" style="width: 90px; float: left; margin-right: 10px;">
						<option value="all">--all--</option>
						<option value="dong">동</option>
						<option value="apt">아파트</option>
					</select>
					<input type="text" name="word" value="" onkeydown="javascript:if(event.keyCode == 13) {validationCheck();}">
					<button type="button" class="btn btn-primary" onclick="validationCheck();">검색</button>
				</div>
			</form>
		</div>
	</div>
	
	<div id="list" style="display: none;"></div>
	
	<div class="center-block" id="navi" align="center" style="display: none;" >
		<table>
			<tr>
				<td>
					<!-- page 출력부분 -->
					${navigation.getNavigator}
				</td>
			</tr>
		</table>
	</div>
	
	<%@ include file="/WEB-INF/views/modal.jsp"%>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>