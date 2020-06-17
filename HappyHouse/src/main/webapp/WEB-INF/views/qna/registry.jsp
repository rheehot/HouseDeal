<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<%@ include file="../setting.jsp"%>
<link rel='stylesheet' type='text/css' href='${root}/css/houselist.css' /> <!-- css/login.css -->
<title>QnA Registry</title>
<script type="text/javascript">
function submit(){
	$.ajax({
		type: 'POST',
		enctype: 'multipart/form-data',
		url : '/happyhouse/api/qna',
		data : new FormData($('#form')[0]),
		processData: false,
        contentType: false,
        cache: false,
        timeout: 600000,
        success: function (data) {
            $('#progress').show(100);
            $('#progress').append("<progress value='10' max='100'></progress> 업로드중 ...");
            setTimeout(function() {
                $('#progress').text('');
            	$('#progress').append("<progress value='30' max='100'></progress> 업로드중 ...");		
           	}, 1000);
            setTimeout(function() {
                $('#progress').text('');
            	$('#progress').append("<progress value='50' max='100'></progress> 업로드중 ...");		
           	}, 1700);
            setTimeout(function() {
                $('#progress').text('');
            	$('#progress').append("<progress value='75' max='100'></progress> 업로드중 ...");		
           	}, 2500);
            setTimeout(function() {
                $('#progress').text('');
            	$('#progress').append("<progress value='95' max='100'></progress> 업로드중 ...");		
           	}, 3000);
            setTimeout(function() {
            	location.href = "${root}/api/qna";			
           	}, 3500);
        },
        error: function (e) {
            console.log("ERROR : ", e);
        }
	});	
}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	
	<!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">Happy House 게시글 작성하기
    </h1>

    <div class="row">
      <!-- Blog Entries Column -->
      <div class="col-md-8">
      <div id="progress" style="display: none;"></div>
				<form id="form" method="post" enctype="multipart/form-data">
				<input type="hidden" name="qnaUserNo" value="${userinfo.userNo}"></input>
				<!-- Blog Post -->
				<div class="card mb-4">
					<img class="card-img-top" src="${ root }/images/no_image.png"
						alt="Card image cap">
					<div class="card-body">
						<h3>제목</h3>
						<h3>
							<input type="text" id="qnaTitle" name="qnaTitle" style="width: 100%;"></input>
						</h3>
						<p class="card-text">내용</p>
						<textarea type="text" id="qnaContent" name="qnaContent"
							style="width: 100%;"></textarea>
						<br> <a onclick="submit();" class="btn btn-secondary">글
							작성하기 &rarr;</a>
					</div>
					<div class="card-footer text-muted">
						<input id="filename" name="filename" type="file">
					</div>
				</div>
				</form>
			</div>


      <!-- Sidebar Widgets Column -->
      <div class="col-md-4">

        <!-- Search Widget -->
        <div class="card mb-4">
          <h5 class="card-header">인기 검색 목록 Top10!</h5>
          <div class="card-body">
          	<div class="input-group">
    			<%@ include file="../util/searchList.jsp"%>
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