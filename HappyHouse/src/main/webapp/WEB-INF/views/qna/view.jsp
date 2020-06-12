<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<%@ include file="../setting.jsp"%>
<link rel='stylesheet' type='text/css' href='${root}/css/login.css' /> <!-- css/login.css -->
<title>Log In</title>
<script type="text/javascript">
	
</script>
<style type="text/css">
p{
	color: white;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		type:'GET',
		url:'/happyhouse/api/qna/reply/'+${qna.qnaNo},
		success:function(data){
			$.each(data, function(idx, vo){
				let tempStr = "<div class='media mb-4'>";
	          		tempStr += "<div class='media-body'>";
	          		tempStr +=  "<h5 class='mt-0' style='color: white;'>"+vo.name+"(" + vo.id +")</h5>";
	            	tempStr +="<p id='reply_update_"+vo.replyNo+"'>"+ vo.replyContent+"</p>"
	            	if(check(${qna.qnaUserNo}, vo.replyQnaUserNo)){
		            	tempStr += "<button onclick='updateReply("+vo.replyNo+")' class='btn btn-primary'>댓글 수정하기</button>";
		            	tempStr += "<button onclick='removeReply("+vo.replyNo+")' class='btn btn-primary'>댓글 삭제하기</button>";
	            	}
					tempStr += "</div></div><hr>";
					$('#div_reply').append(tempStr);
			});			
		},
		error:function(){

		}
	});
	function check(writer, replyWriter){
		return writer == replyWriter;
	}
});
function removeReply(no){
	console.log($('#reply_input').val());
}
function updateReply(no){
	$('#reply_update_'+no).text('');
	$('#reply_update_'+no).append('<textarea type="text" id="reply_input" style="width: 100%"></textarea>');
	$('#reply_update_'+no).append('<button class="btn btn-primary" onclick="update">확인</button>');
}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	  <!-- Page Content -->
  <div class="container">
	<div  style="margin-top: 100px;">
    <div class="row">

      <!-- Post Content Column -->
      <div class="col-lg-8">		
        <!-- Preview Image -->
        <img class="img-fluid rounded" src="${ root }/images/${qna.qnaImage}" alt="">

        <hr>
       	<p style="font-size: 50px;">${qna.qnaTitle}</p> 
        <hr>

        <!-- Post Content -->
        <p class="lead">${ qna.qnaContent }</p>

        <hr>

		<p>Posted on ${qna.qnaDatetime}</p>
        <!-- Comments Form -->
        <div class="card my-4">
          <h5 class="card-header">Leave a Comment:</h5>
          <div class="card-body">
            <form>
              <div class="form-group">
                <textarea class="form-control" rows="3"></textarea>
              </div>
              <button type="submit" class="btn btn-primary">Submit</button>
            </form>
          </div>
        </div>

		<br>
		
		<div id="div_reply"></div>
        <!-- Single Comment -->
        <%-- <c:forEach var="reply" items="${ replys }">
        	
        </c:forEach> --%>
      </div>

      <!-- Sidebar Widgets Column -->
      <div class="col-md-4">
        <!-- Search Widget -->
        <div class="card mb-4">
          <h5 class="card-header">Search</h5>
          <div class="card-body">
            <div class="input-group">
              <input type="text" class="form-control" placeholder="Search for...">
              <span class="input-group-btn">
                <button class="btn btn-secondary" type="button">Go!</button>
              </span>
            </div>
          </div>
        </div>

      </div>
	</div>
    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->
	
	<%@ include file="../footer.jsp"%>
</body>
</html>