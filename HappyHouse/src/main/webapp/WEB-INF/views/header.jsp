<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<!-- Navigation -->
<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
   <div class="container">
      <a class="navbar-brand" href="${ root }">Happy House</a>
      <button class="navbar-toggler navbar-toggler-right" type="button"
         data-toggle="collapse" data-target="#navbarResponsive"
         aria-controls="navbarResponsive" aria-expanded="false"
         aria-label="Toggle navigation">
         <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
         <ul class="navbar-nav ml-auto">
         <li class="nav-item"><a class="nav-link" href="${root}/move/dust">실시간 미세먼지 정보(temp)</a></li>
            <li class="nav-item"><a class="nav-link" href="about.html">공지사항</a></li>
            <li class="nav-item"><a class="nav-link" href="${root}/api/qna">QnA</a></li>
            <c:if test="${ userinfo == null }">
               <li class="nav-item"><a class="nav-link" href="${root}/user/loginpage">로그인</a></li>
               <li class="nav-item"><a class="nav-link" href="${root}/user/joinpage">회원가입</a></li>
            </c:if>
            <c:if test="${ userinfo != null }">
               <li class="nav-item"><a class="nav-link" href="${root}/move/house">HouseInfo</a></li>
               <li class="nav-item"><a class="nav-link" href="contact.html">대기환경 정보</a></li>
               <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog"
                  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <strong>${ userinfo.getName() } (${ userinfo.getId() })</strong>님 환영합니다.</a>
                  <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
                     <!-- admin일 경우 회원 목록 보기 + 삭제 기능 추가 -->
                     <c:if test="${userinfo.getId() eq 'admin'}">
                        <a class="dropdown-item" href="${ root }/user/userlist/1">회원관리</a>
                     </c:if>
                     <a class="dropdown-item" href="${ root }/favorite/changeloc">관심지역 변경</a>
                     <a class="dropdown-item" href="${ root }/user/updatepage">회원정보 수정</a>
                     <a class="dropdown-item" href="${ root }/user/logout">로그아웃</a>
                  </div>
               </li>
            </c:if>
         </ul>
      </div>
   </div>
</nav>