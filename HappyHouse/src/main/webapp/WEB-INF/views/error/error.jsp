<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<%@ include file="../setting.jsp"%>
  <title>에러 page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
  <style type="text/css">
  </style>
</head>
<body>
<%@ include file="../header.jsp"%>
<div class="container" style="min-height: 580px;">
  <div class="jumbotron">
    <h1>처리중 에러가 발생했습니다.</h1>      
    <p>${ msg }</p>
  </div>  
  <p><a href="${ root }">메인으로 가기</a></p>
</div>
<%@ include file="../footer.jsp"%>
</body>
</html>
