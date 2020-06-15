<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
<div style="width: 100%;">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$.ajax({
				type : 'GET',
				url : '${root}/search',
				success:function(data){
					$.each(data, function(index, vo){
						let str = '<li class="list-group-item d-flex justify-content-between align-items-center" >'
							+ '<a href="#" style="font-size: 14px;">' + vo.dong + '</a> <a href="#" style="font-size: 10px;">' + vo.aptName + '</a>'
							+ '<span class="badge badge-primary badge-pill">' + vo.hitCnt + '</span>';
						$('#list').append(str);
					});
				},
			});
		});
	</script>
	<div class="container mt-3">
	  <ul id="list" class="list-group">
	  </ul>
	</div>
</div>