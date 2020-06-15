<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<%@ include file="../setting.jsp"%>
<%-- <link rel='stylesheet' type='text/css' href='${root}/css/loginnnnnndasd.css' /> --%>
<title>House Information</title>
<script type="text/javascript">
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
			//document.getElementById("searchform").action = "${root}/house/searchAll";
			//document.getElementById("searchform").submit();
			$.ajax({
				method: 'POST',
				url: '${root}/house/list',
				data: {
					deal: $('#searchform input[name=deal]').val(),
					key: $('#dealoption option:selected').val(),
					search: $('#searchform input[name=word]').val()
				},
				success: function(data) {
					alert("성공");
					//var htmlTxt =
				}
			});
		}
	}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>

	<div class="container">
		<h2 style="text-align: center;">원하는 검색을 하세요.</h2>
		<hr>
		<div style="float: right;">
			<form id="searchform" method="post" action="">
				<input type="hidden" name="act" id="act" value="search">
				<div>
					<input type="checkbox" name="deal" value="1" checked="checked" />아파트 매매
					<input type="checkbox" name="deal" value="2" checked="checked" />아파트 전월세
					<input type="checkbox" name="deal" value="3" checked="checked" />다세대,주택 매매
					<input type="checkbox" name="deal" value="4" checked="checked" />다세대, 주택 전월세
				</div>
				<div style="float: right;">
					<select class="form-control" name="dealoption" id="dealoption" tabindex="5" style="width: 90px; float: left; margin-right: 10px;">
						<option value="all">--all--</option>
						<option value="dong">동</option>
						<option value="apt">아파트</option>
					</select>
					<input type="text" name="word" value="">
					<button type="button" class="btn btn-primary" onclick="validationCheck();">검색</button>
				</div>
			</form>
		</div>
	</div>

	<div id="list"></div>
	
	<%@ include file="/WEB-INF/views/modal.jsp"%>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>