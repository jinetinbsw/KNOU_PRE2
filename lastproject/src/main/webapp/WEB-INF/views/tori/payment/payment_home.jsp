<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>payment_home</title>
</head>
<body>
<h1><center><a href="${pageContext.request.contextPath}/home">home</a></center></h1>
<div class="container">
	<br><br><br><br>
	<fieldset>
	<legend>결제업무_선택</legend>
	<table class="table table-hover">
	<tr>
	<td><a href="#{pageContext.request.contextPath}/tori/payment/payment_add_form"><button class="btn btn-primary">결제관리</button></a></td>
	<td><a href="#{pageContext.request.contextPath}/tori/payment/payment_cancel_add_form"><button class="btn btn-primary">결제취소관리</button></a></td>
	</tr>
	<tr>
	<td><a href="#{pageContext.request.contextPath}/tori/payment/payment_add_form"><button class="btn btn-primary">카드결제관리</button></a></td>
	<td></td>
	</tr>
	</table>
	</fieldset>
</div>
<!-- 구성만 하는 화면 : 작성만 하고 링크를 걸지는 않는다! -->
</body>
</html>