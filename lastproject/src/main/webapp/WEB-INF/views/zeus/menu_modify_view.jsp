<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%@ include file="../modal/header.jsp" %>
<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>메뉴 화면</title>
</head>
<body>
<br>
<br>
<br>
<h1><center>메뉴  수정 화면</center></h1>
<br>
<center>
<form id="addform" action="${pageContext.request.contextPath}/menu_modify" method="post">
		
		<div>메뉴코드 : <input name ="menu_id" id ="menu_id" type ="text" value="${menu.menu_id}" readonly="readonly"/></div><br>
		<div>메뉴명: <input name ="menu_name" id ="menu_name" type ="text" value="${menu.menu_name}"/></div><br>
		<div>상품카테고리: <input name ="menu_cate" id ="menu_cate" type ="text" value="${menu.menu_cate}"/></div><br>
		<div>가격: <input name ="menu_price" id ="menu_price" type ="text" value="${menu.menu_price}"/></div><br>
		<div>할인여부 : <input name ="menu_sprice" id ="menu_sprice" type ="text" value="${menu.menu_sprice}"/></div><br>
		<div>칼로리: <input name ="menu_kcal" id ="menu_kcal" type ="text" value="${menu.menu_kcal}" readonly="readonly"/></div><br>
		
		

<br>
		<div>
			<input type="submit" id="addmenu" value="수정">
			<input type="reset" id="reset" value="초기화">
			<a href="${pageContext.request.contextPath}/menu_list">취소</a>
			<a href="${pageContext.request.contextPath}/menu_delete?menu_id=${menu.menu_id}">삭제</a>
		</div>
	</form>
<center>
</body>
</html>