<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${ pageContext.request.contextPath }" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<div style="width: 100%;">
	<div class="container mt-3">
	<script type="text/javascript">
		var pieData = [];
		var piePartName = '';
		$(document).ready(function(){
			$.ajax({
				type : 'GET',
				url : '${root}/search',
				success:function(data){
					$.each(data, function(index, vo){
						let str = '<li style="height: 35px;" class="list-group-item d-flex justify-content-between align-items-center" >'
							+ '<a href="${root}/house/detail/dong/'+vo.dong+'" style="font-size: 14px;">' + vo.dong + '</a> <a href="${root}/house/detail/'+vo.dong+'/'+vo.aptName+'" style="font-size: 10px;">' + vo.aptName + '</a>'
							+ '<span class="badge badge-primary badge-pill">' + vo.hitCnt + '</span>';
						$('#list').append(str);
						if(vo.aptName != ''){
							piePartName = vo.dong + '/' + vo.aptName;
						}else{
							piePartName = vo.dong;
						}
						pieData.push([piePartName, vo.hitCnt]);
					});
				},
			});
		});
		$('#btn_chart').on("click", function(){
			var chartDonut = c3.generate({
				  bindto: "#chart",
				  data: {
					  type: 'donut',
					  columns: pieData
				  }
				});
			$('#chart').show(1000);
		});
	</script>
	  <ul id="list" class="list-group">
	  </ul>
	  <div id="chart" style="display: none;">
	  </div>
	</div>
</div>