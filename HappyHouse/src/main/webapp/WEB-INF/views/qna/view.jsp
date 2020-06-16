<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<%@ include file="../setting.jsp"%>
<link rel='stylesheet' type='text/css' href='${root}/css/houselist.css' />
<title>Log In</title>
<script type="text/javascript">
	
</script>
<style type="text/css">
hr{
	border: solid 1px;
}
</style>
<script type="text/javascript">
var tempTitle = '';
var tempContent = '';
$(document).ready(function(){
	$.ajax({
		type:'GET',
		url:'/happyhouse/api/qna/reply/'+${qna.qnaNo},
		success:function(data){
			$.each(data, function(idx, vo){
				let tempStr = "<div class='media mb-4'>";
	          		tempStr += "<div class='media-body'>";
	          		tempStr +=  "<h5 class='mt-0'>"+vo.name+"(" + vo.id +")</h5>";
	            	tempStr +="<p id='reply_update_"+vo.replyNo+"'>"+ vo.replyContent+"</p>"
	            	if(check(${userinfo.userNo}, vo.replyQnaUserNo)){
		            	tempStr += "<button onclick='updateReply("+vo.replyNo+")' class='btn btn-secondary'>댓글 수정하기</button> ";
		            	tempStr += "<button onclick='removeReply("+vo.replyNo+")' class='btn btn-secondary'>댓글 삭제하기</button>";
	            	}
					tempStr += "</div></div><hr>";
					$('#div_reply').append(tempStr);
			});			
		},
		error:function(){

		}
	});
	function check(writer, replyWriter){
		console.log(writer + " " + replyWriter);
		return writer === replyWriter;
	}
	tempTitle = $('#qna_title').text();
 	tempContent = $('#qna_content').text();
});
function removeReply(no){
	$.ajax({
		type : 'DELETE',
		url : '/happyhouse/api/qna/reply/' + no,
		success: function(data){
			if(data == 'suc'){
				location.href = '${root}/api/qna/${qna.qnaNo}';	
			}else{
				alert("삭제중 오류가 발생했습니다.");
			}
		},
		error: function(data){
			
		}
	});
}
function updateReply(no){
	$('#reply_update_'+no).text('');
	$('#reply_update_'+no).append('<textarea type="text" id="reply_input" style="width: 100%"></textarea>');
	$('#reply_update_'+no).append('<button class="btn btn-secondary" onclick="update('+no+')">확인</button>');
}
function updateForm(){
	let titleTag = '<input type="text" id="qna_title_input" value='+tempTitle+' style="width: 100%"></input>';
	let contentTag = '<textarea type="text" id="qna_content_input" style="width: 100%"></textarea>';
	$('#qna_title').text('');
	$('#qna_content').text('');
	$('#qna_title').append(titleTag);
	$('#qna_content').append(contentTag);
	$('#qna_content_input').val(tempContent);
	$('#qna_content').append('<button class="btn btn-secondary" onclick="updatePost()">수정 완료 하기</button>');
}
function updatePost(){
	$.ajax({
		type : 'PUT',
		url : '/happyhouse/api/qna',
		data : {
			qnaNo : ${qna.qnaNo},
			qnaTitle : $('#qna_title_input').val(),
			qnaContent : $('#qna_content_input').val()
		},
		success: function(data){
			if(data == 'suc'){
				location.href = '${root}/api/qna/${qna.qnaNo}';	
			}else{
				alert("게시글 수정 중 오류가 발생했습니다.");
			}
		},
		error: function(data){
			
		}
	});
}

function removePost(){
	$.ajax({
		type : 'DELETE',
		url : '/happyhouse/api/qna/${qna.qnaNo}',
		success: function(data){
			if(data == 'suc'){
				location.href = '${root}/api/qna';	
			}else{
				alert("게시글 삭제 중 오류가 발생했습니다.");
			}
		},
		error: function(data){
			
		}
	});
}
function update(no){
	$.ajax({
		type : 'PUT',
		url : '/happyhouse/api/qna/reply',
		data : {
			replyNo : no,
			replyContent : $('#reply_input').val()
		},
		success: function(data){
			if(data == 'suc'){
				location.href = '${root}/api/qna/${qna.qnaNo}';	
			}else{
				alert("수정중 오류가 발생했습니다.");
			}
		},
		error: function(data){
			
		}
	});
}

function insertReply(userNo){
	$.ajax({
		type : 'POST',
		url : '/happyhouse/api/qna/reply',
		data :{
			replyQnaNo : ${qna.qnaNo},
			replyQnaUserNo : ${userinfo.userNo},
			replyContent : $('#reply_write').val()
		},
		success:function(data){
			if(data == 'suc'){
				location.href = '${root}/api/qna/${qna.qnaNo}';	
			}else{
				alert('댓글 등록중 오류가 발생했습니다.');
			}
		}
	});
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
		<div style="float: right;">
			<c:if test="${ qna.qnaUserNo == userinfo.userNo }">
				<button onclick="updateForm()" class="btn btn-secondary">수정하기</button>
				<button onclick="removePost()" class="btn btn-secondary">삭제하기</button>
			</c:if>
		</div>
		<br>
       	<br>
        
        <img class="img-fluid rounded" src="${ root }/images/${qna.qnaImage}" alt="">
		<br>
		<br>
       	<p id='qna_title' style="font-size: 50px;">${qna.qnaTitle}</p> 
        <hr>

        <!-- Post Content -->
        <p id='qna_content' class="lead">${ qna.qnaContent }</p>
		
		<br>
		<div>
			<div style="float: left;">
				<p>Posted on ${qna.qnaDatetime}</p>
			</div>
			<div style="float: right;">
				<p>Written by ${ qna.name }</p>
			</div>
		</div>
		<br><br><br><br><br>
        <!-- Comments Form -->
        <div class="card my-4" style="width: 100%">
          <h5 class="card-header">Leave a Comment:</h5>
          <div class="card-body">
              <div class="form-group">
                <textarea id="reply_write" class="form-control" rows="3"></textarea>
              </div>
              <button onclick="insertReply();" class="btn btn-secondary">Submit</button>
          </div>
        </div>

		<br>
		
        <!-- Single Comment -->
        <div id="div_reply"></div>
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